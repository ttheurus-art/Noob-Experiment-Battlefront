--// Zynz Library Load
local Zynz = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttheurus-art/Creator/refs/heads/main/Zynz.luau"))()

local Window = Zynz:CreateWindow({
   Name = "Noob Experiment: Battlefront V4.6🔥",
   MainTabTheme = "Normal"
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

--// Detect All Currency

local MainTab = Window:CreateTab({Name = "Stats"})

local MoneyDisplay = MainTab:CreateParagraph({
    Name = "Currency💵",
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

        MoneyDisplay:SetText("Currency💵\nKeys: " .. keys.Value
            .. "\nTime Essence: " .. timeEssences.Value
            .. "\nMoney: " .. moneyAmount.Text)

        task.wait(0.2)
    end
end)

--// Detect Wave, And Mode

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Status = LocalPlayer.PlayerGui
    :WaitForChild("GameStatus")
    :WaitForChild("Status")

local GameStatusParagraph = MainTab:CreateParagraph({
    Name = "Game Status",
    Content = "Checking..."
})

task.spawn(function()
    while task.wait(0.2) do
        local WaveCount = Status:FindFirstChild("WaveCount")
        local Difficulty = Status:FindFirstChild("Difficulty")

        local WaveText = WaveCount and WaveCount.Text or "Wave: Unknown"
        local DifficultyText = Difficulty and Difficulty.Text or "Mode: Unknown"

        GameStatusParagraph:SetText("Game Status\n" .. WaveText .. "\n" .. DifficultyText)
    end
end)

--// Detect Player That Use This Script

local Paragraph = MainTab:CreateParagraph({
    Name = "Player That Use This Script (In this server):\n================",
    Content = "Checking..."
})

local function UpdateParagraph()
    local result = {}

    for _, player in ipairs(Players:GetPlayers()) do
        local charsBought = player:FindFirstChild("charsBought")
        local xtreme = charsBought and charsBought:FindFirstChild("X-TREME")

        if xtreme and xtreme:IsA("BoolValue") and xtreme.Value == true then
            if player.Name == "kinds_eye" or player.Name == "Player_Yusup" then
                table.insert(result, player.Name .. " (🔥OWNER SCRIPT🔥)")
            else
                table.insert(result, player.Name)
            end
        end
    end

    Paragraph:SetText("Player That Use This Script (In this server):\n================\n" .. (#result > 0
        and table.concat(result, "\n")
        or "No Player Use This Script (in this server)"))
end

task.spawn(function()
    while true do
        UpdateParagraph()
        task.wait(0.5)
    end
end)

--// Detect Morph That Exist In Battlefield

local PlayersFolder = workspace:FindFirstChild("Players")

local MorphParagraph = MainTab:CreateParagraph({
    Name = "Army (Team) That Exist In Battlefield:\n",
    Content = "Checking..."
})

task.spawn(function()
    while true do
        PlayersFolder = workspace:FindFirstChild("Players")

        if not PlayersFolder then
            MorphParagraph:SetText("Army (Team) That Exist In Battlefield:\n================\nNo Army Detected...")
        else
            local Morphs = PlayersFolder:GetChildren()

            if #Morphs == 0 then
                MorphParagraph:SetText("Army (Team) That Exist In Battlefield:\n================\nNo Army Detected...")
            else
                local Result = {}

                for _, Morph in ipairs(Morphs) do
                    table.insert(Result, Morph.Name)
                end

                MorphParagraph:SetText("Army (Team) That Exist In Battlefield\n================\n" .. table.concat(Result, "\n"))
            end
        end

        task.wait(0.5)
    end
end)

local MainTab = Window:CreateTab({Name = "Information"})

MainTab:CreateSection({Name = "Information"})

MainTab:CreateParagraph({
    Name = "information",
    Content = "I make this script for fun, but the dev ban me, so I decided to upload it and keep updating, For Revenge!"
})

MainTab:CreateParagraph({
    Name = "Tips",
    Content = "You Can Delete Npc Like Erlking, Sus_Moogus, And Others With Titan Builderman.\nJust Use Titan Builderman Then Teleport To Safe Place In Teleport (Script) Then Use Hook, And The Npc Disappear (deleted / died)\n\nIf You Lazy Or Whatever, You Can Just Click ''Call Titans / Call Special Titans'' In Shop (Script) That Feature Is Soo Useful When You Do Nightmare Mode\n\nYou Can Be Invisible And Invincible Forever By Using Any Titan/Unit That Has Teleport Skill\nFirst, Use Teleport, Then Use ''Buy Cannon Bloxxer/Speaker''\nHere The List\n\n•Titan Guest, Use Teleport Then Buy Speaker\n•Multiverse Titan Guest, Use Teleport Then Buy Bloxxer Cannon\n•Titan John Doe, Use Teleport Then Buy Speaker\n•Titan Bloxxer, Use Teleport(animation must be gone) Then Buy Speaker\n--* Thanks @wallance_editzz That Figure It Out And Telling  Me *--"
})

MainTab:CreateParagraph({
    Name = "Massage From Owner Script",
    Content = "Subscribe My Channel And Tell Or Ask Me Anytimg On The Community, The Channel Name Is @TheLastCloned The Display Name Is Theurus\n\n ⚠️WARNING⚠️ if the game updated, dont use this script! theres might be an anti cheat that ban you, so I will shut down this script for a while when the game update and check if there any anti Cheat"
})

MainTab:CreateParagraph({
    Name = "List Player That Not Allowed To Use This Script:",
    Content = "- game_131214"
})

MainTab:CreateParagraph({
    Name = "Update Log",
    Content = "+Tips How To Be Invisible And Invincible Forever"
})

local MainTab = Window:CreateTab({Name = "Shop"})
MainTab:CreateSection({Name = "You can buy thing"})

Zynz:Notify({
   Name = "Welcome!",
   Paragraph = "Enjoy Player!",
   Duration = 4.5,
})

MainTab:CreateButton({
   Name = "Call Titans (Shop 2000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Titans")
   end,
})

MainTab:CreateButton({
   Name = "Call Special Titans (Shop 5000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Special Titans")
   end,
})

MainTab:CreateSection({Name = "The Op item"})

MainTab:CreateButton({
   Name = "Buy Bloxxer Cannon (3000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Bloxxer Cannon")
   end,
})

