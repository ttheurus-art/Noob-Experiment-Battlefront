-- Hack or Get Hack | Auto Farm
-- Part 1/2

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Configuration
local VOTE_DURATION = 10
local RESET_COUNT = 150
local RESET_DELAY = 0.1
local WAIT_AFTER_RESET = 21
local REQUIRED_MONEY = 5000

local ORBIT_CENTER = Vector3.new(18, 12, 103)
local ORBIT_RADIUS = 3000
local ORBIT_SPEED = 5

local TARGET_WAVE = 15
local PRE_WAVE_DELAY = 12
local POST_WAVE_GRAVITY_DELAY = 1

local HEALTH_DETECT_DELAY = 180
local ScriptStartTime = os.clock()
local HealthZeroDetected = false

local AutoFarmEnabled = true
local OrbitEnabled = true
local CleanupEnabled = true

local MainStarted = false
local PostWaveSequenceDone = false

-- Rayfield
local Rayfield = loadstring(game:HttpGet(
    "https://sirius.menu/rayfield"
))()

local Window = Rayfield:CreateWindow({
    Name = "Hack or Get Hack | Auto Farm",
    LoadingTitle = "Auto Farm",
    LoadingSubtitle = "Client",
    ConfigurationSaving = {
        Enabled = false
    }
})

local MainTab = Window:CreateTab("Main", nil)

local StatusParagraph = MainTab:CreateParagraph({
    Title = "Status",
    Content = "Starting..."
})

local WaveParagraph = MainTab:CreateParagraph({
    Title = "Current Wave",
    Content = "..."
})

local function SetStatus(message)
    pcall(function()
        StatusParagraph:Set({
            Title = "Status",
            Content = message
        })
    end)
end

-- Remote Helper
local function GetRemote(parent, name)
    local object = parent and parent:FindFirstChild(name)

    if object and object:IsA("RemoteEvent") then
        return object
    end

    return nil
end

local function FireItemsEvent(argument)
    local event = GetRemote(ReplicatedStorage, "ItemsEvent")

    if not event then
        warn("ItemsEvent not found")
        return false
    end

    event:FireServer(argument)
    return true
end

-- Money Scanner
local function GetMoney()
    local gui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local intermission = gui and gui:FindFirstChild("Intermission")
    local frame = intermission and intermission:FindFirstChild("IntermissionFrame")
    local moneyLabel = frame and frame:FindFirstChild("MoneyAmount")

    if not moneyLabel then
        return 0
    end

    return tonumber(tostring(moneyLabel.Text):match("%d+")) or 0
end

-- Wave Scanner
local function GetWave()
    local gui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local gameStatus = gui and gui:FindFirstChild("GameStatus")
    local status = gameStatus and gameStatus:FindFirstChild("Status")
    local waveLabel = status and status:FindFirstChild("WaveCount")

    if not waveLabel then
        return 0
    end

    return tonumber(tostring(waveLabel.Text):match("%d+")) or 0
end

local function UpdateWaveParagraph()
    local gui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local gameStatus = gui and gui:FindFirstChild("GameStatus")
    local status = gameStatus and gameStatus:FindFirstChild("Status")
    local waveLabel = status and status:FindFirstChild("WaveCount")

    local displayedText = waveLabel and waveLabel.Text or "..."

    pcall(function()
        WaveParagraph:Set({
            Title = "Current Wave",
            Content = displayedText
        })
    end)
end

-- Vote
local function RunVotes()
    local votes = ReplicatedStorage:FindFirstChild("Votes")
    local voteEvent = GetRemote(votes, "Voted")
    local mapEvent = GetRemote(votes, "MapVoted")

    if not voteEvent or not mapEvent then
        warn("Vote events not found")
        return false
    end

    local endTime = os.clock() + VOTE_DURATION

    repeat
        if not AutoFarmEnabled then
            return false
        end

        voteEvent:FireServer("Sandbox")
        mapEvent:FireServer("Crossroad")

        task.wait()
    until os.clock() >= endTime

    return true
end

-- Sandbox Reset
local function RunSandboxReset()
    local sandbox = ReplicatedStorage:FindFirstChild("Sandbox")
    local resetEvent = GetRemote(sandbox, "Reset")

    if not resetEvent then
        warn("Sandbox.Reset not found")
        return false
    end

    for i = 1, RESET_COUNT do
        if not AutoFarmEnabled then
            return false
        end

        resetEvent:FireServer("ReSeTsAnDbOxMODe")
        task.wait(RESET_DELAY)
    end

    return true
end

-- Wait for money
local function WaitForMoney()
    SetStatus("Waiting for at least 5000 money...")

    while AutoFarmEnabled do
        if GetMoney() >= REQUIRED_MONEY then
            return true
        end

        task.wait(0.5)
    end

    return false
end

