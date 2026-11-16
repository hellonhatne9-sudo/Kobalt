-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.VehicleFire

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Shared.Config.VehicleConfig)
local v_u_3 = {}
local v_u_4 = v2.Fire or {}
v_u_3.Config = v_u_4
local v_u_5 = {
	["Primary1"] = true,
	["Primary2"] = true,
	["Pistol"] = true
}
local v_u_6 = CFrame.new(0, -1, 0)
function v_u_3.wrap180(p7) -- name: wrap180
	return (p7 + 180) % 360 - 180
end
function v_u_3.isGunSlot(p8) -- name: isGunSlot
	-- upvalues: (copy) v_u_5
	return v_u_5[p8 or ""] == true
end
function v_u_3.rule(p9, p10) -- name: rule
	-- upvalues: (copy) v_u_4
	local v11 = p9 and v_u_4.Seats
	if v11 then
		v11 = v_u_4.Seats[p9]
	end
	return v11 and (p10 and v11[p10]) or nil
end
function v_u_3.vehicleOf(p12) -- name: vehicleOf
	if p12 then
		p12 = p12:FindFirstChild("HumanoidRootPart")
	end
	if p12 and p12:IsA("BasePart") then
		local v13 = p12.AssemblyRootPart
		local v14
		if v13 then
			v14 = v13 ~= p12 and v13.Parent or nil
		else
			v14 = nil
		end
		if v14 and (v14:IsA("Model") and v14:GetAttribute("Kind") ~= nil) then
			return v14
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_3.vehicleFromPart(p15) -- name: vehicleFromPart
	local v16 = workspace:FindFirstChild("Vehicles")
	while v16 and (p15 and p15 ~= workspace) do
		if p15.Parent == v16 and p15:IsA("Model") then
			return p15
		end
		p15 = p15.Parent
	end
	return nil
end
function v_u_3.occupants(p17) -- name: occupants
	local v18 = {}
	for _, v19 in p17:GetChildren() do
		if not v19:IsA("Seat") then
			continue
		end
		local v20 = v19:FindFirstChild("VehicleWeld")
		local v21 = v20 and (v20:IsA("JointInstance") and v20.Part1) or nil
		if v21 then
			v21 = v21.Parent
		end
		if not (v21 and v21:IsA("Model")) then
			continue
		end
		table.insert(v18, v21)
	end
	return v18
end
function v_u_3.ruleFor(p22) -- name: ruleFor
	-- upvalues: (copy) v_u_3
	if not p22 or p22:GetAttribute("InVehicle") ~= true then
		return nil, nil, nil
	end
	local v23 = v_u_3.vehicleOf(p22)
	local v24
	if v23 then
		v24 = v23:GetAttribute("Kind")
	else
		v24 = v23
	end
	return v_u_3.rule(v24, p22:GetAttribute("VehicleSeat")), v23, v24
end
function v_u_3.firing(p25) -- name: firing
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	if p25 and (p25:GetAttribute("InVehicle") == true and p25:GetAttribute("Knocked") ~= true) then
		if v_u_5[p25:GetAttribute("EquippedSlot") or ""] then
			local v26, v27, v28 = v_u_3.ruleFor(p25)
			if v26 and v27 then
				return v26, v27, v28
			else
				return nil, nil, nil
			end
		else
			return nil, nil, nil
		end
	else
		return nil, nil, nil
	end
end
function v_u_3.flat(p29) -- name: flat
	local v30 = p29.LookVector
	local v31 = v30.X
	local v32 = v30.Z
	local v33 = Vector3.new(v31, 0, v32)
	return CFrame.lookAt(Vector3.new(0, 0, 0), v33.Magnitude > 0.05 and v33.Unit or Vector3.new(0, 0, -1))
end
function v_u_3.angles(p34, p35) -- name: angles
	local v36 = p34:VectorToObjectSpace(p35)
	local v37 = v36.Magnitude
	if v37 < 1e-6 then
		return 0, 0
	end
	local v38 = v36 / v37
	local v39 = v38.X
	local v40 = -v38.Z
	local v41 = math.atan2(v39, v40)
	local v42 = math.deg(v41)
	local v43 = v38.Y
	local v44 = math.clamp(v43, -1, 1)
	local v45 = math.asin(v44)
	return v42, math.deg(v45)
