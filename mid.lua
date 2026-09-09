--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Red Vs Blue Plane Wars🔥",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "The Red Vs Blie Plane Wars Script",
   LoadingSubtitle = "By: Theurus_The_Creator",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "RedVsBluePlaneWars"
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
p.Size = Vector3.new(15, 3, 15)
p.Position = Vector3.new(2796, 243, -1741)
p.Anchored = true
p.CanCollide = true
p.Transparency = 0.3
p.Parent = workspace

local p = Instance.new("Part2")
p2.Size = Vector3.new(15, 3, 15)
p2.Position = Vector3.new(1529, 377, -1726)
p2.Anchored = true
p2.CanCollide = true
p2.Transparency = 0.3
p2.Parent = workspace

local p = Instance.new("Part3")
p3.Size = Vector3.new(15, 3, 15)
p3.Position = Vector3.new(-1010, 507, -1810)
p3.Anchored = true
p3.CanCollide = true
p3.Transparency = 0.3
p3.Parent = workspace

local p = Instance.new("Part4")
p4.Size = Vector3.new(15, 3, 15)
p4.Position = Vector3.new(-1010, 507, -1810)
p4.Anchored = true
p4.CanCollide = true
p4.Transparency = 0.3
p4.Parent = workspace

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 1)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(-2242, 460, -1774))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 2)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(-1010, 510, -1810))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 3)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1529, 380, -1726))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 4)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(2796, 246, -1741))
   end,
})

