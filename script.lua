--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Noob Experiment: Battlefront V2.1🔥",
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
    Title = "+ Musics\n",
    Content = "join my discord to give me idea!💡"
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
   Content = "Enjoy!",
   Duration = 6.5,
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

                        local blastersEvent = blasters and blasters:FindFirstChild("RemoteEvent")
                        local blasterEvent = blaster and blaster:FindFirstChild("RemoteEvent")
                        local rocketEvent = rocket and rocket:FindFirstChild("RemoteEvent")
                        local rocketsEvent = rockets and rockets:FindFirstChild("RemoteEvent")
                        local rocketlaunchersEvent = rocketlaunchers and rocketlaunchers:FindFirstChild("RemoteEvent")

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
local MinImpulse = 1000
local MaxImpulse = 5000
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
    Name = "HAHAHA SLINGINGING",
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

local MusicList = {
    ["Feel The Fury OUTCOME MEMORIES"] = "80215938105460",
    ["Through Patches of Violet"] = "77579718926500",
}

local SelectedSong = "Feel The Fury OUTCOME MEMORIES"
local CustomMusicID = ""

local function PlayMusic(ID)
    if not ID or ID == "" then
        return
    end

    local MusicFolder = workspace:FindFirstChild("Music")

    if not MusicFolder then
        return
    end

    for _, sound in ipairs(MusicFolder:GetDescendants()) do
        if sound:IsA("Sound") then
            sound.SoundId = "rbxassetid://" .. ID
            sound:Play()
        end
    end
end

-- Input untuk ID sendiri
MainTab:CreateInput({
    Name = "Music ID",
    PlaceholderText = "Enter Roblox Music ID...",
    RemoveTextAfterFocusLost = false,

    Callback = function(Text)
        CustomMusicID = Text
    end,
})

-- Mainkan ID yang dimasukkan sendiri
MainTab:CreateButton({
    Name = "Play Custom Music",
    Callback = function()
        PlayMusic(CustomMusicID)
    end,
})



-- Daftar lagu yang sudah disediakan
MainTab:CreateDropdown({
    Name = "Select Music",
    Options = {
        "Feel The Fury OUTCOME MEMORIES",
        "Through Patchs of Violet"
    },
    CurrentOption = {"Feel The Fury"},
    MultipleOptions = false,

    Callback = function(Option)
        SelectedSong = Option[1]
    end,
})

-- Mainkan lagu dari daftar
MainTab:CreateButton({
    Name = "Play Selected Music",
    Callback = function()
        local ID = MusicList[SelectedSong]
        PlayMusic(ID)
    end,
})
