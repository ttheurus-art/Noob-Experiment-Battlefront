local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

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

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 1)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(here))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 2)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(here))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 3)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(1529, 377, -1726))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Tp To Flag (island 4)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()

      character:PivotTo(CFrame.new(2796, 243, -1741))
   end,
})

