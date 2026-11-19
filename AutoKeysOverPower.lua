-- Hack or Get Hack | Auto Farm

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- SETTINGS

local AUTO_FARM = false
local ORBIT_ENABLED = false
local CLEANUP_ENABLED = false

local ORBIT_SPEED = 0.2
local ORBIT_RADIUS = 3000
local ORBIT_CENTER = Vector3.new(18, 12, 103)

local SCRIPT_START_TIME = os.clock()
local HEALTH_DETECTOR_DELAY = 180

local RestartRequested = false
local MovementMode = "None"

local PRESERVED_NAMES = {
    Stats = true,
    AnimSaves = true,
    Humanoid = true,
    HealthBar = true
}

local EXCLUDED_ENEMIES = {
    ["Necromancer Titan"] = true,
    ["Upgraded Necromancer Titan"] = true
}

-- REMOTES

local Votes = ReplicatedStorage:WaitForChild("Votes")
local Voted = Votes:WaitForChild("Voted")
local MapVoted = Votes:WaitForChild("MapVoted")

local ResetRemote = ReplicatedStorage
    :WaitForChild("Sandbox")
    :WaitForChild("Reset")

local MorphEvent = ReplicatedStorage:WaitForChild("MorphEvent")
local ItemsEvent = ReplicatedStorage:WaitForChild("ItemsEvent")

-- HELPERS

local function SafeFire(remote, ...)
    if not remote then return false end

    return pcall(function()
        remote:FireServer(...)
    end)
end

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetRoot(character)
    character = character or GetCharacter()
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid(character)
    character = character or GetCharacter()
    return character and character:FindFirstChildOfClass("Humanoid")
end

local function GetNested(parent, ...)
    local current = parent

    for _, name in ipairs({...}) do
        if not current then return nil end
        current = current:FindFirstChild(name)
    end

    return current
end

local function ReadNumber(object)
    if not object then return 0 end

    local digits = tostring(object.Text or ""):gsub("[^%d]", "")
    return tonumber(digits) or 0
end

local function GetMoney()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")

    return ReadNumber(GetNested(
        gui,
        "Intermission",
        "IntermissionFrame",
        "MoneyAmount"
    ))
end

local function GetWave()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")

    return ReadNumber(GetNested(
        gui,
        "GameStatus",
        "Status",
        "WaveCount"
    ))
end

local function WaitWhileEnabled(seconds)
    local elapsed = 0

    while elapsed < seconds do
        if not AUTO_FARM or RestartRequested then
            return false
        end

        local step = math.min(0.1, seconds - elapsed)
        task.wait(step)
        elapsed += step
    end

    return AUTO_FARM and not RestartRequested
end

-- ENEMY TARGET

local function GetNearestEnemy()
    local enemies = workspace:FindFirstChild("Enemies")
    local root = GetRoot()

    if not enemies or not root then return nil end

    local nearest = nil
    local nearestDistance = math.huge

    for _, enemy in ipairs(enemies:GetChildren()) do
        if not EXCLUDED_ENEMIES[enemy.Name] then
            local humanoid = enemy:FindFirstChildOfClass("Humanoid")
            local enemyRoot =
                enemy:FindFirstChild("HumanoidRootPart")
                or enemy.PrimaryPart

            if humanoid and enemyRoot and humanoid.Health > 0 then
                local distance = (root.Position - enemyRoot.Position).Magnitude

                if distance < nearestDistance then
                    nearestDistance = distance
                    nearest = enemy
                end
            end
        end
    end

    return nearest
end

-- MOVEMENT CONTROLLER

local OrbitAngle = 0

