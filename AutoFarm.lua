local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Votes = ReplicatedStorage:WaitForChild("Votes")
local Voted = Votes:WaitForChild("Voted")
local MapVoted = Votes:WaitForChild("MapVoted")

local ResetRemote = ReplicatedStorage:WaitForChild("Sandbox"):WaitForChild("Reset")
local MorphEvent = ReplicatedStorage:WaitForChild("MorphEvent")
local ItemsEvent = ReplicatedStorage:WaitForChild("ItemsEvent")

print("===== [INIT] Remote Types =====")
print("[INIT] MorphEvent:", typeof(MorphEvent), "| IsA RemoteEvent:", MorphEvent:IsA("RemoteEvent"))
print("[INIT] ItemsEvent:", typeof(ItemsEvent), "| IsA RemoteEvent:", ItemsEvent:IsA("RemoteEvent"))
print("================================")

local AUTO_ENABLED = false
local RestartRequested = false
local MORPHED = false

local RunToken = 0
local ScriptStartTime = 0

local MovementMode = "None"
local OrbitPhaseActive = false

local OrbitCenter = Vector3.new(18, 12, 103)
local OrbitRadius = 3000
local OrbitLinearSpeed = 100
local OrbitSpeed = OrbitLinearSpeed / OrbitRadius
local OrbitAngle = 0

local SANDBOX_VOTE_DURATION = 20
local NECRO_VOTE_DURATION = 10
local PRE_MORPH_WAIT = 5
local PRE_MORPH_KILL_TIMER = 300
local PRE_MORPH_HP_TIMEOUT = 300

local STEP_SLASH_FARM = 300
local STEP_ORBIT_TIMER = 300
local WAVE_FINAL_THRESHOLD = 15

local STEP1_PRE_VOTE_DELAY = 9
local STEP12_GRAVITY_DELAY = 18

local CurrentTarget = nil
local CurrentTargetPart = nil
local NextTargetUpdate = 0

local HealthConnections = {}

local function IsActive(Token)
    return AUTO_ENABLED and Token == RunToken
end

local function ClearHealthConnections()
    for _, Connection in ipairs(HealthConnections) do
        pcall(function() Connection:Disconnect() end)
    end
    table.clear(HealthConnections)
end

local function SafeFire(Remote, ...)
    if not Remote or not Remote:IsA("RemoteEvent") then
        warn("[SafeFire] not a RemoteEvent:", Remote)
        return false
    end
    local Args = table.pack(...)
    local Success, Result = pcall(function()
        Remote:FireServer(table.unpack(Args, 1, Args.n))
    end)
    if not Success then warn("[SafeFire] error:", Result) end
    return Success
end

local function SafeVote(VoteRemote, Value)
    if not VoteRemote or not VoteRemote:IsA("RemoteEvent") then return false end
    local ok, err = pcall(function() VoteRemote:FireServer(Value) end)
    if not ok then warn("[SafeVote] error:", err) end
    return ok
end

local function WaitWhileEnabled(Duration, Token)
    local Start = tick()
    while tick() - Start < Duration do
        if not IsActive(Token) or RestartRequested then return false end
        task.wait(0.1)
    end
    return IsActive(Token) and not RestartRequested
end

local function GetWave()
    local ok, r = pcall(function()
        local g = LocalPlayer:FindFirstChild("PlayerGui")
        if not g then return -1 end
        local L = g:FindFirstChild("WaveCount", true)
        if not L then return -1 end
        return tonumber(L.Text:gsub("[^%d]", "")) or -1
    end)
    return ok and r or -1
end

local function GetCharacter()
    local C = LocalPlayer.Character
    if not C then return nil, nil, nil end
    return C, C:FindFirstChildOfClass("Humanoid"), C:FindFirstChild("HumanoidRootPart")
end

local function FindModelRoot(M)
    if not M or not M:IsA("Model") then return nil end
    if M.PrimaryPart then return M.PrimaryPart end
    for _, n in ipairs({"HumanoidRootPart","UpperTorso","Torso","LowerTorso"}) do
        local P = M:FindFirstChild(n, true)
        if P and P:IsA("BasePart") then return P end
    end
    return M:FindFirstChildWhichIsA("BasePart", true)
