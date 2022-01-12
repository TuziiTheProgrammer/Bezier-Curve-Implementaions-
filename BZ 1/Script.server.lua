local P0, P1, P2 = workspace.p0, workspace.p1, workspace.p2

local tab_ = {P0, P1, P2}
for _, thing in pairs(tab_) do
	thing.Transparency = 0.5
end

local function quadraticBezier(interpilation, p0, p1, p2)
	return ((1 - interpilation)^2 * p0 + 2*(interpilation)*(1 - interpilation) * p1 + (interpilation)^2 * p2 )
end

local part = Instance.new("Part", workspace)
part.Name = "Balls"
part.Size = Vector3.new(1,1,1)
part.Anchored = true
part.Material = Enum.Material.Neon
part.Color = Color3.fromRGB(255, 170, 0)
part.CFrame = P0.CFrame * CFrame.new(0,0,0)

for t = 0, 1, 0.01 do
	wait()
	local qb = quadraticBezier(t, P0.Position, P1.Position, P2.Position)
	part.Position = qb
	local co = coroutine.wrap(function()
		local point = Instance.new("Part", workspace)
		point.Anchored = true
		point.Size = Vector3.new(.5,.5,.5)
		point.Position = part.Position
		point.Material = Enum.Material.Neon
		point.Color = Color3.fromRGB(170, 85, 255)
	end)()	
end