-- Purchase Titan
local function PurchaseTitan()
    SetStatus("Calling Special Titans...")

    if not FireItemsEvent("Call Special Titans") then
        return false
    end

    task.wait(0.1)

    SetStatus("Calling Titan John Doe...")

    return FireItemsEvent("Titan John Doe")
end

-- Wait Helper
local function WaitWhileEnabled(seconds)
    local endTime = os.clock() + seconds

    while AutoFarmEnabled and os.clock() < endTime do
        task.wait(0.05)
    end
end

-- Orbit
local OrbitAngle = 0
local OrbitConnection = nil

local function GetCharacterRoot()
    local character = LocalPlayer.Character

    if not character then
        return nil
    end

    return character:FindFirstChild("HumanoidRootPart")
end

local function StartOrbit()
    if OrbitConnection then
        OrbitConnection:Disconnect()
        OrbitConnection = nil
    end

    OrbitAngle = 0

    OrbitConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not AutoFarmEnabled or not OrbitEnabled then
            return
        end

        local root = GetCharacterRoot()

        if not root then
            return
        end

        OrbitAngle += ORBIT_SPEED * deltaTime

        local offset = Vector3.new(
            math.cos(OrbitAngle) * ORBIT_RADIUS,
            0,
            math.sin(OrbitAngle) * ORBIT_RADIUS
        )

        local targetPosition = ORBIT_CENTER + offset

        root.CFrame = CFrame.lookAt(
            targetPosition,
            ORBIT_CENTER
        )
    end)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if not AutoFarmEnabled or not OrbitEnabled then
        return
    end

    character:WaitForChild("HumanoidRootPart", 10)

    if AutoFarmEnabled and OrbitEnabled then
        StartOrbit()
    end
end)

if LocalPlayer.Character then
    StartOrbit()
end

-- Enemy Cleanup
local EnemiesFolder = Workspace:WaitForChild("Enemies")

local EXCLUDED_ENEMIES = {
    ["Necromancer Titan"] = true,
    ["Upgraded Necromancer Titan"] = true
}

local PRESERVED_CHILDREN = {
    ["Stats"] = true,
    ["AnimSaves"] = true,
    ["Humanoid"] = true,
    ["HealthBar"] = true
}

local function CleanEnemy(enemy)
    if not CleanupEnabled then
        return
    end

    if EXCLUDED_ENEMIES[enemy.Name] then
        return
    end

    for _, child in ipairs(enemy:GetChildren()) do
        if not PRESERVED_CHILDREN[child.Name] then
            child:Destroy()
        end
    end
end

local function SetupEnemyCleanup()
    for _, enemy in ipairs(EnemiesFolder:GetChildren()) do
        CleanEnemy(enemy)
    end

    EnemiesFolder.ChildAdded:Connect(function(enemy)
        task.wait()
        CleanEnemy(enemy)
    end)
end

SetupEnemyCleanup()

-- Part 2/2

-- Health Detector
local function IsHealthZero()
    if os.clock() - ScriptStartTime < HEALTH_DETECT_DELAY then
        return false
    end

    if HealthZeroDetected then
        return true
    end

    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid and humanoid.Health <= 0 then
        HealthZeroDetected = true
        return true
    end

    return false
end

-- Detect death after the 3-minute delay
local function MonitorCharacterHealth(character)
    local humanoid = character:WaitForChild("Humanoid", 10)

    if not humanoid then
        return
    end

    humanoid.Died:Connect(function()
        if os.clock() - ScriptStartTime >= HEALTH_DETECT_DELAY then
            HealthZeroDetected = true
        end
    end)
end

if LocalPlayer.Character then
    task.spawn(MonitorCharacterHealth, LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    task.spawn(MonitorCharacterHealth, character)
end)

-- Override wait helper to detect Health 0
WaitWhileEnabled = function(seconds)
    local endTime = os.clock() + seconds

    while AutoFarmEnabled and os.clock() < endTime do
        if IsHealthZero() then
            return false
        end

        task.wait(0.05)
    end

    return AutoFarmEnabled and not IsHealthZero()
end

-- Override vote function
RunVotes = function()
    local votes = ReplicatedStorage:FindFirstChild("Votes")
    local voteEvent = GetRemote(votes, "Voted")
    local mapEvent = GetRemote(votes, "MapVoted")

    if not voteEvent or not mapEvent then
        warn("Vote events not found")
        return false
    end

    local endTime = os.clock() + VOTE_DURATION

    repeat
        if not AutoFarmEnabled or IsHealthZero() then
            return false
        end

        voteEvent:FireServer("Sandbox")
        mapEvent:FireServer("Crossroad")

        task.wait()
    until os.clock() >= endTime

    return true
end

