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

--// TAB 1: STATS
local StatsTab = Window:CreateTab({Name = "Stats"})

local MoneyDisplay = StatsTab:CreateParagraph({
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

-- Detect Wave, And Mode
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Status = LocalPlayer.PlayerGui
    :WaitForChild("GameStatus")
    :WaitForChild("Status")

local GameStatusParagraph = StatsTab:CreateParagraph({
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

-- Detect Player That Use This Script
local ScriptUsersParagraph = StatsTab:CreateParagraph({
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

    ScriptUsersParagraph:SetText("Player That Use This Script (In this server):\n================\n" .. (#result > 0
        and table.concat(result, "\n")
        or "No Player Use This Script (in this server)"))
end

task.spawn(function()
    while true do
        UpdateParagraph()
        task.wait(0.5)
    end
end)

-- Detect Morph That Exist In Battlefield
local MorphParagraph = StatsTab:CreateParagraph({
    Name = "Army (Team) That Exist In Battlefield:\n",
    Content = "Checking..."
})

task.spawn(function()
    while true do
        local PlayersFolder = workspace:FindFirstChild("Players")

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

--// TAB 2: INFORMATION
local InfoTab = Window:CreateTab({Name = "Information"})

InfoTab:CreateSection({Name = "Information"})

InfoTab:CreateParagraph({
    Name = "information",
    Content = "I make this script for fun, but the dev ban me, so I decided to upload it and keep updating, For Revenge!"
})

InfoTab:CreateParagraph({
    Name = "Tips",
    Content = "You Can Delete Npc Like Erlking, Sus_Moogus, And Others With Titan Builderman.\nJust Use Titan Builderman Then Teleport To Safe Place In Teleport (Script) Then Use Hook, And The Npc Disappear (deleted / died)\n\nIf You Lazy Or Whatever, You Can Just Click ''Call Titans / Call Special Titans'' In Shop (Script) That Feature Is Soo Useful When You Do Nightmare Mode\n\nYou Can Be Invisible And Invincible Forever By Using Any Titan/Unit That Has Teleport Skill\nFirst, Use Teleport, Then Use ''Buy Cannon Bloxxer/Speaker''\nHere The List\n\n•Titan Guest, Use Teleport Then Buy Speaker\n•Multiverse Titan Guest, Use Teleport Then Buy Bloxxer Cannon\n•Titan John Doe, Use Teleport Then Buy Speaker\n•Titan Bloxxer, Use Teleport(animation must be gone) Then Buy Speaker\n--* Thanks @wallance_editzz That Figure It Out And Telling  Me *--"
})

InfoTab:CreateParagraph({
    Name = "Massage From Owner Script",
    Content = "Subscribe My Channel And Tell Or Ask Me Anytimg On The Community, The Channel Name Is @TheLastCloned The Display Name Is Theurus\n\n ⚠️WARNING⚠️ if the game updated, dont use this script! theres might be an anti cheat that ban you, so I will shut down this script for a while when the game update and check if there any anti Cheat"
})

InfoTab:CreateParagraph({
    Name = "List Player That Not Allowed To Use This Script:",
    Content = "- game_131214"
})

InfoTab:CreateParagraph({
    Name = "Update Log",
    Content = "+Tips How To Be Invisible And Invincible Forever"
})

--// TAB 3: SHOP
local ShopTab = Window:CreateTab({Name = "Shop"})

ShopTab:CreateSection({Name = "You can buy thing"})

Zynz:Notify({
   Name = "Welcome!",
   Paragraph = "Enjoy Player!",
   Duration = 4.5,
})

ShopTab:CreateButton({
   Name = "Call Titans (Shop 2000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Titans")
   end,
})

ShopTab:CreateButton({
   Name = "Call Special Titans (Shop 5000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Special Titans")
   end,
})

ShopTab:CreateSection({Name = "The Op item"})

ShopTab:CreateButton({
   Name = "Buy Bloxxer Cannon (3000 money)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Bloxxer Cannon")
   end,
})

ShopTab:CreateButton({
   Name = "Buy Speaker (750 money)(weak)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Call Speakers")
   end,
})

ShopTab:CreateSection({Name = "Repair Up"})

ShopTab:CreateButton({
   Name = "Repair For Titan Noob And Titan Noob 1.5 (only if you lose a life)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Repair")
   end,
})

ShopTab:CreateButton({
   Name = "Special Repair For Titan Brickbattler (only on Tired State or already use second life)",
   Callback = function()
       local Event = game:GetService("ReplicatedStorage").ItemsEvent
       Event:FireServer("Special Repair")
   end,
})

ShopTab:CreateSection({Name = "Fucking Useless"})

ShopTab:CreateButton({
    Name = "Buy Blaster (500 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Blaster")
    end,
})

ShopTab:CreateButton({
    Name = "Buy Sword (100 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Sword")
    end,
})

ShopTab:CreateButton({
    Name = "Buy Jetpack (100 money or less idk)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Jetpack")
    end,
})

ShopTab:CreateButton({
    Name = "Buy Bruh (50 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Bruh")
    end,
})

