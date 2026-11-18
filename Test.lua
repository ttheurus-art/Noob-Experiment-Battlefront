--// so guys I add -> "--//" for every part of the script so everyone know where, and I make it just not to confuse myself lol

local Zynz = loadstring(game:HttpGet("https://raw.githubusercontent.com/ttheurus-art/Creator/refs/heads/main/Zynz.luau"))()

local Window = Zynz:CreateWindow({
    Name = "Zynz Library Test",
    MainTabTheme = "ScriptFault"
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

local Tab1 = Window:CreateTab({
    Name = "Stats"
})

--// Detect All Currency

local MoneyDisplay = MainTab:CreateParagraph({
    Title = "Currency💵",
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
            Title = "Currency💵",
            Content = "Keys: " .. keys.Value
                .. "\nTime Essence: " .. timeEssences.Value
                .. "\nMoney: " .. moneyAmount.Text
        })

        task.wait(0.1)
    end
end)

--// Detect Wave, And Mode

 local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Status = LocalPlayer.PlayerGui
    :WaitForChild("GameStatus")
    :WaitForChild("Status")

local GameStatusParagraph = MainTab:CreateParagraph({
    Title = "Game Status",
    Content = "Checking..."
})

task.spawn(function()
    while task.wait(0.2) do
        local WaveCount = Status:FindFirstChild("WaveCount")
        local Difficulty = Status:FindFirstChild("Difficulty")

        local WaveText = WaveCount and WaveCount.Text or "Wave: Unknown"
        local DifficultyText = Difficulty and Difficulty.Text or "Mode: Unknown"

        GameStatusParagraph:Set({
            Title = "Game Status",
            Content = WaveText .. "\n" .. DifficultyText
        })
    end
end)

--// Detect Player That Use This Script

local Players = game:GetService("Players")

local Paragraph = MainTab:CreateParagraph({
    Title = "Player That Use This Script (In this server):\n================",
    Content = "Checking..."
})

local function UpdateParagraph()
    local result = {}

    for _, player in ipairs(Players:GetPlayers()) do
        local charsBought = player:FindFirstChild("charsBought")
        local xtreme = charsBought and charsBought:FindFirstChild("X-TREME")

        if xtreme and xtreme:IsA("BoolValue") and xtreme.Value == true then
            if player.Name == "???" or player.Name == "Smart But Late Blaze Goons" then
                table.insert(result, player.Name .. " (🔥OWNER SCRIPT🔥)")
            else
                table.insert(result, player.Name)
            end
        end
    end

    Paragraph:Set({
        Title = "Player That Use This Script (In this server):\n================",
        Content = #result > 0
            and table.concat(result, "\n")
            or "No Player Use This Script (in this server)"
    })
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
    Title = "Army (Team) That Exist In Battlefield:\n",
    Content = "Checking..."
})

task.spawn(function()
    while true do
        PlayersFolder = workspace:FindFirstChild("Players")

        if not PlayersFolder then
            MorphParagraph:Set({
                Title = "Army (Team) That Exist In Battlefield:\n================",
                Content = "No Army Detected..."
            })
        else
            local Morphs = PlayersFolder:GetChildren()

            if #Morphs == 0 then
                MorphParagraph:Set({
                    Title = "Army (Team) That Exist In Battlefield:\n================",
                    Content = "No Army Detected..."
                })
            else
                local Result = {}

                for _, Morph in ipairs(Morphs) do
                    table.insert(Result, Morph.Name)
                end

                MorphParagraph:Set({
                    Title = "Army (Team) That Exist In Battlefield\n================",
                    Content = table.concat(Result, "\n")
                })
            end
        end

        task.wait(0.5)
    end
end)

--// Text...

local MainTab = Window:CreateTab({
    Name = "Information"
})

MainTab:CreateSection("Information")

MainTab:CreateParagraph({
    Title = "information",
    Content = "I make this script for fun, but the dev ban me, so I decided to upload it and keep updating, For Revenge!"
})