-- Override reset function
RunSandboxReset = function()
    local sandbox = ReplicatedStorage:FindFirstChild("Sandbox")
    local resetEvent = GetRemote(sandbox, "Reset")

    if not resetEvent then
        warn("Sandbox.Reset not found")
        return false
    end

    for i = 1, RESET_COUNT do
        if not AutoFarmEnabled or IsHealthZero() then
            return false
        end

        resetEvent:FireServer("ReSeTsAnDbOxMODe")
        task.wait(RESET_DELAY)
    end

    return true
end

-- Override money scanner wait
WaitForMoney = function()
    SetStatus("Waiting for at least 5000 money...")

    while AutoFarmEnabled do
        if IsHealthZero() then
            return false
        end

        if GetMoney() >= REQUIRED_MONEY then
            return true
        end

        task.wait(0.5)
    end

    return false
end

-- Gravity Blaster
local function FireGravityBlaster()
    local character = LocalPlayer.Character
    local abilities = character and character:FindFirstChild("Abilities")
    local gravityBlaster = abilities and abilities:FindFirstChild("Gravity Blaster")
    local event = gravityBlaster and gravityBlaster:FindFirstChild("RemoteEvent")

    if event and event:IsA("RemoteEvent") then
        event:FireServer()
        return true
    end

    return false
end

-- Teleport
local function FireTeleport()
    local character = LocalPlayer.Character
    local abilities = character and character:FindFirstChild("Abilities")
    local teleport = abilities and abilities:FindFirstChild("Teleport")
    local event = teleport and teleport:FindFirstChild("RemoteEvent")

    if event and event:IsA("RemoteEvent") then
        event:FireServer()
        return true
    end

    return false
end

-- Pre-Wave 15 Combat
local function RunPreWaveCombat()
    SetStatus("Running pre-Wave 15 sequence...")

    while AutoFarmEnabled and GetWave() < TARGET_WAVE do
        if IsHealthZero() then
            return false
        end

        FireGravityBlaster()

        if not WaitWhileEnabled(PRE_WAVE_DELAY) then
            return false
        end

        if GetWave() < TARGET_WAVE then
            FireItemsEvent("Repair")
        end

        UpdateWaveParagraph()
    end

    return AutoFarmEnabled and not IsHealthZero()
end

-- Wave 15 Sequence
local function RunWave15Sequence()
    if PostWaveSequenceDone then
        return
    end

    if IsHealthZero() then
        return
    end

    SetStatus("Wave 15 reached!")

    FireItemsEvent("Repair")
    FireTeleport()

    if not WaitWhileEnabled(3) then
        return
    end

    FireItemsEvent("Call Speakers")

    PostWaveSequenceDone = true
    SetStatus("Wave 15 sequence completed.")
end

-- After Wave 15
local function RunPostWaveCombat()
    SetStatus("Post-Wave 15: Gravity Blaster")

    while AutoFarmEnabled do
        if IsHealthZero() then
            return "RESTART"
        end

        FireGravityBlaster()
        UpdateWaveParagraph()

        if not WaitWhileEnabled(POST_WAVE_GRAVITY_DELAY) then
            if IsHealthZero() then
                return "RESTART"
            end

            return "STOP"
        end
    end

    return "STOP"
end

-- Full Farming Cycle
local function RunFarmCycle()
    SetStatus("Voting Sandbox and Crossroad...")

    if not RunVotes() then
        return IsHealthZero() and "RESTART" or false
    end

    if not WaitWhileEnabled(5) then
        return IsHealthZero() and "RESTART" or false
    end

    SetStatus("Resetting Sandbox...")

    if not RunSandboxReset() then
        return IsHealthZero() and "RESTART" or false
    end

    if not WaitWhileEnabled(WAIT_AFTER_RESET) then
        return IsHealthZero() and "RESTART" or false
    end

    if not WaitForMoney() then
        return IsHealthZero() and "RESTART" or false
    end

    if IsHealthZero() then
        return "RESTART"
    end

    if not PurchaseTitan() then
        return false
    end

    SetStatus("Waiting for Wave 15...")

    if not RunPreWaveCombat() then
        return IsHealthZero() and "RESTART" or false
    end

    if GetWave() >= TARGET_WAVE then
        RunWave15Sequence()

        if IsHealthZero() then
            return "RESTART"
        end

        return RunPostWaveCombat()
    end

    return false
end

-- Main Loop
task.spawn(function()
    if MainStarted then
        return
    end

    MainStarted = true

    while AutoFarmEnabled do
        PostWaveSequenceDone = false

        local result = RunFarmCycle()

        if result == "RESTART" or IsHealthZero() then
            SetStatus("Health reached 0. Restarting farm...")

            HealthZeroDetected = false

            -- Wait for the character to respawn
            if not LocalPlayer.Character
                or not LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                or LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then

                LocalPlayer.CharacterAdded:Wait()
            end

            task.wait(1)

        elseif result == "STOP" or not AutoFarmEnabled then
            break
        else
            task.wait(1)
        end
    end

    SetStatus("Auto Farm stopped.")
end)