MainTab:CreateButton({
   Name = "Buy Speaker (750 money)(weak)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Speakers")
   end,
})

MainTab:CreateSection({Name = "Repair Up"})

MainTab:CreateButton({
   Name = "Repair For Titan Noob And Titan Noob 1.5 (only if you lose a life)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Repair")
   end,
})

MainTab:CreateButton({
   Name = "Special Repair For Titan Brickbattler (only on Tired State or already use second life)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Special Repair")
   end,
})

MainTab:CreateSection({Name = "Fucking Useless"})

MainTab:CreateButton({
    Name = "Buy Blaster (500 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Blaster")
    end,
})

MainTab:CreateButton({
    Name = "Buy Sword (100 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Sword")
    end,
})

MainTab:CreateButton({
    Name = "Buy Jetpack (100 money or less idk)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Jetpack")
    end,
})

MainTab:CreateButton({
    Name = "Buy Bruh (50 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Bruh")
    end,
})

local MainTab = Window:CreateTab({Name = "Teleport"})
MainTab:CreateSection({Name = "Teleport🧿"})

MainTab:CreateButton({
   Name = "Teleport to safe area(not 100% safe)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1575, -444, 555))
   end,
})

MainTab:CreateButton({
   Name = "Teleport to lobby inside (No Titans)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1689, -490, -138))
   end,
})

MainTab:CreateButton({
   Name = "Teleport to lobby outside",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1747, -399, -146))
   end,
})

MainTab:CreateButton({
   Name = "Teleport Back (WayPoint I Think)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(557, 178, -430))
   end,
})

