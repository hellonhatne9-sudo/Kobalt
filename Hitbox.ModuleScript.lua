-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.Hitbox

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Shared.Config.DamageConfig)
local v_u_3 = {
	["BodyParts"] = {
		"Head",
		"Torso",
		"Left Arm",
		"Right Arm",
		"Left Leg",
		"Right Leg"
	}
}
local v_u_4 = {}
for _, v5 in v_u_3.BodyParts do
	v_u_4[v5] = true
end
v_u_3.IsBodyPart = v_u_4
function v_u_3.zoneFromNormalized(p6, p7) -- name: zoneFromNormalized
	return p6 == "Head" and (p7 < -0.5 and "Neck" or "Head") or (p6 == "Torso" and (p7 > 0.72 and "Clavicle" or (p7 > 0.2 and "UpperChest" or (p7 > -0.25 and "Stomach" or (p7 > -0.62 and "LowerStomach" or "Pelvis")))) or ((p6 == "Left Arm" or p6 == "Right Arm") and (p7 > 0.05 and "UpperArm" or (p7 > -0.68 and "Forearm" or "Hand")) or ((p6 == "Left Leg" or p6 == "Right Leg") and (p7 > 0 and "Thigh" or (p7 > -0.75 and "Calf" or "Foot")) or "Stomach")))
end
function v_u_3.zoneFromPart(p8, p9, p10) -- name: zoneFromPart
	-- upvalues: (copy) v_u_3
	local v11 = (p10 or p8.CFrame):PointToObjectSpace(p9).Y
	local v12 = p8.Size.Y * 0.5
	local v13 = v11 / math.max(v12, 0.001)
	return v_u_3.zoneFromNormalized(p8.Name, (math.clamp(v13, -1, 1)))
end
local function v_u_27(p14, p15) -- name: outside
	local v16 = p14.CFrame:PointToObjectSpace(p15)
	local v17 = p14.Size * 0.5
	local v18 = v16.X
	local v19 = math.abs(v18) - v17.X
	local v20 = math.max(v19, 0)
	local v21 = v16.Y
	local v22 = math.abs(v21) - v17.Y
	local v23 = math.max(v22, 0)
	local v24 = v16.Z
	local v25 = math.abs(v24) - v17.Z
	local v26 = math.max(v25, 0)
	return Vector3.new(v20, v23, v26).Magnitude
end
v_u_3.outside = v_u_27
function v_u_3.bodyDistance(p28, p29) -- name: bodyDistance
	-- upvalues: (copy) v_u_3, (copy) v_u_27
	local v30 = (1 / 0)
	for _, v31 in v_u_3.BodyParts do
		local v32 = p28:FindFirstChild(v31)
		if not (v32 and v32:IsA("BasePart")) then
			continue
		end
		local v33 = v_u_27(v32, p29)
		if v33 >= v30 then
			continue
		end
		v30 = v33
	end
	return v30
end
function v_u_3.nearestBodyPart(p34, p35) -- name: nearestBodyPart
	-- upvalues: (copy) v_u_3, (copy) v_u_27
	local v36 = (1 / 0)
	local v37 = nil
	for _, v38 in v_u_3.BodyParts do
		local v39 = p34:FindFirstChild(v38)
		if not (v39 and v39:IsA("BasePart")) then
			continue
		end
		local v40 = v_u_27(v39, p35)
		if v40 >= v36 then
			continue
		end
		v37 = v39
		v36 = v40
	end
	return v37
end
function v_u_3.zoneFor(p41, p42, p43) -- name: zoneFor
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if v_u_4[p42.Name] and p42.Parent == p41 then
		return v_u_3.zoneFromPart(p42, p43), p42
	else
		local v44 = v_u_3.nearestBodyPart(p41, p43)
		if v44 then
			return v_u_3.zoneFromPart(v44, p43), v44
		else
			return "Stomach", nil
		end
	end
end
function v_u_3.group(p45) -- name: group
	-- upvalues: (copy) v_u_2
	return v_u_2.ZoneGroup[p45] or "Body"
end
function v_u_3.isLimb(p46) -- name: isLimb
	-- upvalues: (copy) v_u_2
	return v_u_2.ZoneGroup[p46] == "Limb"
end
function v_u_3.mult(p47, p48) -- name: mult
	-- upvalues: (copy) v_u_2
	local v49 = v_u_2.Zones[p48] or 1
	local v50 = v_u_2.Class[p47] or v_u_2.Class.AR
	local v51 = v_u_2.ZoneGroup[p48] or "Body"
	return v49 * (v50[p48] or (v50[v51] or 1))
end
function v_u_3.best(p52, p53) -- name: best
	-- upvalues: (copy) v_u_3
	local v54 = p53[1]
	local v55 = -1
	for _, v56 in p53 do
		local v57 = v_u_3.mult(p52, v56)
		if v55 >= v57 then
			continue
		end
		v54 = v56
		v55 = v57
	end
	return v54
end
v_u_3.GhostNames = {
	["HumanoidRootPart"] = true,
	["WallHull"] = true,
	["SpaceRing"] = true
}
local function v_u_60(p58) -- name: characterOf
	local v59 = p58.Parent
	for _ = 1, 6 do
		if not v59 or v59 == workspace then
			return nil
		end
		if v59:IsA("Model") and v59:FindFirstChildOfClass("Humanoid") then
			return v59
		end
		v59 = v59.Parent
	end
	return nil
end
function v_u_3.passThrough(p61) -- name: passThrough
	-- upvalues: (copy) v_u_60, (copy) v_u_4, (copy) v_u_3
	if p61 and p61:IsA("BasePart") then
		local v62 = v_u_60(p61)
		if v62 then
			local v63 = v62:FindFirstChildOfClass("Humanoid")
			if (v63 == nil or v63.Health <= 0) and true or v62:GetAttribute("Eliminated") == true then
				return true
			elseif v_u_4[p61.Name] and p61.Parent == v62 then
				return false
			else
				return v_u_3.GhostNames[p61.Name] == true and true or p61.Transparency >= 0.99
			end
		else
			return false
		end
	else
		return false
	end
end
local v_u_64 = {}
local v_u_65 = -10
function v_u_3.ghostList() -- name: ghostList
	-- upvalues: (ref) v_u_65, (copy) v_u_64, (copy) v_u_3
	local v66 = os.clock()
	if v66 - v_u_65 < 0.25 then
		return v_u_64
	end
	v_u_65 = v66
	table.clear(v_u_64)
	local v67 = workspace:FindFirstChild("Live")
	if v67 then
		for _, v68 in v67:GetChildren() do
			if not v68:IsA("Model") then
				continue
			end
			local v69 = v68:FindFirstChildOfClass("Humanoid")
			if (v69 == nil or v69.Health <= 0) and true or v68:GetAttribute("Eliminated") == true then
				local v70 = v_u_64
				table.insert(v70, v68)
			else
				for v71 in v_u_3.GhostNames do
					local v72 = v68:FindFirstChild(v71)
					if not v72 then
						continue
					end
					local v73 = v_u_64
					table.insert(v73, v72)
				end
			end
		end
	end
	return v_u_64
end
function v_u_3.addGhosts(p74) -- name: addGhosts
	-- upvalues: (copy) v_u_3
	local v75 = v_u_3.ghostList()
	table.move(v75, 1, #v75, #p74 + 1, p74)
	return p74
end
return v_u_3