MainTab:CreateParagraph({
    Title = "Tips",
    Content = "You Can Delete Npc Like Erlking, Sus_Moogus, And Others With Titan Builderman.\nJust Use Titan Builderman Then Teleport To Safe Place In Teleport (Script) Then Use Hook, And The Npc Disappear (deleted / died)\n\nIf You Lazy Or Whatever, You Can Just Click ''Call Titans / Call Special Titans'' In Shop (Script) That Feature Is Soo Useful When You Do Nightmare Mode\n\nYou Can Be Invisible And Invincible Forever By Using Any Titan/Unit That Has Teleport Skill\nFirst, Use Teleport, Then Use ''Buy Cannon Bloxxer/Speaker''\nHere The List\n\n•Titan Guest, Use Teleport Then Buy Speaker\n•Multiverse Titan Guest, Use Teleport Then Buy Bloxxer Cannon\n•Titan John Doe, Use Teleport Then Buy Speaker\n•Titan Bloxxer, Use Teleport(animation must be gone) Then Buy Speaker\n--* Thanks @wallance_editzz That Figure It Out And Telling Me *--"
})

MainTab:CreateParagraph({
    Title = "Massage From Owner Script",
    Content = "Subscribe My Channel And Tell Or Ask Me Anytimg On The Community, The Channel Name Is @TheLastCloned The Display Name Is Theurus\n\n ⚠️WARNING⚠️ if the game updated, dont use this script! theres might be an anti cheat that ban you, so I will shut down this script for a while when the game update and check if there any anti Cheat"
})

MainTab:CreateParagraph({
    Title = "List Player That Not Allowed To Use This Script:",
    Content = "- game_131214"
})

MainTab:CreateParagraph({
    Title = "Update Log",
    Content = "+Auto Buy/Use Bloxxer Cannon (on fun menu)"
})

--// Shop
		
local MainTab = Window:CreateTab({
    Name = "Shop"
})

MainTab:CreateSection("You can buy thing")

Zynz:Notify({
    Name = "Welcome!",
    Paragraph = "Enjoy Player!",
    Duration = 4.5
})

MainTab:CreateButton({
    Name = "Call Titans (Shop 2000 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Call Titans")
    end
})

MainTab:CreateButton({
    Name = "Call Special Titans (Shop 5000 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Call Special Titans")
    end
})

MainTab:CreateSection("The Op item")

MainTab:CreateButton({
    Name = "Buy Bloxxer Cannon (3000 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Call Bloxxer Cannon")
    end
})

MainTab:CreateButton({
    Name = "Buy Speaker (750 money)(weak)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Call Speakers")
    end
})

MainTab:CreateSection("Repair Up")

MainTab:CreateButton({
    Name = "Repair For Titan Noob And Titan Noob 1.5 (only if you lose a life)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Repair")
    end
})

MainTab:CreateButton({
    Name = "Special Repair For Titan Brickbattler (only on Tired State or already use second life)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Special Repair")
    end
})

MainTab:CreateSection("Fucking Useless")

MainTab:CreateButton({
    Name = "Buy Blaster (500 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Blaster")
    end
})

MainTab:CreateButton({
    Name = "Buy Sword (100 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Sword")
    end
})

MainTab:CreateButton({
    Name = "Buy Jetpack (100 money or less idk)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Jetpack")
    end
})

MainTab:CreateButton({
    Name = "Buy Bruh (50 money)",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Bruh")
    end
})

--// Teleport

local MainTab = Window:CreateTab({
    Name = "Teleport"
})

MainTab:CreateSection("Teleport🧿")

MainTab:CreateButton({
    Name = "Teleport to safe area(not 100% safe)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        character:PivotTo(CFrame.new(1575, -444, 555))
    end
})

MainTab:CreateButton({
    Name = "Teleport to lobby inside (No Titans)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        character:PivotTo(CFrame.new(1689, -490, -138))
    end
})

MainTab:CreateButton({
    Name = "Teleport to lobby outside",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        character:PivotTo(CFrame.new(1747, -399, -146))
    end
})

MainTab:CreateButton({
    Name = "Teleport Back (WayPoint I Think)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        character:PivotTo(CFrame.new(557, 178, -430))
    end
})

--// Auto Thingy

local MainTab = Window:CreateTab({
    Name = "Auto Thing"
})

MainTab:CreateSection("Auto Thing")

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

                        if slashEvent then
                            slashEvent:FireServer()
                        end

                        if hammerEvent then
                            hammerEvent:FireServer()
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

                        if blastersEvent then
                            blastersEvent:FireServer()
                        end

                        if lasergunleftEvent then
                            lasergunleftEvent:FireServer()
                        end

                        if lasergunrightEvent then
                            lasergunrightEvent:FireServer()
                        end

                        if corecannonEvent then
                            corecannonEvent:FireServer()
                        end

                        if lasergunEvent then
                            lasergunEvent:FireServer()
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