end

local function GetNearestEnemy()
    local E = workspace:FindFirstChild("Enemies")
    local _, H, R = GetCharacter()
    if not E or not R or not H or H.Health <= 0 then return nil, nil end
    local nm, np, nd = nil, nil, math.huge
    for _, M in ipairs(E:GetChildren()) do
        if M:IsA("Model") then
            local eh = M:FindFirstChildWhichIsA("Humanoid", true)
            local er = FindModelRoot(M)
            if eh and er and eh.Health > 0 then
                local d = (R.Position - er.Position).Magnitude
                if d < nd then nd, nm, np = d, M, er end
            end
        end
    end
    return nm, np
end

local function FindAbility(A, Name)
    if not A then return nil end
    local C = {Name}
    if Name == "Gravity Gun" then table.insert(C, "Gravity Blaster")
    elseif Name == "Gravity Blaster" then table.insert(C, "Gravity Gun") end
    for _, c in ipairs(C) do
        local ab = A:FindFirstChild(c)
        if ab and ab:FindFirstChild("RemoteEvent") then return ab end
    end
    return nil
end

local function UseAbility(Name)
    local C = LocalPlayer.Character
    if not C then return false end
    local A = C:FindFirstChild("Abilities")
    local ab = FindAbility(A, Name)
    if not ab then return false end
    return SafeFire(ab:FindFirstChild("RemoteEvent"))
end

local function UseItem(Name)
    return SafeFire(ItemsEvent, Name)
end

local function WaitForAbility(Name, Dur, Token)
    local S = tick()
    while tick() - S < Dur do
        if not IsActive(Token) or RestartRequested then return false end
        local C = LocalPlayer.Character
        local A = C and C:FindFirstChild("Abilities")
        if FindAbility(A, Name) then return true end
        task.wait(0.2)
    end
    return false
end

local function WaitForAliveCharacter(Token)
    while IsActive(Token) do
        local C, H = GetCharacter()
        if C and H and H.Health > 0 then return true end
        task.wait(0.2)
    end
    return false
end

local function IsNovaMech(char)
    if not char then return false end
    local lower = char.Name:lower()
    return string.find(lower, "nova") ~= nil or string.find(lower, "mech") ~= nil
end

local function StartHealthDetector(Token)
    ClearHealthConnections()

    local function Watch(C)
        task.spawn(function()
            local H = C:WaitForChild("Humanoid", 10)
            if not H or not IsActive(Token) then return end

            local function RequestRestart()
                if IsActive(Token) then
                    print("[Health] Character died / HP reached 0 -> restart from Step 1")
                    RestartRequested = true
                    MovementMode = "None"
                    OrbitPhaseActive = false
                    CurrentTarget = nil
                    CurrentTargetPart = nil
                end
            end

            table.insert(HealthConnections, H.Died:Connect(RequestRestart))
            table.insert(HealthConnections, H.HealthChanged:Connect(function(Health)
                if Health <= 0 then RequestRestart() end
            end))

            if H.Health <= 0 then
                RequestRestart()
            end
        end)
    end

    if LocalPlayer.Character then
        Watch(LocalPlayer.Character)
    end

    table.insert(HealthConnections, LocalPlayer.CharacterAdded:Connect(function(C)
        if IsActive(Token) then
            Watch(C)
        end
    end))
end