end
function v_u_3.dirFrom(p46, p47, p48) -- name: dirFrom
	local v49 = math.rad(p47)
	local v50 = math.rad(p48)
	local v51 = math.sin(v49) * math.cos(v50)
	local v52 = math.sin(v50)
	local v53 = -math.cos(v49) * math.cos(v50)
	return p46:VectorToWorldSpace((Vector3.new(v51, v52, v53)))
end
function v_u_3.inArc(p54, p55, p56, p57) -- name: inArc
	-- upvalues: (copy) v_u_4
	local v58 = p57 or 0
	local v59 = (p55 - p54.Yaw + 180) % 360 - 180
	if math.abs(v59) > p54.Half + v58 then
		return false
	end
	local v60
	if (v_u_4.PitchMin or -35) - v58 <= p56 then
		v60 = p56 <= (v_u_4.PitchMax or 65) + v58
	else
		v60 = false
	end
	return v60
end
function v_u_3.clamp(p61, p62, p63, p64) -- name: clamp
	-- upvalues: (copy) v_u_4
	local v65 = p64 or 0
	local v66 = (p62 - p61.Yaw + 180) % 360 - 180
	local v67 = -p61.Half - v65
	local v68 = p61.Half + v65
	local v69 = math.clamp(v66, v67, v68)
	local v70 = p61.Yaw + v69
	local v71 = (v_u_4.PitchMin or -35) - v65
	local v72 = (v_u_4.PitchMax or 65) + v65
	return v70, math.clamp(p63, v71, v72)
end
function v_u_3.lean(p73, p74, p75, p76) -- name: lean
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	local v77 = math.clamp(p76 or 0, 0, 1)
	if v77 <= 0 then
		return CFrame.identity
	end
	local v78 = (p73.Lean or 0) * v77
	local v79 = p73.Side or 0
	local v80 = v_u_4.TwistMax or 175
	local v81 = ((p75 or (p73.Yaw or 0)) + 180) % 360 - 180
	local v82 = -v80
	local v83 = math.clamp(v81, v82, v80) * v77
	local v84 = (v_u_4.LeanOutKind and p74 and v_u_4.LeanOutKind[p74] or (v_u_4.LeanOut or 1.6)) * v78
	local v85 = v_u_6 * CFrame.Angles(0, -math.rad(v83), 0) * v_u_6:Inverse()
	local v86 = v_u_6
	local v87 = CFrame.Angles
	local v88 = -v79
	local v89 = (v_u_4.LeanRoll or 30) * v78
	local v90 = v86 * v87(0, 0, v88 * math.rad(v89)) * v_u_6:Inverse()
	local v91 = (v_u_4.LeanUpKind and (p74 and v_u_4.LeanUpKind[p74]) or (v_u_4.LeanUp or 0.5)) * v78
	return CFrame.new(v79 * v84, v91, 0) * v90 * v85
end
function v_u_3.leanFor(p92) -- name: leanFor
	-- upvalues: (copy) v_u_3
	local v93, _, v94 = v_u_3.firing(p92)
	if not v93 then
		return nil
	end
	local v95 = p92:GetAttribute("AimYaw")
	local v96 = v_u_3.lean
	if type(v95) ~= "number" then
		v95 = v93.Yaw
	end
	return v96(v93, v94, v95, 1)
end
function v_u_3.cabinBlocks(p97, p98, p99, p100) -- name: cabinBlocks
	-- upvalues: (copy) v_u_4
	local v101 = p97 and v_u_4.Cabin
	if v101 then
		v101 = v_u_4.Cabin[p97]
	end
	if not v101 then
		return false
	end
	local v102 = v101[1]
	local v103 = v101[2]
	local v104 = p98:PointToObjectSpace(p99) - v102
	local v105 = p98:PointToObjectSpace(p100) - v102 - v104
	local v106 = 0
	local v107 = 1
	for _, v108 in { "X", "Y", "Z" } do
		local v109 = v104[v108]
		local v110 = v105[v108]
		local v111 = v103[v108]
		if math.abs(v110) < 1e-9 then
			if v111 >= math.abs(v109) then
				continue
			end
			return false
		end
		local v112 = (-v111 - v109) / v110
		local v113 = (v111 - v109) / v110
		if v113 >= v112 then
			local v114 = v112
			v112 = v113
			v113 = v114
		end
		v106 = math.max(v106, v113)
		v107 = math.min(v107, v112)
		if v107 >= v106 then
			continue
		end
		return false
	end
	return true