local StompRunning = false

MainTab:CreateToggle({
    Name = "Auto Stomp (kinda op with tbb)",
    CurrentValue = false,
    Flag = "AutoStomp",

    Callback = function(Value)
        StompRunning = Value

        if not Value then
            return
        end

        task.spawn(function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            while StompRunning do
                local character = player.Character

                if character then
                    local abilities =
                        character:FindFirstChild("Abilities")

                    local animate =
                        character:FindFirstChild("Animate")

                    if abilities then
                        local stompAbility =
                            abilities:FindFirstChild("Stomp")

                        local stompEvent =
                            stompAbility
                            and stompAbility:FindFirstChild("RemoteEvent")

                        if stompEvent then
                            stompEvent:FireServer()
                        end
                    end

                    if animate then
                        local stomp =
                            animate:FindFirstChild("Stomp")

                        if stomp then
                            task.spawn(function()
                                stomp:FireServer("L")
                            end)

                            task.spawn(function()
                                stomp:FireServer("R")
                            end)
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

local MainSection = MainTab:CreateSection("GamePlay Or Whatever It Called")

local SelectedMode = "Easy"
local VotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Vote Mode / Difficult",
    CurrentValue = false,
    Flag = "Voted",

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
        "Easy",
        "Medium",
        "Hard",
        "Nightmare",
        "Incident",
        "Endless",
        "Boss Rush",
        "Sandbox"
    },
    CurrentOption = {"Easy"},
    MultipleOptions = false,
    Flag = "SelectedMode",

    Callback = function(Option)
        SelectedMode = Option[1]
    end,
})

local SelectedMap = "Roblox Hq"
local MapVotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Vote Map",
    CurrentValue = false,
    Flag = "MapVoted",

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
        "Roblox Hq",
        "Crossroad",
        "City",
        "Desert",
        "Frozen Tundra",
        "Battlefield"
    },
    CurrentOption = {"Roblox Hq"},
    MultipleOptions = false,
    Flag = "SelectedMap",

    Callback = function(Option)
        SelectedMap = Option[1]
    end,
})

local SkipVotedEnabled = false

