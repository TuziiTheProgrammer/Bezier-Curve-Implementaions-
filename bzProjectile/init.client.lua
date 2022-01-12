local player = script.Parent.Parent
player.CharacterAdded:wait()
local char = player.Character
local t_start = os.time()
local mouse = player:GetMouse()
mouse.TargetFilter = workspace.AntiMouse

local point_part = Instance.new("Part", workspace.AntiMouse)
point_part.Anchored = true
point_part.Color = Color3.fromRGB(255, 0, 0)
point_part.Size = Vector3.new(4,.5,4)
point_part.Material = Enum.Material.Neon

local co = coroutine.wrap(function()
	while wait() do
		point_part.Position = mouse.hit.p
	end
end)()

mouse.Button1Down:connect(function()
	if os.time() - t_start >= 1.5 then
		t_start = os.time()
		script.RemoteEvent:FireServer("Click", mouse.Hit.p)
		point_part.Color = Color3.fromRGB(0, 255, 0)
	end
end)

mouse.Button1Up:connect(function()
	wait(.5)
	point_part.Color = Color3.fromRGB(255, 0, 0)
end)