local MainTab = Window:CreateTab({Name = "Auto Thing"})
MainTab:CreateSection({Name = "Auto Thing"})

local Running = false

MainTab:CreateToggle({
    Name = "Auto Missle And Auto Reload (Guest Mech Only)",
    Value = false,
    Callback = function(Value)
        Running = Value

        if Value then
            task.spawn(function()
                while Running do
                    local Event = game:GetService("Players").LocalPlayer.Character.Abilities.Missiles.RemoteEvent
                    Event:FireServer()
                    task.wait(0.2)
                end
            end)

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
    Value = false,
    Callback = function(Value)
        AttackRunning = Value

        if not Value then return end

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
                        local hammer = abilities:FindFirstChild("Hammer")
                         
                        local slashEvent = slash and slash:FindFirstChild("RemoteEvent")
                        local punchEvent = punch and punch:FindFirstChild("RemoteEvent")
                        local swordEvent = sword and sword:FindFirstChild("RemoteEvent")
                        local comboEvent = combo and combo:FindFirstChild("RemoteEvent")
                        local drillEvent = drill and drill:FindFirstChild("RemoteEvent")
                        local hitEvent = hit and hit:FindFirstChild("RemoteEvent")
                        local energyswordEvent = energysword and energysword:FindFirstChild("RemoteEvent")
                        local knifeEvent = knife and knife:FindFirstChild("RemoteEvent")
                        local hammerEvent = hammer and hammer:FindFirstChild("RemoteEvent")
                                
                        if slashEvent then slashEvent:FireServer() end
                        if hammerEvent then hammerEvent:FireServer() end
                        if punchEvent then punchEvent:FireServer() end
                        if swordEvent then swordEvent:FireServer() end
                        if knifeEvent then knifeEvent:FireServer() end
                        if drillEvent then drillEvent:FireServer() end
                        if energyswordEvent then energyswordEvent:FireServer() end
                        if hitEvent then hitEvent:FireServer() end
                        if comboEvent then comboEvent:FireServer() end
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
    Value = false,
    Callback = function(Value)
        ProjectileRunning = Value

        if not Value then return end

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
                        local lasergun = abilities:FindFirstChild("Laser Gun")
                        local lasergunleft = abilities:FindFirstChild("Laser Gun Left")
                        local lasergunright = abilities:FindFirstChild("Laser Gun Right")
                        local corecannon = abilities:FindFirstChild("Core Cannon")

                        local blastersEvent = blasters and blasters:FindFirstChild("RemoteEvent")
                        local blasterEvent = blaster and blaster:FindFirstChild("RemoteEvent")
                        local rocketEvent = rocket and rocket:FindFirstChild("RemoteEvent")
                        local rocketsEvent = rockets and rockets:FindFirstChild("RemoteEvent")
                        local rocketlaunchersEvent = rocketlaunchers and rocketlaunchers:FindFirstChild("RemoteEvent")
                        local rocketlauncherEvent = rocketlauncher and rocketlauncher:FindFirstChild("RemoteEvent")
                        local lasergunEvent = lasergun and lasergun:FindFirstChild("RemoteEvent")
                        local lasergunrightEvent = lasergunright and lasergunright:FindFirstChild("RemoteEvent")
                        local lasergunleftEvent = lasergunleft and lasergunleft:FindFirstChild("RemoteEvent")
                        local corecannonEvent = corecannon and corecannon:FindFirstChild("RemoteEvent")

                        if blastersEvent then blastersEvent:FireServer() end
                        if lasergunleftEvent then lasergunleftEvent:FireServer() end
                        if lasergunrightEvent then lasergunrightEvent:FireServer() end
                        if corecannonEvent then corecannonEvent:FireServer() end
                        if lasergunEvent then lasergunEvent:FireServer() end
                        if blasterEvent then blasterEvent:FireServer() end
                        if rocketEvent then rocketEvent:FireServer() end
                        if rocketsEvent then rocketsEvent:FireServer() end
                        if rocketlauncherEvent then rocketlauncherEvent:FireServer() end
                        if rocketlaunchersEvent then rocketlaunchersEvent:FireServer() end
                    end
                end

                task.wait(0.1)
            end
        end)
    end,
})

