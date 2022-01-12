local function bezierQuadratic(t, p0, p1, p2)
	return ((1 - t)^2 * p0 + 2*(t)*(1 - t) * p1 + (t)^2 * p2 )
end

local function midPoint(x, y)
	return (x + y)/2
end

local thing = script.Parent.OnServerEvent:Connect(function(plr, Action, v1, v2)
	local char = plr.Character
	if Action == "Click" then
		local p2 = v1
		local p0 = workspace.Shooting_Part.Position 
		local p1_part = Instance.new("Part", workspace)
		p1_part.Size = Vector3.new(1,1,1)
		p1_part.Transparency = 1
		p1_part.Anchored = true
		p1_part.Position = midPoint(p2, p0)
		p1_part.CFrame = p1_part.CFrame * CFrame.new(0,70,0)
		local p1 = p1_part.Position
		
		local travel_part = Instance.new("Part", workspace)
		travel_part.Anchored = true
		travel_part.Size = Vector3.new(4,4,4)
		travel_part.Material = Enum.Material.Neon
		travel_part.CanCollide = true
		for i = 0, 2, 0.05 do
			wait()
			local BQ = bezierQuadratic(i, p0, p1, p2)
			travel_part.Position = BQ
		end
		game.Debris:AddItem(travel_part,0)
		game.Debris:AddItem(p1_part, 0)
	end
end)