RunService.Heartbeat:Connect(function(deltaTime)
    if not AUTO_FARM or not ORBIT_ENABLED then
        return
    end

    local character = GetCharacter()
    local root = GetRoot(character)
    local humanoid = GetHumanoid(character)

    if not root or not humanoid or humanoid.Health <= 0 then
        return
    end

    if MovementMode == "NPC" then
        local enemy = GetNearestEnemy()

        if enemy then
            local enemyRoot =
                enemy:FindFirstChild("HumanoidRootPart")
                or enemy.PrimaryPart

            if enemyRoot then
                local position = enemyRoot.Position + Vector3.new(0, 7, 0)

                root.CFrame = CFrame.lookAt(position, enemyRoot.Position)
            end
        end

    elseif MovementMode == "Orbit" then
        OrbitAngle += ORBIT_SPEED * deltaTime

        local offset = Vector3.new(
            math.cos(OrbitAngle) * ORBIT_RADIUS,
            0,
            math.sin(OrbitAngle) * ORBIT_RADIUS
        )

        local position = ORBIT_CENTER + offset

        root.CFrame = CFrame.lookAt(position, ORBIT_CENTER)
    end
end)

local function StartOrbit()
    MovementMode = ORBIT_ENABLED and "Orbit" or "None"
end

-- ENEMY CLEANUP

local function CleanEnemy()
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return end

    for _, enemy in ipairs(enemies:GetChildren()) do
        if not EXCLUDED_ENEMIES[enemy.Name] then
            for _, child in ipairs(enemy:GetChildren()) do
                if not PRESERVED_NAMES[child.Name] then
                    child:Destroy()
                end
            end
        end
    end
end

task.spawn(function()
    while true do
        if CLEANUP_ENABLED then
            CleanEnemy()
        end

        task.wait(1)
    end
end)

-- MONEY PHASE

local function RunMoneyPhase()
    MovementMode = "NPC"

    while AUTO_FARM and not RestartRequested do
        if GetMoney() > 5000 then
            break
        end

        local character = GetCharacter()
        local abilities = character and character:FindFirstChild("Abilities")
        local slash = abilities and abilities:FindFirstChild("Slash")
        local slashRemote = slash and slash:FindFirstChild("RemoteEvent")

        if slashRemote then
            SafeFire(slashRemote)
        end

        task.wait(0.1)
    end

    MovementMode = "None"

    return AUTO_FARM and not RestartRequested
end

-- ITEMS / ABILITIES

local function UseItem(itemName)
    SafeFire(ItemsEvent, itemName)
end

local function UseAbility(abilityName)
    local character = GetCharacter()
    local abilities = character and character:FindFirstChild("Abilities")
    local ability = abilities and abilities:FindFirstChild(abilityName)
    local remote = ability and ability:FindFirstChild("RemoteEvent")

    if remote then
        SafeFire(remote)
    end
end

-- WAVE SYSTEM

local function RunWaveSystem()
    while AUTO_FARM and not RestartRequested and GetWave() < 15 do
        UseAbility("Gravity Blaster")

        if not WaitWhileEnabled(12) then
            return false
        end

        UseItem("Repair")
    end

    if not AUTO_FARM or RestartRequested then
        return false
    end

    if GetWave() >= 15 then
        UseItem("Repair")
        UseAbility("Teleport")

        if not WaitWhileEnabled(3) then
            return false
        end

        UseItem("Call Speakers")
    end

    while AUTO_FARM and not RestartRequested and GetWave() > 15 do
        UseAbility("Gravity Blaster")

        if not WaitWhileEnabled(1) then
            return false
        end
    end

    return true
end

-- HEALTH DETECTOR

local function AttachHealthDetector(character)
    if os.clock() - SCRIPT_START_TIME < HEALTH_DETECTOR_DELAY then
        return
    end

    local humanoid = character:WaitForChild("Humanoid", 10)
    if not humanoid then return end

    humanoid.Died:Connect(function()
        if os.clock() - SCRIPT_START_TIME >= HEALTH_DETECTOR_DELAY then
            if AUTO_FARM then
                RestartRequested = true
            end
        end
    end)
end

if LocalPlayer.Character then
    task.spawn(AttachHealthDetector, LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    task.spawn(AttachHealthDetector, character)
end)

-- AUTO FARM CYCLE