local StompRunning = false

MainTab:CreateToggle({
    Name = "Auto Stomp (kinda op with tbb)",
    Value = false,
    Callback = function(Value)
        StompRunning = Value

        if not Value then return end

        task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            while StompRunning do
                local character = player.Character

                if character then
                    local abilities = character:FindFirstChild("Abilities")
                    local animate = character:FindFirstChild("Animate")

                    if abilities then
                        local stompAbility = abilities:FindFirstChild("Stomp")
                        local stompEvent = stompAbility and stompAbility:FindFirstChild("RemoteEvent")
                        if stompEvent then stompEvent:FireServer() end
                    end

                    if animate then
                        local stomp = animate:FindFirstChild("Stomp")
                        if stomp then
                            task.spawn(function() stomp:FireServer("L") end)
                            task.spawn(function() stomp:FireServer("R") end)
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
    Value = false,
    Callback = function(Value)
        EssenceRunning = Value

        if not Value then return end

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
                        if part then targetCFrame = part.CFrame end
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

MainTab:CreateSection({Name = "GamePlay Or Whatever It Called"})

local SelectedMode = "Easy"
local VotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Vote Mode / Difficult",
    Value = false,
    Callback = function(Value)
        VotedEnabled = Value

        if Value then
            task.spawn(function()
                while VotedEnabled do
                    local Votes = game:GetService("ReplicatedStorage"):FindFirstChild("Votes")
                    local Event = Votes and Votes:FindFirstChild("Voted")

                    if Event then
                        Event:FireServer(SelectedMode)
                    end

                    task.wait(1)
                end
            end)
        end
    end,
})

MainTab:CreateDropdown({
    Name = "Select Mode",
    Options = {
        "Easy", "Medium", "Hard", "Nightmare", "Incident", "Endless", "Boss Rush", "Sandbox"
    },
    CurrentOption = "Easy",
    Callback = function(Option)
        SelectedMode = Option
    end,
})

local SelectedMap = "Roblox Hq"
local MapVotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Vote Map",
    Value = false,
    Callback = function(Value)
        MapVotedEnabled = Value

        if Value then
            task.spawn(function()
                while MapVotedEnabled do
                    local Votes = game:GetService("ReplicatedStorage"):FindFirstChild("Votes")
                    local Event = Votes and Votes:FindFirstChild("MapVoted")

                    if Event then
                        Event:FireServer(SelectedMap)
                    end
                    task.wait(1)
                end
            end)
        end
    end,
})

MainTab:CreateDropdown({
    Name = "Select Map",
    Options = {
        "Roblox Hq", "Crossroad", "City", "Desert", "Frozen Tundra", "Battlefield"
    },
    CurrentOption = "Roblox Hq",
    Callback = function(Option)
        SelectedMap = Option
    end,
})

local SkipVotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Skip Vote",
    Value = false,
    Callback = function(Value)
        SkipVotedEnabled = Value
        if Value then
            task.spawn(function()
                while SkipVotedEnabled do
                    local Votes = game:GetService("ReplicatedStorage"):FindFirstChild("Votes")
                    local Event = Votes and Votes:FindFirstChild("SkipVoted")

                    if Event then
                        Event:FireServer("Yes")
                    end

                    task.wait(1)
                end
            end)
        end
    end,
})

MainTab:CreateSection({Name = "Auto Farm (not complete)"})

MainTab:CreateToggle({
    Name = "Auto Execute (for auto essence later)",
    Value = false,
    Callback = function(Value)
        if Value and queue_on_teleport then
            queue_on_teleport([[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ttheurus-art/Noob-Experiment-Battlefront/refs/heads/main/script.lua"))()
            ]])
        end
    end,
})