end
local v_u_115 = RaycastParams.new()
v_u_115.FilterType = Enum.RaycastFilterType.Include
local v_u_116 = RaycastParams.new()
v_u_116.FilterType = Enum.RaycastFilterType.Include
function v_u_3.inWindow(p117, p118) -- name: inWindow
	-- upvalues: (copy) v_u_4
	local v119 = p117 and v_u_4.Windows
	if v119 then
		v119 = v_u_4.Windows[p117]
	end
	if not v119 then
		return false
	end
	for _, v120 in v119 do
		local v121 = p118 - v120[1]
		local v122 = v120[2]
		local v123 = v121.X
		if math.abs(v123) > v122.X then
			continue
		end
		local v124 = v121.Y
		if math.abs(v124) > v122.Y then
			continue
		end
		local v125 = v121.Z
		if math.abs(v125) > v122.Z then
			continue
		end
		return true
	end
	return false
end
function v_u_3.entryOpen(p126, p127, p128, p129) -- name: entryOpen
	-- upvalues: (copy) v_u_116, (copy) v_u_3
	local v130 = p126.PrimaryPart
	local v131 = p126:FindFirstChild("Hitbox")
	if not (v130 and v131) then
		return false
	end
	local v132 = v130.CFrame
	if p129 then
		local v133 = v132 * p129:Inverse()
		p127 = v133 * p127
		p128 = v133 * p128
	end
	local v134 = p128 - p127
	if v134.Magnitude < 0.0001 then
		return false
	end
	v_u_116.FilterDescendantsInstances = { v131 }
	local v135 = workspace:Raycast(p127, v134, v_u_116)
	return not v135 and true or v_u_3.inWindow(p126:GetAttribute("Kind"), v132:PointToObjectSpace(v135.Position))
end
function v_u_3.throughHit(p136, p137, p138, p139, p140) -- name: throughHit
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_115
	local v141 = v_u_3.vehicleFromPart(p136)
	local v142
	if v141 then
		v142 = v141:GetAttribute("Kind")
	else
		v142 = v141
	end
	local v143
	if v141 then
		v143 = v141.PrimaryPart
	else
		v143 = v141
	end
	if v141 and (v142 and (v143 and p138.Magnitude >= 1e-6)) then
		local v144 = v_u_3.inWindow(v142, v143.CFrame:PointToObjectSpace(p137))
		local v145 = v_u_4.Cabin
		if v145 then
			v145 = v_u_4.Cabin[v142] ~= nil
		end
		if v144 or v145 then
			local v146 = {}
			for _, v147 in v_u_3.occupants(v141) do
				if v147 == p140 or not (v144 or v_u_3.firing(v147)) then
					continue
				end
				table.insert(v146, v147)
			end
			if #v146 == 0 then
				return nil, nil, nil
			else
				v_u_115.FilterDescendantsInstances = v146
				local v148 = p138.Unit
				local v149 = workspace:Raycast(p137 - v148 * 2, v148 * ((p139 or 20) + 2), v_u_115)
				if v149 then
					local v150 = v149.Position - v148 * 30
					if v144 and v_u_3.entryOpen(v141, v150, v149.Position) then
						return v149.Instance, v149.Position, v149.Normal
					else
						local v151 = nil
						for _, v152 in v146 do
							if not v149.Instance:IsDescendantOf(v152) then
								continue
							end
							v151 = v152
						end
						if v145 and (v151 and (v_u_3.firing(v151) and not v_u_3.cabinBlocks(v142, v143.CFrame, v150, v149.Position))) then
							return v149.Instance, v149.Position, v149.Normal
						else
							return nil, nil, nil
						end
					end
				else
					return nil, nil, nil
				end
			end
		else
			return nil, nil, nil
		end
	else
		return nil, nil, nil
	end
end
return v_u_3