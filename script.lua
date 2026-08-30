--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Noob Experiment: Battlefront V2.7🔥",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Everything Made By 13 Y/O Kid",
   LoadingSubtitle = "Lil BrickBattler",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "FunscriptsGuiFF1"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/85cMYuy4J", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "To Verify your not a bot, Please type: Key1109888",
      Note = "Key is required to continue!", -- Use this to tell the user how to get a key
      FileName = "Keyforent1r11", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Key1109888"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local p = Instance.new("Part")
p.Size = Vector3.new(500, 15, 500)
p.Position = Vector3.new(1575, -469, 555)
p.Anchored = true
p.CanCollide = true
p.Transparency = 0.3
p.Parent = workspace

local p2 = Instance.new("Part")
p2.Size = Vector3.new(45, 5, 45)
p2.Position = Vector3.new(1690, -498, -139)
p2.Anchored = true
p2.CanCollide = true
p2.Transparency = 1
p2.Parent = workspace

local MainTab = Window:CreateTab("Information", nil)

MainTab:CreateSection("Update")

MainTab:CreateParagraph({
    Title = "+ Visualizer thingy\n",
    Content = "ill let anyone upload my script if i got perm ban\n\n make the audio in setting (in game not in script) to 0 if you want to use the music so you only hear 1 music\n\n theres a trick that allow you to delete npc, you need titan builderman for this if you have it just teleport to safe zone on main👍 then use Hook and wait a little until it fall to the void"
})

local MoneyDisplay = MainTab:CreateParagraph({
    Title = "Stats",
    Content = "Keys: Loading...\nTime Essence: Loading...\nMoney: Loading..."
})

task.spawn(function()
    while true do
        local player = game:GetService("Players").LocalPlayer

        local moneyAmount = player.PlayerGui
            :WaitForChild("Intermission")
            :WaitForChild("IntermissionFrame")
            :WaitForChild("MoneyAmount")

        local leaderstats = player:WaitForChild("leaderstats")
        local timeEssences = leaderstats:WaitForChild("Time Essences")
        local keys = leaderstats:WaitForChild("Keys")

        MoneyDisplay:Set({
            Title = "Stats",
            Content = "Keys: " .. keys.Value
                .. "\nTime Essence: " .. timeEssences.Value
                .. "\nMoney: " .. moneyAmount.Text
        })

        task.wait(0.2)
    end
end)

local MainTab = Window:CreateTab("Shop", nil)
local MainSection = MainTab:CreateSection("You can buy thing")


Rayfield:Notify({
   Title = "Welcome!",
   Content = "Enjoy Player!",
   Duration = 4.5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Call Titans (Shop 2000 money)",
   Callback = function()

local Event = game:GetService("ReplicatedStorage").ItemsEvent
Event:FireServer(
    "Call Titans"
)
end,
})

local Button = MainTab:CreateButton({
   Name = "Call Special Titans (Shop 5000 money)",
   Callback = function()

local Event = game:GetService("ReplicatedStorage").ItemsEvent
Event:FireServer(
    "Call Special Titans"
)
end,
})


local MainSection = MainTab:CreateSection("shop set (if not use the right unit it bug)")

local Button = MainTab:CreateButton({
    Name = "Buy >Noob< pack (1000 money and for newbie)",

    Callback = function()

        local Event = game:GetService("ReplicatedStorage").ItemsEvent

        Event:FireServer("Blaster")
        Event:FireServer("Jetpack")
        Event:FireServer("Sword")
        Event:FireServer("Grenade")

    end,
})

local MainTab = Window:CreateTab("Main👍", nil)
local MainSection = MainTab:CreateSection("buying thing🧿")

local Button = MainTab:CreateButton({
   Name = "Buy Speaker (750 money)(weak)",
   Callback = function()


local Event = game:GetService("ReplicatedStorage").ItemsEvent
Event:FireServer(
    "Call Speakers"
)
end,
})

local Button = MainTab:CreateButton({
   Name = "Buy Bloxxer Cannon (3000 money)",
   Callback = function()

local Event = game:GetService("ReplicatedStorage").ItemsEvent
Event:FireServer(
    "Call Bloxxer Cannon"
)
end,
})

local MainSection = MainTab:CreateSection("Teleport🤔")

local Button = MainTab:CreateButton({
   Name = "Teleport to safe area👾 (not 100% safe)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1575, -444, 555))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Teleport to lobby inside💠 (No Titans)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1689, -490, -138))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Teleport to lobby outside🃏",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1747, -399, -146))
   end,
})