--// TAB 4: TELEPORT
local TeleportTab = Window:CreateTab({Name = "Teleport"})
TeleportTab:CreateSection({Name = "Teleport🧿"})

TeleportTab:CreateButton({
   Name = "Teleport to safe area(not 100% safe)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1575, -444, 555))
   end,
})

TeleportTab:CreateButton({
   Name = "Teleport to lobby inside (No Titans)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1689, -490, -138))
   end,
})

TeleportTab:CreateButton({
   Name = "Teleport to lobby outside",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(1747, -399, -146))
   end,
})

TeleportTab:CreateButton({
   Name = "Teleport Back (WayPoint I Think)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      character:PivotTo(CFrame.new(557, 178, -430))
   end,
})

--// TAB 5: AUTO THING
local AutoTab = Window:CreateTab({Name = "Auto Thing"})
AutoTab:CreateSection({Name = "Auto Thing"})

local Running = false
AutoTab:CreateToggle({
    Name = "Auto Missle And Auto Reload (Guest Mech Only)",
    Value = false,
    Callback = function(Value)
        Running = Value

        if Value then
            -- Auto Missile
            task.spawn(function()
                while Running do
                    local char = game:GetService("Players").LocalPlayer.Character
                    if char and char:FindFirstChild("Abilities") and char.Abilities:FindFirstChild("Missiles") then
                        char.Abilities.Missiles.RemoteEvent:FireServer()
                    end
                    task.wait(0.2)
                end
            end)

            -- Auto Reload
            task.spawn(function()
                while Running do
                    local Event = game:GetService("ReplicatedStorage"):FindFirstChild("ItemsEvent")
                    if Event then
                        Event:FireServer("Refill Rockets")
                    end
                    task.wait(2.3)
                end
            end)
        end
    end,
})

local AttackRunning = false
AutoTab:CreateToggle({
    Name = "Auto M1 / Attack",
    Value = false,
    Callback = function(Value)
        AttackRunning = Value

        if not Value then return end

        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer

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
AutoTab:CreateToggle({
    Name = "Auto Projectile / Shoot",
    Value = false,
    Callback = function(Value)
        ProjectileRunning = Value

        if not Value then return end

        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer

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
AutoTab:CreateToggle({
    Name = "Auto Stomp (kinda op with tbb)",
    Value = false,
    Callback = function(Value)
        StompRunning = Value

        if not Value then return end

        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer

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
AutoTab:CreateToggle({
    Name = "Auto TP Time Essence",
    Value = false,
    Callback = function(Value)
        EssenceRunning = Value

        if not Value then return end

        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer

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

AutoTab:CreateSection({Name = "GamePlay Or Whatever It Called"})

local SelectedMode = "Easy"
local VotedEnabled = false

AutoTab:CreateToggle({
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

AutoTab:CreateDropdown({
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

AutoTab:CreateToggle({
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

AutoTab:CreateDropdown({
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
AutoTab:CreateToggle({
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

AutoTab:CreateSection({Name = "Auto Farm (not complete)"})

AutoTab:CreateToggle({
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

--// TAB 6: FUN
local FunTab = Window:CreateTab({Name = "Fun"})
FunTab:CreateSection({Name = "I dont know what I make"})

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

FunTab:CreateToggle({
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

-- AUTO BUY/USE BLOXXER CANNON
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilityName = "Call Bloxxer Cannon"

local AutoBloxxerCannon = false
local TaskGeneration = 0

local SpawnInterval = 1
local UseInterval = 0.05
local UseDuration = 1

FunTab:CreateDropdown({
    Name = "Spawn Speed",
    Options = {
        "Spawn 2.5s", "Spawn 2s", "Spawn 1.5s", "Spawn 0.5s", "Spawn 0.25s", "Spawn 0s"
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

FunTab:CreateToggle({
    Name = "Auto Buy/Use Bloxxer Cannon",
    Value = false,
    Callback = function(Value)
        AutoBloxxerCannon = Value
        TaskGeneration += 1

        local CurrentGeneration = TaskGeneration

        if Value then
            task.spawn(function()
                while AutoBloxxerCannon and CurrentGeneration == TaskGeneration do
                    local ItemsEvent = ReplicatedStorage:FindFirstChild("ItemsEvent")
                    if ItemsEvent then
                        ItemsEvent:FireServer(AbilityName)
                    end

                    task.spawn(function()
                        local startTime = os.clock()
                        while os.clock() - startTime < UseDuration and AutoBloxxerCannon and CurrentGeneration == TaskGeneration do
                            local char = player.Character
                            if char then
                                local abilities = char:FindFirstChild("Abilities")
                                if abilities then
                                    local cannon = abilities:FindFirstChild("Bloxxer Cannon")
                                    if cannon then
                                        local remote = cannon:FindFirstChild("RemoteEvent")
                                        if remote then
                                            remote:FireServer()
                                        end
                                    end
                                end
                            end
                            task.wait(UseInterval)
                        end
                    end)

                    task.wait(SpawnInterval)
                end
            end)
        end
    end
})