local MainTab = Window:CreateTab({Name = "Fun"})
MainTab:CreateSection({Name = "I dont know what I make"})

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
    if not root then return end

    local now = os.clock()
    if now - LastFling < FlingCooldown then return end
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
    root:ApplyImpulse(direction * impulse * root.AssemblyMass)
end

local function SetupTouchDetection(character)
    DisconnectTouches()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            table.insert(TouchConnections, part.Touched:Connect(function(hit)
                if not RagdollSpinRunning then return end
                if not hit or hit:IsDescendantOf(character) then return end
                FlingCharacter(character)
            end))
        end
    end
end

MainTab:CreateToggle({
    Name = "I CALL IT SLINGINGING",
    Value = false,
    Callback = function(Value)
        RagdollSpinRunning = Value

        local character = player.Character
        if not character then return end

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
                local root = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")

                if root then
                    root.AssemblyAngularVelocity = Vector3.new(0, SpinSpeed, 0)
                end

                RunService.Heartbeat:Wait()
            end
        end)
    end,
})

--// AUTO BUY/USE BLOXXER CANNON
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilityName = "Call Bloxxer Cannon"

local AutoBloxxerCannon = false
local AutoCannonTask = nil
local TaskGeneration = 0

local SpawnInterval = 1
local UseInterval = 0.05
local UseDuration = 1

MainTab:CreateDropdown({
    Name = "Spawn Speed",
    Options = {
        "Spawn 2.5s", "Spawn 2s", "Spawn 1.5s", "Spawn 1s", "Spawn 0.5s", "Spawn 0.25s", "Spawn 0s"
    },
    CurrentOption = "Spawn 1s",
    Callback = function(Option)
        local Speeds = {
            ["Spawn 2.5s"] = 2.5,
            ["Spawn 2s"] = 2,
            ["Spawn 1.5s"] = 1.5,
            ["Spawn 1s"] = 1,
            ["Spawn 0.5s"] = 0.5,
            ["Spawn 0.25s"] = 0.25,
            ["Spawn 0s"] = 0
        }

        if Speeds[Option] ~= nil then
            SpawnInterval = Speeds[Option]
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Buy/Use Bloxxer Cannon",
    Value = false,
    Callback = function(Value)
        AutoBloxxerCannon = Value
        TaskGeneration += 1

        local CurrentGeneration = TaskGeneration

        if AutoCannonTask then
            pcall(task.cancel, AutoCannonTask)
            AutoCannonTask = nil
        end

        if not Value then return end

        AutoCannonTask = task.spawn(function()
            while AutoBloxxerCannon and TaskGeneration == CurrentGeneration do
                local PlayerGui = player:FindFirstChild("PlayerGui")
                local AbilitiesGui = PlayerGui and PlayerGui:FindFirstChild("Abilities")
                local AbilitySlot = AbilitiesGui and AbilitiesGui:FindFirstChild("AbilitySlot")

                local HasAnyAbility = false
                if AbilitySlot then
                    for _, Child in ipairs(AbilitySlot:GetChildren()) do
                        if Child.Name ~= "UIListLayout" then
                            HasAnyAbility = true
                            break
                        end
                    end
                end

                if not HasAnyAbility then
                    task.wait(0.5)
                    continue
                end

                local ItemsEvent = ReplicatedStorage:FindFirstChild("ItemsEvent")
                if ItemsEvent then
                    ItemsEvent:FireServer(AbilityName)
                else
                    task.wait(1)
                    continue
                end

                local SpawnDeadline = os.clock() + SpawnInterval
                repeat
                    if not AutoBloxxerCannon or TaskGeneration ~= CurrentGeneration then break end
                    task.wait(0.03)
                until os.clock() >= SpawnDeadline

                if not AutoBloxxerCannon or TaskGeneration ~= CurrentGeneration then break end

                local UseUntil = os.clock() + UseDuration
                repeat
                    if not AutoBloxxerCannon or TaskGeneration ~= CurrentGeneration then break end

                    local Character = player.Character
                    local Abilities = Character and Character:FindFirstChild("Abilities")
                    local Cannon = Abilities and Abilities:FindFirstChild(AbilityName)
                    local RemoteEvent = Cannon and Cannon:FindFirstChild("RemoteEvent")

                    if RemoteEvent and RemoteEvent:IsA("RemoteEvent") then
                        RemoteEvent:FireServer()
                    end

                    task.wait(UseInterval)
                until os.clock() >= UseUntil
            end

            if TaskGeneration == CurrentGeneration then
                AutoCannonTask = nil
            end
        end)
    end
})

