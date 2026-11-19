
-- Hack or Get Hack
-- Rayfield UI + Settings + Vote + Reset + Money + Orbit

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Configuration
local VOTE_DURATION = 20
local WAIT_AFTER_VOTE = 3

local RESET_COUNT = 150
local RESET_DELAY = 0.1
local WAIT_AFTER_RESET = 23

local REQUIRED_MONEY = 5000

local ORBIT_CENTER = Vector3.new(18, 12, 103)
local ORBIT_RADIUS = 3000
local ORBIT_SPEED = 0.2

local HEALTH_DETECT_DELAY = 180
local ScriptStartTime = os.clock()

-- States
local AutoFarmEnabled = true
local OrbitEnabled = true
local CleanupEnabled = true

local OrbitUnlocked = false
local HealthZeroDetected = false

local OrbitConnection = nil
local OrbitAngle = 0

-- Rayfield
local Rayfield = loadstring(game:HttpGet(
    "https://sirius.menu/rayfield"
))()

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

-- Paragraph
local StatusParagraph = MainTab:CreateParagraph({
    Title = "Auto Farm Status",
    Content = "Ready"
})

local function SetStatus(message)
    pcall(function()
        StatusParagraph:Set({
            Title = "Auto Farm Status",
            Content = message
        })
    end)
end

-- UI References
local AutoFarmToggle
local OrbitToggle
local CleanupToggle

-- Enable All
MainTab:CreateButton({
    Name = "Enable All",

    Callback = function()
        AutoFarmToggle:Set(true)
        OrbitToggle:Set(true)
        CleanupToggle:Set(true)
    end
})

-- Auto Farm Toggle
AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = true,
    Flag = "AutoFarm",

    Callback = function(Value)
        AutoFarmEnabled = Value
        SetStatus(Value and "Auto Farm enabled" or "Auto Farm disabled")
    end
})

-- Orbit Toggle
OrbitToggle = MainTab:CreateToggle({
    Name = "Orbit",
    CurrentValue = true,
    Flag = "Orbit",

    Callback = function(Value)
        OrbitEnabled = Value
    end
})

-- Cleanup Toggle
CleanupToggle = MainTab:CreateToggle({
    Name = "Enemy Cleanup",
    CurrentValue = true,
    Flag = "Cleanup",

    Callback = function(Value)
        CleanupEnabled = Value
    end
})

-- Orbit Speed
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

-- Disable All
MainTab:CreateButton({
    Name = "Disable All",

    Callback = function()
        AutoFarmToggle:Set(false)
        OrbitToggle:Set(false)
        CleanupToggle:Set(false)
    end
})

-- Load Configuration
Rayfield:LoadConfiguration()

-- Remote Helper
local function GetRemote(parent, name)
    local object = parent and parent:FindFirstChild(name)

    if object and object:IsA("RemoteEvent") then
        return object
    end

    return nil
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

local function WaitForMoney()
    SetStatus("Waiting for money above 5000...")

    while AutoFarmEnabled do
        if GetMoney() > REQUIRED_MONEY then
            return true
        end

        task.wait(0.5)
    end

    return false
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

    SetStatus("Voting Sandbox and Crossroad...")

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

    SetStatus("Resetting Sandbox...")

    for i = 1, RESET_COUNT do
        if not AutoFarmEnabled then
            return false
        end

        resetEvent:FireServer("ReSeTsAnDbOxMODe")
        task.wait(RESET_DELAY)
    end

    return true
end

-- Orbit
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
        if not OrbitUnlocked or not OrbitEnabled then
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

-- Respawn Support
LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart", 10)

    if OrbitUnlocked and OrbitEnabled then
        StartOrbit()
    end
end)

-- Health Detection
local function MonitorHealth(character)
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
    task.spawn(MonitorHealth, LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    task.spawn(MonitorHealth, character)
end)

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

-- Wait Helper
local function WaitWhileEnabled(seconds)
    local endTime = os.clock() + seconds

    while AutoFarmEnabled and os.clock() < endTime do
        if IsHealthZero() then
            return false
        end

        task.wait(0.05)
    end

    return AutoFarmEnabled and not IsHealthZero()
end

-- Main Preparation Cycle
local function RunPreparation()
    if not RunVotes() then
        return false
    end

    if not WaitWhileEnabled(WAIT_AFTER_VOTE) then
        return false
    end

    if not RunSandboxReset() then
        return false
    end

    SetStatus("Waiting 23 seconds before Orbit...")

    if not WaitWhileEnabled(WAIT_AFTER_RESET) then
        return false
    end

    OrbitUnlocked = true

    if OrbitEnabled then
        StartOrbit()
    end

    SetStatus("Waiting for money above 5000...")

    if not WaitForMoney() then
        return false
    end

    SetStatus("Money requirement reached.")

    return true
end

-- Start
task.spawn(function()
    SetStatus("Ready")

    while true do
        if not AutoFarmEnabled then
            task.wait(0.2)
            continue
        end

        if IsHealthZero() then
            SetStatus("Health 0 detected. Waiting for respawn...")

            repeat
                task.wait(0.2)
            until LocalPlayer.Character
                and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0

            HealthZeroDetected = false
            OrbitUnlocked = false

            if OrbitConnection then
                OrbitConnection:Disconnect()
                OrbitConnection = nil
            end

            task.wait(1)
            continue
        end

        RunPreparation()

        if IsHealthZero() then
            continue
        end

        task.wait(1)
    end
end)