RunService.Heartbeat:Connect(function(DT)
    if not AUTO_ENABLED then return end
    local C, H, R = GetCharacter()
    if not C or not H or not R or H.Health <= 0 then return end

    if MovementMode == "NPC" then
        local valid = CurrentTarget and CurrentTarget.Parent and CurrentTargetPart and CurrentTargetPart.Parent
        if valid then
            local eh = CurrentTarget:FindFirstChildWhichIsA("Humanoid", true)
            if not eh or eh.Health <= 0 then valid = false end
        end
        if not valid or tick() >= NextTargetUpdate then
            CurrentTarget, CurrentTargetPart = GetNearestEnemy()
            NextTargetUpdate = tick() + 0.1
        end
        if CurrentTarget and CurrentTargetPart and CurrentTargetPart.Parent then
            local pos = CurrentTargetPart.Position + Vector3.new(0, 7, 0)
            local look = CurrentTargetPart.Position
            local D = look - pos
            if math.abs(D.X) < 0.01 and math.abs(D.Z) < 0.01 then
                look = look + Vector3.new(0.1, 0, 0)
            end
            C:PivotTo(CFrame.lookAt(pos, look))
        end

    elseif MovementMode == "Orbit" and OrbitPhaseActive then
        OrbitAngle += OrbitSpeed * DT
        local off = Vector3.new(math.cos(OrbitAngle) * OrbitRadius, 0, math.sin(OrbitAngle) * OrbitRadius)
        C:PivotTo(CFrame.lookAt(OrbitCenter + off, OrbitCenter))
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "Hack or Get Hack",
    LoadingTitle = "Auto Farm",
    LoadingSubtitle = "All-in-One",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "HackOrGetHack",
        FileName = "AutoFarm"
    }
})

local MainTab = Window:CreateTab("Main", nil)
local TestTab = Window:CreateTab("Test", nil)

MainTab:CreateParagraph({
    Title = "Auto Farm All-in-One",
    Content = "Step 1-5: vote + reset. Step 6-7: kill enemies 300s. Step 8: Nova Mech. Step 9: Slash farm 300s. Step 10: check HP. Step 11: Titan John Doe if HP full. Step 12: Orbit + Gravity Gun + Repair. Step 13: Orbit + Teleport + Call Speakers + infinite Gravity Gun. Step 14: restart all steps after death."
})

TestTab:CreateButton({
    Name = "TEST: Char Info",
    Callback = function()
        local C = LocalPlayer.Character
        print("[TEST] Character:", C and C.Name)
        print("[TEST] Is Nova Mech?", IsNovaMech(C))
        local H = C and C:FindFirstChildOfClass("Humanoid")
        if H then
            print("[TEST] HP:", H.Health, "/", H.MaxHealth, "(full:", H.Health >= H.MaxHealth, ")")
        end
        local A = C and C:FindFirstChild("Abilities")
        if A then
            print("[TEST] Has Slash?", FindAbility(A, "Slash") ~= nil)
            print("[TEST] Has Gravity Gun?", FindAbility(A, "Gravity Gun") ~= nil)
        end
    end
})

TestTab:CreateButton({
    Name = "TEST: Titan John Doe (direct)",
    Callback = function()
        print("[TEST] MorphEvent:FireServer('Titan John Doe', false, true)")
        MorphEvent:FireServer("Titan John Doe", false, true)
        print("[TEST] fired")
        task.wait(2)
        local C = LocalPlayer.Character
        print("[TEST] Char after:", C and C.Name)
    end
})

TestTab:CreateButton({
    Name = "TEST: Nova Mech (direct)",
    Callback = function()
        print("[TEST] MorphEvent:FireServer('Nova Mech', false, false)")
        MorphEvent:FireServer("Nova Mech", false, false)
        print("[TEST] fired")
        task.wait(2)
        local C = LocalPlayer.Character
        print("[TEST] Char after:", C and C.Name)
        print("[TEST] Is Nova Mech?", IsNovaMech(C))
    end
})