local function RunCycle()
    RestartRequested = false

    -- Initial Sandbox vote
    SafeFire(Voted, "Sandbox")
    SafeFire(MapVoted, "Crossroad")

    if not WaitWhileEnabled(20) then return end
    if not WaitWhileEnabled(3) then return end

    -- Reset 150 times, delay 0.1
    for i = 1, 150 do
        if not AUTO_FARM or RestartRequested then return end

        SafeFire(ResetRemote, "ReSeTsAnDbOxMODe")

        if not WaitWhileEnabled(0.1) then return end
    end

    -- Necro vote after all resets
    SafeFire(Voted, "Necro")
    SafeFire(MapVoted, "Crossroad")

    if not WaitWhileEnabled(20) then return end
    if not WaitWhileEnabled(18) then return end

    -- Morph
    SafeFire(MorphEvent, "Nova Mech", false, false)

    if not WaitWhileEnabled(1) then return end

    -- NPC follow + Slash until Money > 5000
    if not RunMoneyPhase() then return end

    -- Call items
    UseItem("Call Special Titans")

    if not WaitWhileEnabled(0.1) then return end

    UseItem("Titan John Doe")

    if not WaitWhileEnabled(1) then return end

    -- Orbit
    StartOrbit()

    -- Wave 15 behavior
    RunWaveSystem()

    MovementMode = "None"
end

-- RESTART LOOP

task.spawn(function()
    while true do
        if AUTO_FARM then
            RestartRequested = false
            RunCycle()

            if RestartRequested then
                MovementMode = "None"

                repeat
                    task.wait(0.5)
                until not AUTO_FARM
                    or (
                        GetCharacter()
                        and GetHumanoid()
                        and GetHumanoid().Health > 0
                    )

                if AUTO_FARM then
                    task.wait(1)
                end
            else
                task.wait(0.5)
            end
        else
            MovementMode = "None"
            task.wait(0.5)
        end
    end
end)

-- RAYFIELD UI

local Rayfield = loadstring(
    game:HttpGet("https://sirius.menu/rayfield")
)()

local Window = Rayfield:CreateWindow({
    Name = "Hack or Get Hack",
    LoadingTitle = "Auto Farm",
    LoadingSubtitle = "Settings",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "HackOrGetHack",
        FileName = "AutoFarm"
    }
})

local MainTab = Window:CreateTab("Main", nil)

MainTab:CreateParagraph({
    Title = "Hack or Get Hack",
    Content = "Auto Farm Settings"
})

local AutoFarmToggle
local OrbitToggle
local CleanupToggle

MainTab:CreateButton({
    Name = "Enable All",
    Callback = function()
        AutoFarmToggle:Set(true)
        OrbitToggle:Set(true)
        CleanupToggle:Set(true)
    end
})

AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        AUTO_FARM = Value

        if not Value then
            MovementMode = "None"
            RestartRequested = false
        end
    end
})

OrbitToggle = MainTab:CreateToggle({
    Name = "Orbit",
    CurrentValue = false,
    Flag = "Orbit",
    Callback = function(Value)
        ORBIT_ENABLED = Value

        if not Value then
            MovementMode = "None"
        elseif AUTO_FARM then
            StartOrbit()
        end
    end
})

CleanupToggle = MainTab:CreateToggle({
    Name = "Enemy Cleanup",
    CurrentValue = false,
    Flag = "EnemyCleanup",
    Callback = function(Value)
        CLEANUP_ENABLED = Value
    end
})

MainTab:CreateSlider({
    Name = "Orbit Speed",
    Range = {0.2, 10},
    Increment = 0.1,
    Suffix = "Speed",
    CurrentValue = 0.2,
    Flag = "OrbitSpeed",
    Callback = function(Value)
        ORBIT_SPEED = Value
    end
})

MainTab:CreateButton({
    Name = "Disable All",
    Callback = function()
        AutoFarmToggle:Set(false)
        OrbitToggle:Set(false)
        CleanupToggle:Set(false)
    end
})

Rayfield:LoadConfiguration()