MainTab:CreateToggle({
    Name = "Auto Skip Vote",
    CurrentValue = false,
    Flag = "SkipVoted",

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

local MainTab = Window:CreateTab({
    Name = "Fun"
})

MainTab:CreateSection("I dont know what I make")

--// AUTO BUY/USE BLOXXER CANNON

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local AbilityName = "Call Bloxxer Cannon"

local AutoBloxxerCannon = false
local AutoCannonTask = nil
local TaskGeneration = 0

local SpawnInterval = 1
local UseInterval = 0.05
local UseDuration = 1

--// SPAWN SPEED DROPDOWN

MainTab:CreateDropdown({
    Name = "Spawn Speed",
    Options = {
        "Spawn 2.5s",
        "Spawn 2s",
        "Spawn 1.5s",
        "Spawn 1s",
        "Spawn 0.5s",
        "Spawn 0.25s",
        "Spawn 0s"
    },
    CurrentOption = {"Spawn 1s"},
    Flag = "BloxxerSpawnSpeed",

    Callback = function(Option)
        if type(Option) == "table" then
            Option = Option[1]
        end

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

--// AUTO BUY/USE TOGGLE

MainTab:CreateToggle({
    Name = "Auto Buy/Use Bloxxer Cannon (cost 3k money per spawn)",
    CurrentValue = false,
    Flag = "AutoBloxxerCannon",

    Callback = function(Value)
        AutoBloxxerCannon = Value
        TaskGeneration += 1

        local CurrentGeneration = TaskGeneration

        if AutoCannonTask then
            pcall(task.cancel, AutoCannonTask)
            AutoCannonTask = nil
        end

        if not Value then
            return
        end

        AutoCannonTask = task.spawn(function()
            while AutoBloxxerCannon
                and TaskGeneration == CurrentGeneration do

                --// BUY CANNON

                local ItemsEvent =
                    ReplicatedStorage:FindFirstChild("ItemsEvent")

                if ItemsEvent then
                    ItemsEvent:FireServer(AbilityName)
                else
                    task.wait(0.1)
                    continue
						end

                --// WAIT INTERVAL

                task.wait(SpawnInterval)

                if not AutoBloxxerCannon
                    or TaskGeneration ~= CurrentGeneration then
                    break
                end

                --// USE CANNON

                local UseUntil = os.clock() + UseDuration

                repeat
                    if not AutoBloxxerCannon
                        or TaskGeneration ~= CurrentGeneration then
                        break
                    end

                    local Character = Player.Character
                    local Abilities = Character
                        and Character:FindFirstChild("Abilities")
                    local Cannon = Abilities
                        and Abilities:FindFirstChild(AbilityName)
                    local RemoteEvent = Cannon
                        and Cannon:FindFirstChild("RemoteEvent")

                    if RemoteEvent
                        and RemoteEvent:IsA("RemoteEvent") then
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

--//slinginging

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
    ["The Great Strategy"] = "122220105663741",
    ["A Retro Soul"] = "116457974828068"
}

local CustomMusicID = ""
local MusicVolume = 2.5
local SelectedMusicID = nil

--// SOUND
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

MainTab:CreateSection({
    Name = "Music"
})

--// CUSTOM MUSIC ID
MainTab:CreateInput({
    Name = "Music ID",
    Placeholder = "Enter Roblox Music ID...",
    Default = "",

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
        "The Great Strategy",
        "A Retro Soul",
    },

    CurrentOption = "None",

    Callback = function(Option)
        SelectedMusicID = MusicList[Option]
    end,
})

--// MUSIC VOLUME
MainTab:CreateSlider({
    Name = "Music Volume",
    Range = {0.1, 10},
    Increment = 0.1,
    Value = 2.5,

    Callback = function(Value)
        MusicVolume = Value
        CustomMusic.Volume = Value
    end,
})

--==================================================
--// LOW HEALTH VISUAL - FINAL
--// HEALTH OVERLAY + BLUR + SPEED
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- CLEAN UP SAAT SCRIPT DI-RELOAD
--==================================================

local OldGui = PlayerGui:FindFirstChild(
    "NoobExperiment_LowHealth"
)

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
local Humanoid = nil
local HealthConnection = nil
local DeathRunning = false

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")

Gui.Name = "NoobExperiment_LowHealth"
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 50
Gui.Parent = PlayerGui

--==================================================
-- HEALTH OVERLAY
--==================================================

local Overlay = Instance.new("Frame")

Overlay.Name = "HealthOverlay"
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.Position = UDim2.fromScale(0, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Overlay.BackgroundTransparency = 1
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 10
Overlay.Parent = Gui

--==================================================
-- HORIZONTAL EDGE GRADIENT
--==================================================

local GradientX = Instance.new("UIGradient")

GradientX.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})

GradientX.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.18, 0.50),
    NumberSequenceKeypoint.new(0.38, 0.90),
    NumberSequenceKeypoint.new(0.50, 1),
    NumberSequenceKeypoint.new(0.62, 0.90),
    NumberSequenceKeypoint.new(0.82, 0.50),
    NumberSequenceKeypoint.new(1, 0)
})

GradientX.Rotation = 0
GradientX.Parent = Overlay

--==================================================
-- VERTICAL EDGE GRADIENT
--==================================================

local GradientY = Instance.new("UIGradient")

GradientY.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})

GradientY.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.18, 0.50),
    NumberSequenceKeypoint.new(0.38, 0.90),
    NumberSequenceKeypoint.new(0.50, 1),
    NumberSequenceKeypoint.new(0.62, 0.90),
    NumberSequenceKeypoint.new(0.82, 0.50),
    NumberSequenceKeypoint.new(1, 0)
})

GradientY.Rotation = 90
GradientY.Parent = Overlay

--==================================================
-- BLINK OVERLAY
--==================================================

local Blink = Instance.new("Frame")

Blink.Name = "HealthBlink"
Blink.Size = UDim2.fromScale(1, 1)
Blink.Position = UDim2.fromScale(0, 0)
Blink.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Blink.BackgroundTransparency = 1
Blink.BorderSizePixel = 0
Blink.ZIndex = 20
Blink.Parent = Gui

--==================================================
-- DEATH SCREEN
--==================================================