local Button = MainTab:CreateButton({
   Name = "Teleport Back (WayPoint I Think)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(557, 178, -430))
   end,
})

local MainSection = MainTab:CreateSection("Auto Thing🔫")

local Running = false

MainTab:CreateToggle({
    Name = "Auto Missle And Auto Reload (Guest Mech Only)",
    CurrentValue = false,

    Callback = function(Value)
        Running = Value

        if Value then

            -- Auto Missile
            task.spawn(function()
                while Running do
                    local Event = game:GetService("Players").LocalPlayer.Character.Abilities.Missiles.RemoteEvent
                    Event:FireServer()

                    task.wait(0.2)
                end
            end)

            -- Auto Reload
            task.spawn(function()
                while Running do
                    local Event = game:GetService("ReplicatedStorage").ItemsEvent
                    Event:FireServer("Refill Rockets")

                    task.wait(2.3)
                end
            end)

        end
    end,
})

local AttackRunning = false

MainTab:CreateToggle({
    Name = "Auto M1 / Attack",
    CurrentValue = false,
    Flag = "AutoAttack",

    Callback = function(Value)
        AttackRunning = Value

        if not Value then
            return
        end

        task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            while AttackRunning do
                local character = player.Character

                if character then
                    local abilities = character:FindFirstChild("Abilities")

                    if abilities then
                        local slash = abilities:FindFirstChild("Slash")
                        local punch = abilities:FindFirstChild("Punch")
                        local sword = abilities:FindFirstChild("Sword")
                        local combo = abilities:FindFirstChild("Combo")
                        local drill = abilities:FindFirstChild("Drill")
						local hit = abilities:FindFirstChild("Hit")
                        local energysword = abilities:FindFirstChild("Energy Sword")
						local knife = abilities:FindFirstChild("Knife")
								
                        local slashEvent = slash and slash:FindFirstChild("RemoteEvent")
                        local punchEvent = punch and punch:FindFirstChild("RemoteEvent")
                        local swordEvent = sword and sword:FindFirstChild("RemoteEvent")
                        local comboEvent = combo and combo:FindFirstChild("RemoteEvent")
                        local drillEvent = drill and drill:FindFirstChild("RemoteEvent")
						local hitEvent = hit and hit:FindFirstChild("RemoteEvent")
                        local energyswordEvent = energysword and energysword:FindFirstChild("RemoteEvent")
						local knifeEvent = knife and knife:FindFirstChild("RemoteEvent")
								
                        if slashEvent then
                            slashEvent:FireServer()
                        end

                        if punchEvent then
                            punchEvent:FireServer()
                        end

                        if swordEvent then
                            swordEvent:FireServer()
                        end
								
						if knifeEvent then
                            knifeEvent:FireServer()
								end
								
                        if drillEvent then
                            drillEvent:FireServer()
								end

						if energyswordEvent then
                            energyswordEvent:FireServer()
								end

                        if hitEvent then
                            hitEvent:FireServer()
								end
								
                        if comboEvent then
                            comboEvent:FireServer()
                        end
                    end
                end

                task.wait(0.1)
            end
        end)
    end,
})

local ProjectileRunning = false

MainTab:CreateToggle({
    Name = "Auto Projectile / Shoot",
    CurrentValue = false,
    Flag = "AutoProjectile",

    Callback = function(Value)
        ProjectileRunning = Value

        if not Value then
            return
        end

        task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            while ProjectileRunning do
                local character = player.Character

                if character then
                    local abilities = character:FindFirstChild("Abilities")

                    if abilities then
                        local blasters = abilities:FindFirstChild("Blasters")
                        local blaster = abilities:FindFirstChild("Blaster")
                        local rocket = abilities:FindFirstChild("Rocket")
                        local rockets = abilities:FindFirstChild("Rockets")
                        local rocketlaunchers = abilities:FindFirstChild("Rocket Launchers")
						local rocketlauncher = abilities:FindFirstChild("Rocket Launcher")

                        local blastersEvent = blasters and blasters:FindFirstChild("RemoteEvent")
                        local blasterEvent = blaster and blaster:FindFirstChild("RemoteEvent")
                        local rocketEvent = rocket and rocket:FindFirstChild("RemoteEvent")
                        local rocketsEvent = rockets and rockets:FindFirstChild("RemoteEvent")
                        local rocketlaunchersEvent = rocketlaunchers and rocketlaunchers:FindFirstChild("RemoteEvent")
						local rocketlauncherEvent = rocketlauncher and rocketlauncher:FindFirstChild("RemoteEvent")

                        if blastersEvent then
                            blastersEvent:FireServer()
                        end

                        if blasterEvent then
                            blasterEvent:FireServer()
                        end

                        if rocketEvent then
                            rocketEvent:FireServer()
                        end

                        if rocketsEvent then
                            rocketsEvent:FireServer()
						end

						if rocketlauncherEvent then
                            rocketlauncherEvent:FireServer()
								end

                        if rocketlaunchersEvent then
                            rocketlaunchersEvent:FireServer()
                        end
                    end
                end

                task.wait(0.1)
            end
        end)
    end,
})