MainTab:CreateToggle({
    Name = "Auto Farm All-in-One",
    CurrentValue = false,
    Flag = "AutoFarmAllInOne",
    Callback = function(Value)
        RunToken += 1
        local Token = RunToken

        AUTO_ENABLED = Value
        RestartRequested = false
        MORPHED = false
        MovementMode = "None"
        OrbitPhaseActive = false
        CurrentTarget = nil
        CurrentTargetPart = nil
        ClearHealthConnections()

        if not Value then
            print("[Toggle] OFF")
            return
        end

        print("[Toggle] ON | token:", Token)
        ScriptStartTime = tick()
        StartHealthDetector(Token)

        task.spawn(function()
            while IsActive(Token) do
                if RestartRequested then
                    print("[Restart] Handling death restart")
                    MovementMode = "None"
                    OrbitPhaseActive = false
                    CurrentTarget = nil
                    CurrentTargetPart = nil
                    MORPHED = false

                    if not WaitForAliveCharacter(Token) then break end

                    RestartRequested = false
                    print("[Restart] Character alive. Returning to Step 1.")
                    if not WaitWhileEnabled(1, Token) then break end
                end

                if not IsActive(Token) then break end

                MovementMode = "None"
                OrbitPhaseActive = false
                CurrentTarget = nil
                CurrentTargetPart = nil

                -- STEP 1: Wait 9s, then vote Sandbox + Crossroad for 20s
                print("[Step 1] Waiting", STEP1_PRE_VOTE_DELAY, "s before voting")
                if not WaitWhileEnabled(STEP1_PRE_VOTE_DELAY, Token) then break end

                print("[Step 1] Voting Sandbox + Crossroad (", SANDBOX_VOTE_DURATION, "s)")
                local S1 = tick()
                while IsActive(Token) and not RestartRequested
                    and tick() - S1 < SANDBOX_VOTE_DURATION do

                    SafeVote(Voted, "Sandbox")
                    SafeVote(MapVoted, "Crossroad")
                    task.wait(0.1)
                end
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 2
                print("[Step 2] Waiting 3s")
                if not WaitWhileEnabled(3, Token) then break end

                -- STEP 3
                print("[Step 3] Resetting 150x")
                for i = 1, 150 do
                    if not IsActive(Token) or RestartRequested then break end
                    SafeFire(ResetRemote, "ReSeTsAnDbOxMODe")
                    if i % 50 == 0 then
                        print("  [Step 3]", i, "/150")
                    end
                    task.wait(0.1)
                end
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 4
                print("[Step 4] Voting Necro + Crossroad (", NECRO_VOTE_DURATION, "s)")
                local S4 = tick()
                while IsActive(Token) and not RestartRequested
                    and tick() - S4 < NECRO_VOTE_DURATION do

                    SafeVote(Voted, "Necro")
                    SafeVote(MapVoted, "Crossroad")
                    task.wait(0.1)
                end
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 5
                print("[Step 5] Waiting", PRE_MORPH_WAIT, "s before kill phase")
                if not WaitWhileEnabled(PRE_MORPH_WAIT, Token) then break end
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 6-7: Kill enemies 300s (SILENT)
                local char = LocalPlayer.Character
                local abilities = char and char:FindFirstChild("Abilities")
                local hasSlash = abilities and FindAbility(abilities, "Slash") ~= nil

                if hasSlash then
                    MovementMode = "NPC"
                    NextTargetUpdate = 0
                    local killStart = tick()

                    while IsActive(Token) and not RestartRequested
                        and tick() - killStart < PRE_MORPH_KILL_TIMER do

                        UseAbility("Slash")
                        task.wait(0.1)
                    end

                    MovementMode = "None"
                    CurrentTarget = nil
                    CurrentTargetPart = nil
                end

                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 8: Morph Nova Mech (retry 3x)
                print("[Step 8] Morph Nova Mech (retry 3x)")
                if not WaitForAliveCharacter(Token) then break end

                local oldChar = LocalPlayer.Character
                local morphSuccess = false

                for attempt = 1, 3 do
                    if not IsActive(Token) or RestartRequested then break end

                    MorphEvent:FireServer("Nova Mech", false, false)
                    print("  attempt", attempt, "fired")

                    local waitStart = tick()
                    while tick() - waitStart < 3 do
                        if not IsActive(Token) or RestartRequested then break end
                        local newChar = LocalPlayer.Character
                        if newChar and (newChar ~= oldChar or IsNovaMech(newChar)) then
                            morphSuccess = true
                            print("  MORPH DETECTED:", newChar.Name)
                            break
                        end
                        task.wait(0.1)
                    end

                    if morphSuccess then break end
                    print("  attempt", attempt, "no morph, retry...")
                    task.wait(1)
                end

                if not morphSuccess then
                    print("[Step 8] WARNING: morph not detected after 3 attempts")
                end

                MORPHED = true
                if not WaitWhileEnabled(2, Token) then break end
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 9: Slash farm for 300 seconds
                print("[Step 9] Waiting for Slash")
                local sr = WaitForAbility("Slash", 8, Token)
                print("  Slash ready:", sr)
                if not IsActive(Token) or RestartRequested then continue end

                print("[Step 9] Slash farming", STEP_SLASH_FARM, "s")
                MovementMode = "NPC"
                NextTargetUpdate = 0

                local step9Start = tick()
                local lastLog9 = 0

                while IsActive(Token) and not RestartRequested
                    and tick() - step9Start < STEP_SLASH_FARM do

                    UseAbility("Slash")

                    if tick() - lastLog9 > 30 then
                        local elapsed = math.floor(tick() - step9Start)
                        local remain = math.floor(STEP_SLASH_FARM - elapsed)
                        print("  elapsed:", elapsed, "s | remain:", remain, "s")
                        lastLog9 = tick()
                    end

                    task.wait(0.1)
                end

                MovementMode = "None"
                CurrentTarget = nil
                CurrentTargetPart = nil
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 10: Check health after Step 9 timer reaches 0
                print("[Step 10] Checking Health")
                local C, H = GetCharacter()
                local HealthFull = H and H.Health > 0 and H.Health >= H.MaxHealth

                if H then
                    print("  HP:", H.Health, "/", H.MaxHealth)
                else
                    print("  Humanoid not found")
                end

                print("  Health Full:", HealthFull)
                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 11: Buy Titan John Doe only if health is full
                if HealthFull then
                    print("[Step 11] Buying Titan John Doe")
                    MorphEvent:FireServer("Titan John Doe", false, true)
                    if not WaitWhileEnabled(3, Token) then break end
                else
                    print("[Step 11] SKIPPED: Health is not full")
                end

                if not IsActive(Token) or RestartRequested then continue end

                -- STEP 12: Orbit + Gravity Gun, wait 18s, Repair, repeat
                print("[Step 12] Waiting Gravity Gun")
                local gg = WaitForAbility("Gravity Gun", 8, Token)
                print("  ready:", gg)
                if not IsActive(Token) or RestartRequested then continue end

                print("[Step 12] Orbit + Gravity Gun + Repair")
                OrbitAngle = 0
                OrbitPhaseActive = true
                MovementMode = "Orbit"

                local step12Start = tick()
                local lastLog12 = 0
                local w15 = false

                while IsActive(Token) and not RestartRequested do
                    local elapsed = tick() - step12Start
                    local W = GetWave()

                    if elapsed >= STEP_ORBIT_TIMER or W >= WAVE_FINAL_THRESHOLD then
                        w15 = true
                        print("  Exiting Step 12. Elapsed:", math.floor(elapsed), "s")
                        break
                    end

                    UseAbility("Gravity Gun")
                    if not WaitWhileEnabled(STEP12_GRAVITY_DELAY, Token) then break end

                    if GetWave() >= WAVE_FINAL_THRESHOLD then
                        w15 = true
                        break
                    end

                    UseItem("Repair")

                    if tick() - lastLog12 > 30 then
                        local el = math.floor(tick() - step12Start)
                        local rem = math.floor(STEP_ORBIT_TIMER - el)
                        print("  elapsed:", el, "s | remain:", rem, "s")
                        lastLog12 = tick()
                    end
                end

                if not IsActive(Token) or RestartRequested then
                    MovementMode = "None"
                    OrbitPhaseActive = false
                    continue
                end

                -- STEP 13: Orbit + Teleport, wait 3s, Call Speakers, infinite Gravity Gun
                if w15 then
                    print("[Step 13] Orbit + Teleport")
                    UseAbility("Teleport")

                    if not WaitWhileEnabled(3, Token) then break end

                    print("[Step 13] Buying Call Speakers")
                    UseItem("Call Speakers")

                    print("[Step 13] Infinite Gravity Gun spam")
                    while IsActive(Token) and not RestartRequested do
                        UseAbility("Gravity Gun")
                        if not WaitWhileEnabled(0.1, Token) then break end
                    end
                end

                MovementMode = "None"
                OrbitPhaseActive = false
            end

            print("[Loop] ended")
            if Token == RunToken then
                MovementMode = "None"
                OrbitPhaseActive = false
                CurrentTarget = nil
                CurrentTargetPart = nil
                ClearHealthConnections()
            end
        end)
    end
})

Rayfield:LoadConfiguration()