local DeathScreen = Instance.new("Frame")

DeathScreen.Name = "DeathScreen"
DeathScreen.Size = UDim2.fromScale(1, 1)
DeathScreen.Position = UDim2.fromScale(0, 0)
DeathScreen.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DeathScreen.BackgroundTransparency = 1
DeathScreen.BorderSizePixel = 0
DeathScreen.ZIndex = 100
DeathScreen.Parent = Gui

--==================================================
-- BLUR
--==================================================

local Blur = Instance.new("BlurEffect")

Blur.Name = "NoobExperiment_LowHealthBlur"
Blur.Size = 0
Blur.Parent = Lighting

--==================================================
-- OVERLAY STRENGTH
--==================================================

local function SetOverlay(Transparency)
    Overlay.BackgroundTransparency = math.clamp(
        Transparency,
        0,
        1
    )
end

--==================================================
-- RESET
--==================================================

local function ResetEffects()
    SetOverlay(1)

    Blink.BackgroundTransparency = 1
    DeathScreen.BackgroundTransparency = 1

    Blur.Size = 0

    DeathRunning = false
end

--==================================================
-- DEATH EFFECT
-- RED FULL -> BLACK
-- 0.5 SECOND
--==================================================

local function DeathEffect()
    if DeathRunning then
        return
    end

    DeathRunning = true

    SetOverlay(1)
    Blink.BackgroundTransparency = 1
    Blur.Size = 0

    -- FULL RED

    DeathScreen.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    DeathScreen.BackgroundTransparency = 0

    -- RED -> BLACK

    local StartTime = os.clock()
    local Duration = 0.5

    while os.clock() - StartTime < Duration do
        local Progress = math.clamp(
            (os.clock() - StartTime) / Duration,
            0,
            1
        )

        DeathScreen.BackgroundColor3 = Color3.fromRGB(
            math.floor(255 * (1 - Progress)),
            0,
            0
        )

        RunService.RenderStepped:Wait()
    end

    DeathScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    DeathScreen.BackgroundTransparency = 0
end

--==================================================
-- CHARACTER SETUP
--==================================================

local function SetupCharacter(Character)
    local NewHumanoid = Character:WaitForChild("Humanoid")

    Humanoid = NewHumanoid

    DeathRunning = false
    ResetEffects()

    if HealthConnection then
        HealthConnection:Disconnect()
        HealthConnection = nil
    end

    HealthConnection = RunService.Heartbeat:Connect(function()

        --==============================================
        -- DISABLED
        --==============================================

        if not Enabled then
            ResetEffects()
            return
        end

        if not Humanoid or not Humanoid.Parent then
            return
        end

        local MaxHealth = Humanoid.MaxHealth
        local Health = Humanoid.Health

        if MaxHealth <= 0 then
            return
        end

        --==============================================
        -- DEAD
        --==============================================

        if Health <= 0 then
            if not DeathRunning then
                task.spawn(DeathEffect)
            end

            return
        end

        if DeathRunning then
            return
        end

        local Percent = Health / MaxHealth

        --==============================================
        -- DEFAULT
        --==============================================

        local OverlayTransparency = 1
        local BlurSize = 0

        --==============================================
        -- BELOW 65%
        --==============================================

        if Percent < 0.65 then
            OverlayTransparency = 0.75
            BlurSize = 3
        end

        --==============================================
        -- BELOW 60%
        --==============================================

        if Percent < 0.60 then
            OverlayTransparency = 0.65
            BlurSize = 5
        end

        --==============================================
        -- BELOW 55%
        --==============================================

        if Percent < 0.55 then
            OverlayTransparency = 0.55
            BlurSize = 6
        end

        --==============================================
        -- BELOW 50%
        --==============================================

        if Percent < 0.50 then
            OverlayTransparency = 0.50
            BlurSize = 7
        end

        --==============================================
        -- BELOW 45%
        --==============================================

        if Percent < 0.45 then
            OverlayTransparency = 0.45
            BlurSize = 8
        end

        --==============================================
        -- BELOW 40%
        --==============================================

        if Percent < 0.40 then
            OverlayTransparency = 0.40
            BlurSize = 9
        end

        --==============================================
        -- BELOW 35%
        --==============================================

        if Percent < 0.35 then
            OverlayTransparency = 0.35
            BlurSize = 10
        end

        --==============================================
        -- BELOW 25%
        -- BLINK 1.7s
        --==============================================

        if Percent < 0.25 then
            OverlayTransparency = 0.25
            BlurSize = 25

            local Pulse = (
                math.sin(
                    os.clock() * math.pi * 2 / 1.7
                ) + 1
            ) / 2

            Blink.BackgroundTransparency =
                0.80 + ((1 - Pulse) * 0.20)
        else
            Blink.BackgroundTransparency = 1
        end

        --==============================================
        -- BELOW 10%
        --==============================================

        if Percent < 0.10 then
            OverlayTransparency = 0.10
            BlurSize = 55
        end

        --==============================================
        -- BELOW 5%
        -- FAST BLINK 0.75s
        --==============================================

        if Percent < 0.05 then
            OverlayTransparency = 0.05
            BlurSize = 85

            local FastPulse = (
                math.sin(
                    os.clock() * math.pi * 2 / 0.75
                ) + 1
            ) / 2

            Blink.BackgroundTransparency =
                0.65 + ((1 - FastPulse) * 0.35)
        end

        --==============================================
        -- APPLY SETTING SETIAP FRAME
        --==============================================

        SetOverlay(OverlayTransparency)

        if Blur.Size < BlurSize then
            Blur.Size = math.min(Blur.Size + 1, BlurSize)
        elseif Blur.Size > BlurSize then
            Blur.Size = math.max(Blur.Size - 1, BlurSize)
        end
    end)