local EssenceRunning = false

MainTab:CreateToggle({
    Name = "Auto TP Time Essence",
    CurrentValue = false,
    Flag = "AutoTPTimeEssence",

    Callback = function(Value)
        EssenceRunning = Value

        if not Value then
            return
        end

        task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            while EssenceRunning do
                local character = player.Character
                local essence = workspace:FindFirstChild("TimeEssence")

                if character and essence then
                    local targetCFrame

                    if essence:IsA("BasePart") then
                        targetCFrame = essence.CFrame
                    elseif essence:IsA("Model") then
                        targetCFrame = essence:GetPivot()
                    else
                        local part = essence:FindFirstChildWhichIsA("BasePart", true)

                        if part then
                            targetCFrame = part.CFrame
                        end
                    end

                    if targetCFrame then
                        character:PivotTo(targetCFrame)
                    end
                end

                task.wait(0.1)
            end
        end)
    end,
})

local MainTab = Window:CreateTab("Fun👁️", nil)
local MainSection = MainTab:CreateSection("I dont know what I make")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local RagdollSpinRunning = false
local SpinSpeed = 99
local MinImpulse = 900
local MaxImpulse = 3500
local FlingCooldown = 0.3

local TouchConnections = {}
local LastFling = 0

local function DisconnectTouches()
    for _, connection in ipairs(TouchConnections) do
        connection:Disconnect()
    end

    table.clear(TouchConnections)
end