--// MUSIC
local SoundService = game:GetService("SoundService")

local MusicList = {
    ["None"] = nil,
    ["AFTERTASTE"] = "85281675332105",
    ["Creation of Hatred"] = "111304986203081",
    ["Eternity V1"] = "128855377868949",
    ["At The Speed of Light"] = "117386268398589",
    ["The Great Strategy"] = "122220105663741",
    ["A Retro Soul"] = "116457974828068"
}

local CustomMusicID = ""
local MusicVolume = 5
local SelectedMusicID = nil

local CustomMusic = Instance.new("Sound")
CustomMusic.Name = "NoobExperiment_CustomMusic"
CustomMusic.Parent = SoundService
CustomMusic.Looped = true
CustomMusic.Volume = MusicVolume

local function StartMusic(ID)
    if not ID or ID == "" then return end
    CustomMusic:Stop()
    CustomMusic.SoundId = "rbxassetid://" .. ID
    CustomMusic.Volume = MusicVolume
    CustomMusic:Play()
end

MainTab:CreateSection({Name = "Music"})

MainTab:CreateInput({
    Name = "Music ID",
    Placeholder = "Enter Roblox Music ID...",
    Callback = function(Text)
        CustomMusicID = Text
    end,
})

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

MainTab:CreateButton({
    Name = "Stop Music",
    Callback = function()
        CustomMusic:Stop()
    end,
})

MainTab:CreateSlider({
    Name = "Music Volume",
    Min = 0,
    Max = 10,
    Default = 5,
    Callback = function(Val)
        MusicVolume = Val
        CustomMusic.Volume = Val
    end,
})

MainTab:CreateDropdown({
    Name = "Select Music Preset",
    Options = {
        "None", "AFTERTASTE", "Creation of Hatred", "Eternity V1",
        "At The Speed of Light", "The Great Strategy", "A Retro Soul"
    },
    CurrentOption = "None",
    Callback = function(Option)
        SelectedMusicID = MusicList[Option]
        if Option == "None" then
            CustomMusic:Stop()
        end
    end,
})

--// VISUALIZER / PARTICLES & LOW HEALTH EFFECTS
local LowHealthRedScreen = false
local LowHealthHeartbeat = false
local VisualizerActive = false
local PartPool = {}

local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LowHealthUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local RedFrame = Instance.new("Frame")
RedFrame.Size = UDim2.new(1, 0, 1, 0)
RedFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RedFrame.BackgroundTransparency = 1
RedFrame.BorderSizePixel = 0
RedFrame.Parent = ScreenGui

local HeartbeatSound = Instance.new("Sound")
HeartbeatSound.SoundId = "rbxassetid://9114223179"
HeartbeatSound.Looped = true
HeartbeatSound.Volume = 0
HeartbeatSound.Parent = SoundService

local function GetLocalHumanoid()
    local char = LocalPlayer.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

task.spawn(function()
    while true do
        task.wait(0.1)
        local hum = GetLocalHumanoid()
        if hum and hum.Health > 0 then
            local ratio = hum.Health / hum.MaxHealth
            if ratio <= 0.35 then
                if LowHealthRedScreen then
                    local pulse = (math.sin(tick() * 6) + 1) / 2
                    RedFrame.BackgroundTransparency = 0.7 - (pulse * 0.3)
                else
                    RedFrame.BackgroundTransparency = 1
                end

                if LowHealthHeartbeat then
                    if not HeartbeatSound.IsPlaying then HeartbeatSound:Play() end
                    HeartbeatSound.Volume = 1.5
                else
                    HeartbeatSound.Volume = 0
                end
            else
                RedFrame.BackgroundTransparency = 1
                HeartbeatSound.Volume = 0
            end
        else
            RedFrame.BackgroundTransparency = 1
            HeartbeatSound.Volume = 0
        end
    end
end)

