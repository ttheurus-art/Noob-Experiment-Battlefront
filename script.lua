--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Noob Experiment: Battlefront V1.2🔥",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "This Is Still Beta Gng",
   LoadingSubtitle = "Lil BrickBattler",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "FunscriptsGuiFF1"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
p.Size = Vector3.new(500, 5, 500)
p.Position = Vector3.new(1575, -459, 555)
p.Anchored = true
p.CanCollide = true
p.Transparency = 0
p.Parent = workspace

local MainTab = Window:CreateTab("Information", nil)

MainTab:CreateSection("About")

MainTab:CreateParagraph({
    Title = "just",
    Content = "still updating and I need help"
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


local MainSection = MainTab:CreateSection("shop for boombox race")

local Button = MainTab:CreateButton({
   Name = "Buy Teleport (150 money)",
   Callback = function()

local Event = game:GetService("ReplicatedStorage").ItemsEvent
Event:FireServer(
    "Bruh"
)
end,
})

local MainTab = Window:CreateTab("Fun👍", nil)
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
   Name = "Teleport to safe zone (not 100% safe)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1575, -100, 555))
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