local function StartRagdoll(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.AutoRotate = false
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
end

local function StopRagdoll(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.AutoRotate = true
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

local function FlingCharacter(character)
    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    local now = os.clock()

    if now - LastFling < FlingCooldown then
        return
    end

    LastFling = now

    local direction = Vector3.new(
        math.random(-100, 100) / 100,
        math.random(20, 40) / 100,
        math.random(-100, 100) / 100
    )

    if direction.Magnitude < 0.1 then
        direction = Vector3.new(1, 0.3, 0)
    end

    direction = direction.Unit

    local impulse = math.random(MinImpulse, MaxImpulse)

    root:ApplyImpulse(
        direction * impulse * root.AssemblyMass
    )
end

local function SetupTouchDetection(character)
    DisconnectTouches()

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            table.insert(TouchConnections, part.Touched:Connect(function(hit)
                if not RagdollSpinRunning then
                    return
                end

                if not hit or hit:IsDescendantOf(character) then
                    return
                end

                FlingCharacter(character)
            end))
        end
    end
end

MainTab:CreateToggle({
    Name = "I CALL IT SLINGINGING",
    CurrentValue = false,
    Flag = "RagdollSpinFling",

    Callback = function(Value)
        RagdollSpinRunning = Value

        local character = player.Character
        if not character then
            return
        end

        if not Value then
            DisconnectTouches()
            StopRagdoll(character)
            return
        end

        StartRagdoll(character)
        SetupTouchDetection(character)

        task.spawn(function()
            while RagdollSpinRunning do
                local currentCharacter = player.Character
                local root = currentCharacter
                    and currentCharacter:FindFirstChild("HumanoidRootPart")

                if root then
                    root.AssemblyAngularVelocity = Vector3.new(
                        0,
                        SpinSpeed,
                        0
                    )
                end

                RunService.Heartbeat:Wait()
            end
        end)
    end,
})

--// MUSIC

local SoundService = game:GetService("SoundService")

local MusicList = {
    ["None"] = nil,
    ["AFTERTASTE"] = "85281675332105",
    ["Creation of Hatred"] = "111304986203081",
	["Eternity V1"] = "128855377868949",
	["At The Speed of Light"] = "117386268398589",
	["The Great Strategy"] = "122220105663741"
}

local CustomMusicID = ""
local MusicVolume = 5
local SelectedMusicID = nil

-- Sound sementara untuk script
local CustomMusic = Instance.new("Sound")
CustomMusic.Name = "NoobExperiment_CustomMusic"
CustomMusic.Parent = SoundService
CustomMusic.Looped = true
CustomMusic.Volume = MusicVolume

local function StartMusic(ID)
    if not ID or ID == "" then
        return
    end

    CustomMusic:Stop()
    CustomMusic.SoundId = "rbxassetid://" .. ID
    CustomMusic.Volume = MusicVolume
    CustomMusic:Play()
end

MainTab:CreateSection("Music")

--// CUSTOM MUSIC ID
MainTab:CreateInput({
    Name = "Music ID",
    PlaceholderText = "Enter Roblox Music ID...",
    RemoveTextAfterFocusLost = false,

    Callback = function(Text)
        CustomMusicID = Text
    end,
})

--// START CUSTOM MUSIC
MainTab:CreateButton({
    Name = "Start Music",

    Callback = function()
        if CustomMusicID ~= "" then
            StartMusic(CustomMusicID)
        elseif SelectedMusicID then
            StartMusic(SelectedMusicID)
        end
    end,
})

--// STOP MUSIC
MainTab:CreateButton({
    Name = "Stop Music",

    Callback = function()
        CustomMusic:Stop()
    end,
})

--// PRESET MUSIC
MainTab:CreateDropdown({
    Name = "Select Music",

    Options = {
        "None",
        "AFTERTASTE",
        "Creation of Hatred",
		"Eternity V1",
		"At The Speed of Light",
		"The Great Strategy"
    },

    CurrentOption = {"None"},
    MultipleOptions = false,

    Callback = function(Option)
        local SelectedName = Option[1]
        SelectedMusicID = MusicList[SelectedName]
    end,
})

--// VOLUME 0.1 - 10
MainTab:CreateSlider({
    Name = "Music Volume",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "/10",
    CurrentValue = 2.5,

    Callback = function(Value)
        MusicVolume = Value
        CustomMusic.Volume = Value
    end,
})

--==================================================
--// LIGHTWEIGHT WAVE VISUALIZER
--// Masuk ke MainTab
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")


--==================================================
--// CLEAN UP SAAT SCRIPT DI-RELOAD
--==================================================

local OldVisualizer = PlayerGui:FindFirstChild(
    "NoobExperiment_Visualizer"
)

if OldVisualizer then
    OldVisualizer:Destroy()
end


--==================================================
--// SETTINGS
--==================================================

local VisualizerEnabled = true
local VisualizerColor = Color3.fromRGB(255, 40, 40)

local BAR_COUNT = 28
local MAX_HEIGHT = 30

local Bars = {}


--==================================================
--// VISUALIZER GUI
--==================================================

local VisualizerGui = Instance.new("ScreenGui")

VisualizerGui.Name = "NoobExperiment_Visualizer"
VisualizerGui.ResetOnSpawn = false
VisualizerGui.IgnoreGuiInset = true
VisualizerGui.DisplayOrder = 5
VisualizerGui.Parent = PlayerGui


local VisualizerFrame = Instance.new("Frame")

VisualizerFrame.Name = "Visualizer"

VisualizerFrame.AnchorPoint =
    Vector2.new(0.5, 1)

-- Sedikit turun dari bagian paling bawah
VisualizerFrame.Position =
    UDim2.new(0.5, 0, 1, 8)

-- Menyesuaikan lebar layar
VisualizerFrame.Size =
    UDim2.new(1, -12, 0, MAX_HEIGHT)

VisualizerFrame.BackgroundTransparency = 1
VisualizerFrame.BorderSizePixel = 0
VisualizerFrame.Parent = VisualizerGui


--==================================================
--// CREATE 28 BARS
--==================================================

for i = 1, BAR_COUNT do

    local Bar = Instance.new("Frame")

    Bar.Name = "Bar_" .. i

    Bar.AnchorPoint =
        Vector2.new(0.5, 1)

    -- Dibagi rata sepanjang layar
    Bar.Position =
        UDim2.new(
            (i - 0.5) / BAR_COUNT,
            0,
            1,
            0
        )

    -- Kotak dibuat lebih besar
    Bar.Size =
        UDim2.new(
            1 / BAR_COUNT,
            -4,
            0,
            5
        )

    Bar.BackgroundColor3 =
        VisualizerColor

    Bar.BackgroundTransparency = 0.05
    Bar.BorderSizePixel = 0

    Bar.Parent = VisualizerFrame

    Bars[i] = Bar

end


--==================================================
--// WAVE ANIMATION
--==================================================

local Time = 0

local VisualizerConnection

VisualizerConnection =
    RunService.Heartbeat:Connect(function(DeltaTime)

    if not VisualizerEnabled then
        return
    end

    -- Membatasi DeltaTime supaya tetap stabil
    Time += math.min(DeltaTime, 0.05)


    for i, Bar in ipairs(Bars) do

        -- Gelombang utama
        local Wave =
            math.sin(
                Time * 3 +
                i * 0.55
            )


        -- Gelombang kedua untuk variasi
        local Wave2 =
            math.sin(
                Time * 1.6 +
                i * 0.25
            )


        -- Tinggi bar
        local Height =
            4 +
            ((Wave + 1) * 0.5) * 17 +
            ((Wave2 + 1) * 0.5) * 5


        Bar.Size =
            UDim2.new(
                1 / BAR_COUNT,
                -4,
                0,
                math.clamp(
                    Height,
                    4,
                    MAX_HEIGHT
                )
            )

    end

end)


--==================================================
--// VISUALIZER CONTROLS
--// SEMUANYA MASUK MainTab
--==================================================

MainTab:CreateSection(
    "Wave Visualizer"
)


--==================================================
--// ENABLE VISUALIZER
--==================================================

MainTab:CreateToggle({

    Name = "Enable Wave Visualizer",

    CurrentValue = true,

    Callback = function(Value)

        VisualizerEnabled = Value

        VisualizerFrame.Visible = Value

    end,

})

--// WAVE COLOR
local WaveColor = Color3.fromRGB(255, 0, 0)

MainTab:CreateColorPicker({
    Name = "Wave Color",
    Color = WaveColor,
    Callback = function(Color)
        WaveColor = Color

        -- Update warna semua bar wave
        for _, Bar in ipairs(WaveBars) do
            if Bar then
                Bar.BackgroundColor3 = Color
            end
        end
    end,
})

--==================================================
--// LOW HEALTH VISUAL
--// 4 CORNER VIGNETTE
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- CLEAN UP PREVIOUS VERSION
--==================================================

local OldGui = PlayerGui:FindFirstChild("NoobExperiment_LowHealth")

if OldGui then
    OldGui:Destroy()
end

local OldBlur = Lighting:FindFirstChild(
    "NoobExperiment_LowHealthBlur"
)

if OldBlur then
    OldBlur:Destroy()
end

--==================================================
-- SETTINGS
--==================================================

local Enabled = false

local CurrentHumanoid = nil
local NormalWalkSpeed = 16

local HealthConnection = nil
local DeathEffectRunning = false

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")

Gui.Name = "NoobExperiment_LowHealth"
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 20
Gui.Parent = PlayerGui

--==================================================
-- VIGNETTE CONTAINER
--==================================================

local VignetteFolder = Instance.new("Folder")
VignetteFolder.Name = "CornerVignette"
VignetteFolder.Parent = Gui

--==================================================
-- CREATE SOFT CORNER
--==================================================

local function CreateSoftCorner(Name, Position, AnchorPoint)

    local Container = Instance.new("Frame")

    Container.Name = Name
    Container.AnchorPoint = AnchorPoint
    Container.Position = Position

    -- Besar supaya merah bisa menyebar jauh
    Container.Size = UDim2.fromScale(0.65, 0.65)

    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0

    Container.ZIndex = 5
    Container.Parent = VignetteFolder


    -- Banyak layer lingkaran transparan.
    -- Ini membuat efek menyebar/fade,
    -- bukan kotak solid.

    local Layers = {}

    local LayerData = {
        {0.05, 0.72},
        {0.16, 0.78},
        {0.28, 0.84},
        {0.40, 0.90},
        {0.52, 0.94},
        {0.64, 0.97},
        {0.76, 0.985},
        {0.88, 0.995},
        {1.00, 1.00},
    }

    for i, Data in ipairs(LayerData) do

        local Size = Data[1]
        local Transparency = Data[2]

        local Layer = Instance.new("Frame")

        Layer.Name = "Layer" .. i

        Layer.AnchorPoint =
            Vector2.new(0.5, 0.5)

        Layer.Position =
            UDim2.fromScale(0.5, 0.5)

        Layer.Size =
            UDim2.fromScale(Size, Size)

        Layer.BackgroundColor3 =
            Color3.fromRGB(255, 0, 0)

        Layer.BackgroundTransparency =
            Transparency

        Layer.BorderSizePixel = 0

        Layer.ZIndex = 5

        Layer.Parent = Container


        local Corner =
            Instance.new("UICorner")

        Corner.CornerRadius =
            UDim.new(1, 0)

        Corner.Parent = Layer


        table.insert(
            Layers,
            Layer
        )
    end

    return {
        Container = Container,
        Layers = Layers
    }
end

--==================================================
-- FOUR CORNERS
--==================================================

local TopLeft = CreateSoftCorner(
    "TopLeft",
    UDim2.fromScale(0, 0),
    Vector2.new(0, 0)
)

local TopRight = CreateSoftCorner(
    "TopRight",
    UDim2.fromScale(1, 0),
    Vector2.new(1, 0)
)

local BottomLeft = CreateSoftCorner(
    "BottomLeft",
    UDim2.fromScale(0, 1),
    Vector2.new(0, 1)
)

local BottomRight = CreateSoftCorner(
    "BottomRight",
    UDim2.fromScale(1, 1),
    Vector2.new(1, 1)
)

local Corners = {
    TopLeft,
    TopRight,
    BottomLeft,
    BottomRight
}

--==================================================
-- RED FLASH
--==================================================

local Flash = Instance.new("Frame")

Flash.Name = "RedFlash"

Flash.Size =
    UDim2.fromScale(1, 1)

Flash.BackgroundColor3 =
    Color3.fromRGB(255, 0, 0)

Flash.BackgroundTransparency = 1

Flash.BorderSizePixel = 0
Flash.ZIndex = 10

Flash.Parent = Gui

--==================================================
-- DEATH SCREEN
--==================================================

local DeathScreen = Instance.new("Frame")

DeathScreen.Name = "DeathScreen"

DeathScreen.Size =
    UDim2.fromScale(1, 1)

DeathScreen.BackgroundColor3 =
    Color3.fromRGB(255, 0, 0)

DeathScreen.BackgroundTransparency = 1

DeathScreen.BorderSizePixel = 0
DeathScreen.ZIndex = 100

DeathScreen.Parent = Gui

--==================================================
-- BLUR
--==================================================

local Blur = Instance.new("BlurEffect")

Blur.Name =
    "NoobExperiment_LowHealthBlur"

Blur.Size = 0
Blur.Parent = Lighting

--==================================================
-- HIDE VIGNETTE
--==================================================

local function HideCorners()

    for _, Corner in ipairs(Corners) do

        Corner.Container.Visible = false

    end
end

--==================================================
-- SET VIGNETTE STRENGTH
--==================================================

local function SetCornerStrength(Strength)

    for _, Corner in ipairs(Corners) do

        Corner.Container.Visible = true

        local Layers =
            Corner.Layers

        for i, Layer in ipairs(Layers) do

            local BaseTransparency =
                0.70 + ((i - 1) * 0.037)

            local Transparency =
                BaseTransparency +
                (Strength * 0.25)

            Layer.BackgroundTransparency =
                math.clamp(
                    Transparency,
                    0,
                    0.995
                )
        end
    end
end

--==================================================
-- RESET
--==================================================

local function ResetEffects()

    HideCorners()

    Flash.BackgroundTransparency = 1

    DeathScreen.BackgroundTransparency = 1

    Blur.Size = 0

    DeathEffectRunning = false

    if CurrentHumanoid
        and CurrentHumanoid.Parent then

        CurrentHumanoid.WalkSpeed =
            NormalWalkSpeed
    end
end

--==================================================
-- DEATH EFFECT
-- RED FULL -> BLACK
-- 0.5 SECOND
--==================================================

local function DeathEffect(Humanoid)

    if DeathEffectRunning then
        return
    end

    DeathEffectRunning = true

    HideCorners()

    Flash.BackgroundTransparency = 1

    Blur.Size = 0

    if Humanoid
        and Humanoid.Parent then

        Humanoid.WalkSpeed =
            NormalWalkSpeed
    end

    -- FULL RED

    DeathScreen.BackgroundColor3 =
        Color3.fromRGB(255, 0, 0)

    DeathScreen.BackgroundTransparency = 0


    -- RED -> BLACK
    -- 0.5 SECOND

    local StartTime = os.clock()
    local Duration = 0.5

    while
        os.clock() - StartTime < Duration
    do

        local Progress =
            math.clamp(
                (os.clock() - StartTime)
                / Duration,
                0,
                1
            )

        DeathScreen.BackgroundColor3 =
            Color3.fromRGB(
                math.floor(
                    255 * (1 - Progress)
                ),
                0,
                0
            )

        RunService.RenderStepped:Wait()
    end

    DeathScreen.BackgroundColor3 =
        Color3.fromRGB(0, 0, 0)

    DeathScreen.BackgroundTransparency = 0
end

--==================================================
-- CHARACTER SETUP
--==================================================

local function SetupCharacter(Character)

    local Humanoid =
        Character:WaitForChild("Humanoid")

    CurrentHumanoid =
        Humanoid

    NormalWalkSpeed =
        Humanoid.WalkSpeed

    DeathEffectRunning = false

    ResetEffects()


    if HealthConnection then
        HealthConnection:Disconnect()
    end


    HealthConnection =
        RunService.Heartbeat:Connect(function()

        if not Enabled then

            ResetEffects()

            return
        end


        if not Humanoid
            or not Humanoid.Parent then

            return
        end


        local MaxHealth =
            Humanoid.MaxHealth

        local Health =
            Humanoid.Health


        if MaxHealth <= 0 then
            return
        end


        --==================================================
        -- DEAD
        --==================================================

        if Health <= 0 then

            if not DeathEffectRunning then

                task.spawn(function()
                    DeathEffect(Humanoid)
                end)

            end

            return
        end


        if DeathEffectRunning then
            return
        end


        local Percent =
            Health / MaxHealth


        --==================================================
        -- BELOW 35%
        -- CORNER RED 10%
        --==================================================

        if Percent < 0.35 then

            SetCornerStrength(0.10)

        else

            HideCorners()

        end


        --==================================================
        -- BELOW 25%
        -- CORNER RED 25%
        -- SLOW RED BLINK
        -- SPEED +10%
        --==================================================

        if Percent < 0.25 then

            SetCornerStrength(0.25)


            local Pulse =
                (
                    math.sin(
                        os.clock()
                        * math.pi
                        * 2
                        / 1.7
                    ) + 1
                ) / 2


            Flash.BackgroundTransparency =
                0.75 +
                ((1 - Pulse) * 0.25)


            Humanoid.WalkSpeed =
                NormalWalkSpeed * 1.10

        else

            Flash.BackgroundTransparency = 1

        end


        --==================================================
        -- BELOW 10%
        -- CORNER RED 50%
        -- BLUR 35%
        -- SPEED +50%
        --==================================================

        if Percent < 0.10 then

            SetCornerStrength(0.50)

            Blur.Size = 35

            Humanoid.WalkSpeed =
                NormalWalkSpeed * 1.50

        end


        --==================================================
        -- BELOW 5%
        -- FAST BLINK 0.75 SECOND
        -- BLUR 85
        -- SPEED +150%
        --==================================================

        if Percent < 0.05 then

            SetCornerStrength(0.50)


            local FastPulse =
                (
                    math.sin(
                        os.clock()
                        * math.pi
                        * 2
                        / 0.75
                    ) + 1
                ) / 2


            Flash.BackgroundTransparency =
                0.75 +
                ((1 - FastPulse) * 0.25)


            Blur.Size = 85


            -- +150%
            -- = 2.5x normal speed

            Humanoid.WalkSpeed =
                NormalWalkSpeed * 2.50

        end

    end)
end

--==================================================
-- CURRENT CHARACTER
--==================================================

if Player.Character then

    task.spawn(
        SetupCharacter,
        Player.Character
    )

end

--==================================================
-- RESPAWN
--==================================================

Player.CharacterAdded:Connect(function(Character)

    task.spawn(
        SetupCharacter,
        Character
    )

end)

--==================================================
-- MAIN TAB
--==================================================

MainTab:CreateSection(
    "Low Health Effects"
)

MainTab:CreateToggle({

    Name = "Low Health Visual",

    CurrentValue = false,

    Callback = function(Value)

        Enabled = Value

        if not Value then
            ResetEffects()
        end

    end,

})