MainTab:CreateSection({Name = "Visualizer & Effects"})

MainTab:CreateToggle({
    Name = "Low Health Red Screen",
    Value = false,
    Callback = function(v) LowHealthRedScreen = v end
})

MainTab:CreateToggle({
    Name = "Low Health Heartbeat Sound",
    Value = false,
    Callback = function(v) LowHealthHeartbeat = v end
})

local function GetPartFromPool()
    for _, p in ipairs(PartPool) do
        if not p.Parent then return p end
    end
    local p = Instance.new("Part")
    p.Anchored = true
    p.CanCollide = false
    p.Material = Enum.Material.Neon
    p.Size = Vector3.new(0.4, 0.4, 0.4)
    table.insert(PartPool, p)
    return p
end

MainTab:CreateToggle({
    Name = "Music Particle Visualizer",
    Value = false,
    Callback = function(v)
        VisualizerActive = v
        if not v then
            for _, p in ipairs(PartPool) do p.Parent = nil end
        end
    end
})

RunService.RenderStepped:Connect(function()
    if not VisualizerActive or not CustomMusic.IsPlaying then return end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local loudness = CustomMusic.PlaybackLoudness
    if loudness < 10 then return end

    local part = GetPartFromPool()
    part.Color = Color3.fromHSV((tick() % 2) / 2, 1, 1)

    local offset = Vector3.new(
        math.random(-6, 6),
        math.random(-2, 4),
        math.random(-6, 6)
    )

    part.Position = root.Position + offset
    part.Parent = workspace

    TweenService:Create(part, TweenInfo.new(0.6), {
        Position = part.Position + Vector3.new(0, 3, 0),
        Transparency = 1
    }):Play()

    task.delay(0.6, function()
        part.Parent = nil
        part.Transparency = 0
    end)
end)

--// VISUALS & ESP
local VisualsTab = Window:CreateTab({Name = "Visuals"})
VisualsTab:CreateSection({Name = "ESP & Highlights"})

local ESP_Enabled = false
local HighlightFolder = Instance.new("Folder")
HighlightFolder.Name = "ESP_Highlights"
HighlightFolder.Parent = workspace

local function ApplyHighlight(model)
    if not model:FindFirstChildOfClass("Humanoid") then return end
    if model == LocalPlayer.Character then return end
    if HighlightFolder:FindFirstChild(model.Name) then return end

    local hl = Instance.new("Highlight")
    hl.Name = model.Name
    hl.Adornee = model
    hl.FillColor = Color3.fromRGB(255, 50, 50)
    hl.FillTransparency = 0.5
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.OutlineTransparency = 0
    hl.Parent = HighlightFolder
end

local function RemoveHighlights()
    HighlightFolder:ClearAllChildren()
end

VisualsTab:CreateToggle({
    Name = "Enable Entity ESP",
    Value = false,
    Callback = function(Value)
        ESP_Enabled = Value
        if not Value then
            RemoveHighlights()
        end
    end,
})

task.spawn(function()
    while true do
        if ESP_Enabled then
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                    ApplyHighlight(obj)
                end
            end
            local playersFolder = workspace:FindFirstChild("Players")
            if playersFolder then
                for _, obj in ipairs(playersFolder:GetChildren()) do
                    if obj:IsA("Model") then
                        ApplyHighlight(obj)
                    end
                end
            end
        end
        task.wait(1)
    end
end)

--// BLACKLIST / PROTECTION KICK
task.spawn(function()
    local player = game:GetService("Players").LocalPlayer
    if player and player.Name == "game_131214" then
        player:Kick("You Are Blacklisted From Using This Script! Contact Owner If Mistake.")
    end
end)
