-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.FlareSky

local v_u_1 = {
	["UP"] = 300,
	["ALONG"] = 200
}
local v_u_2 = {
	"Live",
	"Loot",
	"FX",
	"Projectiles",
	"DeployFX",
	"PingFX",
	"FootstepFX",
	"AudioEmitters",
	"ZoneFX",
	"FarViewFX"
}
local v_u_3 = RaycastParams.new()
v_u_3.FilterType = Enum.RaycastFilterType.Exclude
v_u_3.RespectCanCollide = true
v_u_3.IgnoreWater = true
local function v_u_8(p4) -- name: setFilter
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = {}
	if p4 then
		table.insert(v5, p4)
	end
	for _, v6 in v_u_2 do
		local v7 = workspace:FindFirstChild(v6)
		if not v7 then
			continue
		end
		table.insert(v5, v7)
	end
	v_u_3.FilterDescendantsInstances = v5
end
function v_u_1.blocked(p9, p10, p11, p12) -- name: blocked
	-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_3
	v_u_8(p12)
	if typeof(p9) == "Vector3" then
		local v13 = workspace
		local v14 = v_u_1.UP
		if v13:Raycast(p9, Vector3.new(0, v14, 0), v_u_3) then
			return true, "cover"
		end
	end
	if typeof(p10) == "Vector3" and (typeof(p11) == "Vector3" and (p11.Magnitude > 0.001 and workspace:Raycast(p10, p11.Unit * v_u_1.ALONG, v_u_3))) then
		return true, "cover"
	else
		return false, nil
	end
end
return v_u_1