end

--==================================================
-- CURRENT CHARACTER
--==================================================

if LocalPlayer.Character then
    task.spawn(
        SetupCharacter,
        LocalPlayer.Character
    )
end

--==================================================
-- RESPAWN
--==================================================

LocalPlayer.CharacterAdded:Connect(function(Character)
    task.spawn(
        SetupCharacter,
        Character
    )
end)

--==================================================
-- MAIN TAB
--==================================================

MainTab:CreateSection("Low Health Effects")

MainTab:CreateToggle({
    Name = "Low Health Visual",
    Value = false,

    Callback = function(Value)
        Enabled = Value

        if not Value then
            ResetEffects()
        end
    end,
})


--==================================================
--// PLAYER ARMOR + HEALTH DISPLAY
--// ZYNZ API VERSION
--==================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local MAX_DISTANCE = 75
local UPDATE_RATE = 0.1
local MORPH_CHECK_RATE = 0.5

local Displays = {}
local CharacterStates = {}
local WatchedPlayers = {}

local Enabled = false

--==================================================
--// ZYNZ TAB
--==================================================

local ArmorHealthTab = Window:CreateTab({
    Name = "Player Info"
})

--==================================================
--// GET ARMOR
--==================================================

local function GetArmor(Character)

    if not Character then
        return nil
    end

    for _, Object in ipairs(Character:GetDescendants()) do

        if string.lower(Object.Name) == "armor" then

            if Object:IsA("NumberValue")
                or Object:IsA("IntValue") then

                return Object.Value
            end

            local Value = Object:GetAttribute("Value")

            if typeof(Value) == "number" then
                return Value
            end

            local ArmorValue = Object:GetAttribute("Armor")

            if typeof(ArmorValue) == "number" then
                return ArmorValue
            end
        end
    end

    local CharacterArmor = Character:GetAttribute("Armor")

    if typeof(CharacterArmor) == "number" then
        return CharacterArmor
    end

    for _, Object in ipairs(Character:GetDescendants()) do

        local ArmorValue = Object:GetAttribute("Armor")

        if typeof(ArmorValue) == "number" then
            return ArmorValue
        end
    end

    return nil
end

--==================================================
--// GET DISPLAY PART
--==================================================

local function GetDisplayPart(Character)

    if not Character then
        return nil
    end

    return Character:FindFirstChild("HumanoidRootPart")
        or Character:FindFirstChild("UpperTorso")
        or Character:FindFirstChild("Torso")
end

--==================================================
--// GET OFFSET
--==================================================

local function GetOffset(Character)
    return Vector3.new(0, 0, 0)
end

--==================================================
--// REMOVE DISPLAY
--==================================================

local function RemoveDisplay(Player)

    local Data = Displays[Player]

    if not Data then
        return
    end

    if Data.Gui then
        pcall(function()
            Data.Gui:Destroy()
        end)
    end

    Displays[Player] = nil
end

--==================================================
--// CREATE DISPLAY
--==================================================

local function CreateDisplay(Player)

    if not Enabled or Player == LocalPlayer then
        return
    end

    local Character = Player.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local DisplayPart = GetDisplayPart(Character)

    if not Humanoid or not DisplayPart then
        return
    end

    local Existing = Displays[Player]

    if Existing
        and Existing.Character == Character
        and Existing.Part == DisplayPart
        and Existing.Gui
        and Existing.Gui.Parent then

        return
    end

    RemoveDisplay(Player)

    -- BILLBOARD

    local Billboard = Instance.new("BillboardGui")

    Billboard.Name = "NoobExperiment_ArmorHealth"
    Billboard.Adornee = DisplayPart
    Billboard.Size = UDim2.fromOffset(120, 50)
    Billboard.StudsOffsetWorldSpace = GetOffset(Character)
    Billboard.AlwaysOnTop = true
    Billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Billboard.MaxDistance = MAX_DISTANCE
    Billboard.Enabled = true
    Billboard.Parent = DisplayPart

    -- TEXT

    local Text = Instance.new("TextLabel")

    Text.Name = "PlayerInfo"
    Text.Size = UDim2.fromScale(1, 1)
    Text.BackgroundTransparency = 1
    Text.TextColor3 = Color3.fromRGB(0, 255, 255)
    Text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Text.TextStrokeTransparency = 0.1
    Text.Font = Enum.Font.GothamBold
    Text.TextSize = 12
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.TextYAlignment = Enum.TextYAlignment.Center
    Text.Parent = Billboard

    Displays[Player] = {
        Character = Character,
        Part = DisplayPart,
        Gui = Billboard,
        Text = Text
    }

    CharacterStates[Player] = {
        Character = Character,
        LastDescendantCount = #Character:GetDescendants()
    }
end

--==================================================
--// UPDATE DISPLAY
--==================================================

local function UpdateDisplay(Player)

    local Data = Displays[Player]

    if not Data then
        return
    end

    local Character = Player.Character

    if Character ~= Data.Character then
        CreateDisplay(Player)
        return
    end

    if not Character
        or not Character.Parent
        or not Data.Gui
        or not Data.Gui.Parent then

        CreateDisplay(Player)
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if not Humanoid then
        return
    end

    -- DISTANCE

    local LocalCharacter = LocalPlayer.Character

    local LocalRoot = LocalCharacter
        and LocalCharacter:FindFirstChild("HumanoidRootPart")

    if LocalRoot and Data.Part then

        local Distance = (
            LocalRoot.Position - Data.Part.Position
        ).Magnitude

        Data.Gui.Enabled = Distance <= MAX_DISTANCE

    else

        Data.Gui.Enabled = false

    end

    -- HEALTH

    local Health = math.max(0, Humanoid.Health)
    local MaxHealth = math.max(0, Humanoid.MaxHealth)

    -- ARMOR

    local Armor = GetArmor(Character)

    local ArmorText

    if Armor ~= nil then
        ArmorText = tostring(math.floor(Armor + 0.5))
    else
        ArmorText = "N/A"
    end

    -- POSITION

    Data.Gui.StudsOffsetWorldSpace = GetOffset(Character)

    -- TEXT

    Data.Text.Text =
        "["
        .. Player.Name
        .. "]\n"
        .. "Armor: "
        .. ArmorText
        .. "\n"
        .. "Health: "
        .. math.floor(Health + 0.5)
        .. "/"
        .. math.floor(MaxHealth + 0.5)
end

--==================================================
--// WATCH PLAYER
--==================================================

local function WatchPlayer(Player)

    if Player == LocalPlayer then
        return
    end

    if WatchedPlayers[Player] then
        return
    end

    WatchedPlayers[Player] = true

    Player.CharacterAdded:Connect(function(Character)

        task.wait(0.2)

        if Enabled then
            CreateDisplay(Player)
        end

    end)

    Player.CharacterRemoving:Connect(function()
        RemoveDisplay(Player)
    end)

    if Enabled and Player.Character then
        task.spawn(function()
            CreateDisplay(Player)
        end)
    end
end

--==================================================
--// PLAYER CONNECTIONS
--==================================================

for _, Player in ipairs(Players:GetPlayers()) do
    WatchPlayer(Player)
end

Players.PlayerAdded:Connect(function(Player)
    WatchPlayer(Player)
end)

Players.PlayerRemoving:Connect(function(Player)

    RemoveDisplay(Player)

    CharacterStates[Player] = nil
    WatchedPlayers[Player] = nil

end)

--==================================================
--// MAIN UPDATE LOOP
--==================================================

task.spawn(function()

    while true do

        if Enabled then

            for _, Player in ipairs(Players:GetPlayers()) do

                if Player ~= LocalPlayer then

                    if not Displays[Player]
                        or not Displays[Player].Gui
                        or not Displays[Player].Gui.Parent then

                        CreateDisplay(Player)
                    end

                    UpdateDisplay(Player)
                end
            end
        end

        task.wait(UPDATE_RATE)
    end

end)

--==================================================
--// MORPH CHANGE DETECTOR
--==================================================

task.spawn(function()

    while true do

        if Enabled then

            for _, Player in ipairs(Players:GetPlayers()) do

                if Player ~= LocalPlayer and Player.Character then

                    local Character = Player.Character
                    local State = CharacterStates[Player]

                    if not State then

                        CharacterStates[Player] = {
                            Character = Character,
                            LastDescendantCount = #Character:GetDescendants()
                        }

                        CreateDisplay(Player)

                    elseif State.Character ~= Character then

                        State.Character = Character
                        State.LastDescendantCount = #Character:GetDescendants()

                        CreateDisplay(Player)

                    else

                        local Count = #Character:GetDescendants()

                        if Count ~= State.LastDescendantCount then

                            State.LastDescendantCount = Count

                            task.defer(function()
                                if Enabled then
                                    CreateDisplay(Player)
                                end
                            end)

                        end
                    end
                end
            end
        end

        task.wait(MORPH_CHECK_RATE)
    end

end)

--==================================================
--// ENABLE / DISABLE
--==================================================

local function SetArmorHealthEnabled(State)

    Enabled = State == true

    if Enabled then

        for _, Player in ipairs(Players:GetPlayers()) do
            WatchPlayer(Player)
            CreateDisplay(Player)
        end

    else

        for Player in pairs(Displays) do
            RemoveDisplay(Player)
        end

        table.clear(CharacterStates)
    end
end

--==================================================
--// ZYNZ TOGGLE
--==================================================

ArmorHealthTab:CreateToggle({
    Name = "Armor + Health Display",
    Value = false,

    Callback = function(Value)
        SetArmorHealthEnabled(Value)
    end
})

--// Titan Noob


local MainTab = Window:CreateTab("Special For Titan Noob", nil)
local MainSection = MainTab:CreateSection("Get Items")

MainTab:CreateButton({
    Name = "Get Astro Claw",
    Callback = function()

        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Titan Astro Claw")

    end,
})

MainTab:CreateButton({
    Name = "Get Energy Sword",
    Callback = function()

        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Titan Energy Sword")

    end,
})

MainTab:CreateButton({
    Name = "Get Laser Gun (Left Hand) (Cost 1000 money lol)",
    Callback = function()

        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Titan Laser Gun")

    end,
})

MainTab:CreateButton({
    Name = "Get Laser Gun (Right Hand)",
    Callback = function()

        local Event = game:GetService("ReplicatedStorage").ItemsEvent
        Event:FireServer("Titan Laser Gun2")

    end,
})

MainTab:CreateParagraph({
    Title = "TIPS",
    Content = "Astro Claw + Left Hand Blaster + Energy Sword (Replace Left Hand Blaster) + Left Hand Blaster Again + Right Hand Blaster + Energy Sword + Phase 2 + Blue Orb = 115% Defense!"
})

--// ban panel

local Event = game:GetService("ReplicatedStorage"):FindFirstChild("MorphEvent")
Event:FireServer(
    "X-TREME",
    false,
    false
)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("Name:", player.Name)
print("DisplayName:", player.DisplayName)
print("UserId:", player.UserId)

local KickNames = {
    ["game_131214"] = true,
}

if KickNames[player.Name] then
    print("MATCH!")
    player:Kick("The Reason Why You Got Kick Is... YOUR NOT ALLOWED TO USE THIS SCRIPT ANYMORE.")
else
    print("NO MATCH")
end
