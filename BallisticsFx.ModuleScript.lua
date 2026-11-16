-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.BallisticsFx

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("SoundService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = require(v_u_3.Shared.Net)
local v_u_7 = require(v_u_3.Shared.Util.Participant)
local v_u_8 = require(v_u_3.Shared.Util.Units)
local v_u_9 = require(v_u_3.Shared.Config.WeaponConfig)
local v_u_10 = require(v_u_3.Shared.Config.AudioConfig)
local v_u_11 = require(v_u_3.Shared.Combat.Ballistics)
local v_u_12 = require(v_u_3.Shared.Combat.Hitbox)
local v_u_13 = {}
local v_u_14 = v1.LocalPlayer
local v_u_15 = Random.new()
local v_u_16 = v_u_8.ms(340)
local v_u_17 = {}
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = {}
local function v_u_27(p21, p22) -- name: makeEmitter
	local v23 = Instance.new("ParticleEmitter")
	v23.Enabled = false
	v23.Rate = 0
	v23.Texture = p22.tex or "rbxasset://textures/particles/smoke_main.dds"
	local v24 = p22.color
	if not v24 then
		local v25, v26 = Color3.new(1, 1, 1)
		v24 = ColorSequence.new(v25, v26 or v25)
	end
	v23.Color = v24
	v23.Size = p22.size or NumberSequence.new(0.3, 1)
	v23.Transparency = p22.trans or NumberSequence.new(0.3, 1)
	v23.Lifetime = p22.life or NumberRange.new(0.5, 1)
	v23.Speed = p22.speed or NumberRange.new(2, 5)
	v23.SpreadAngle = p22.spread or Vector2.new(30, 30)
	v23.Acceleration = p22.accel or Vector3.new(0, 0, 0)
	v23.Drag = p22.drag or 0
	v23.LightEmission = p22.light or 0
	v23.LightInfluence = p22.lightInf or 1
	v23.Rotation = NumberRange.new(0, 360)
	v23.RotSpeed = p22.rot or NumberRange.new(-60, 60)
	v23.EmissionDirection = p22.dir or Enum.NormalId.Top
	v23.ZOffset = p22.z or 0
	if p22.flip then
		v23.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		v23.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	end
	v23.LockedToPart = p22.locked == true
	v23.Parent = p21
	return v23
end
local v_u_28 = {}
local v29 = {}
local v30 = {
	["n"] = 6,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["drag"] = 4,
	["accel"] = Vector3.new(0, 1, 0)
}
local v31, v32 = Color3.fromRGB(165, 160, 150)
v30.color = ColorSequence.new(v31, v32 or v31)
v30.size = NumberSequence.new(0.25, 1.8)
v30.trans = NumberSequence.new(0.45, 1)
v30.life = NumberRange.new(0.6, 1.2)
v30.speed = NumberRange.new(3, 8)
v30.spread = Vector2.new(25, 25)
local v33 = {
	["n"] = 7,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -35, 0)
}
local v34, v35 = Color3.fromRGB(120, 115, 110)
v33.color = ColorSequence.new(v34, v35 or v34)
v33.size = NumberSequence.new(0.09, 0.05)
v33.trans = NumberSequence.new(0, 0.2)
v33.life = NumberRange.new(0.4, 0.8)
v33.speed = NumberRange.new(10, 18)
v33.spread = Vector2.new(55, 55)
__set_list(v29, 1, {v30, v33})
v_u_28.Dust = v29
local v36 = {}
local v37 = {
	["n"] = 12,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -45, 0),
	["light"] = 1
}
local v38, v39 = Color3.fromRGB(255, 205, 130)
v37.color = ColorSequence.new(v38, v39 or v38)
v37.size = NumberSequence.new(0.12, 0)
v37.trans = NumberSequence.new(0, 0.4)
v37.life = NumberRange.new(0.12, 0.35)
v37.speed = NumberRange.new(14, 32)
v37.spread = Vector2.new(65, 65)
local v40 = {
	["n"] = 2,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["drag"] = 3
}
local v41, v42 = Color3.fromRGB(150, 150, 150)
v40.color = ColorSequence.new(v41, v42 or v41)
v40.size = NumberSequence.new(0.2, 1)
v40.trans = NumberSequence.new(0.6, 1)
v40.life = NumberRange.new(0.4, 0.7)
v40.speed = NumberRange.new(2, 4)
__set_list(v36, 1, {v37, v40})
v_u_28.Sparks = v36
local v43 = {}
local v44 = {
	["n"] = 9,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -32, 0)
}
local v45, v46 = Color3.fromRGB(145, 105, 62)
v44.color = ColorSequence.new(v45, v46 or v45)
v44.size = NumberSequence.new(0.13, 0.08)
v44.trans = NumberSequence.new(0, 0.2)
v44.life = NumberRange.new(0.5, 0.9)
v44.speed = NumberRange.new(9, 18)
v44.spread = Vector2.new(50, 50)
local v47 = {
	["n"] = 4,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["drag"] = 4
}
local v48, v49 = Color3.fromRGB(150, 125, 95)
v47.color = ColorSequence.new(v48, v49 or v48)
v47.size = NumberSequence.new(0.25, 1.3)
v47.trans = NumberSequence.new(0.5, 1)
v47.life = NumberRange.new(0.5, 0.9)
v47.speed = NumberRange.new(2, 5)
__set_list(v43, 1, {v44, v47})
v_u_28.Splinters = v43
local v50 = {}
local v51 = {
	["n"] = 7,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["drag"] = 3,
	["accel"] = Vector3.new(0, -10, 0)
}
local v52, v53 = Color3.fromRGB(115, 95, 72)
v51.color = ColorSequence.new(v52, v53 or v52)
v51.size = NumberSequence.new(0.35, 2.2)
v51.trans = NumberSequence.new(0.35, 1)
v51.life = NumberRange.new(0.7, 1.3)
v51.speed = NumberRange.new(6, 13)
v51.spread = Vector2.new(18, 18)
local v54 = {
	["n"] = 8,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -40, 0)
}
local v55, v56 = Color3.fromRGB(80, 66, 50)
v54.color = ColorSequence.new(v55, v56 or v55)
v54.size = NumberSequence.new(0.12, 0.08)
v54.trans = NumberSequence.new(0, 0.1)
v54.life = NumberRange.new(0.6, 1)
v54.speed = NumberRange.new(10, 20)
v54.spread = Vector2.new(30, 30)
__set_list(v50, 1, {v51, v54})
v_u_28.Dirt = v50
local v57 = {}
local v58 = {
	["n"] = 14,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -45, 0),
	["light"] = 0.3
}
local v59, v60 = Color3.fromRGB(220, 235, 245)
v58.color = ColorSequence.new(v59, v60 or v59)
v58.size = NumberSequence.new(0.12, 0.06)
v58.trans = NumberSequence.new(0.1, 0.4)
v58.life = NumberRange.new(0.6, 1.1)
v58.speed = NumberRange.new(8, 18)
v58.spread = Vector2.new(60, 60)
__set_list(v57, 1, {v58})
v_u_28.Glass = v57
local v61 = {}
local v62 = {
	["n"] = 10,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -45, 0)
}
local v63, v64 = Color3.fromRGB(225, 235, 245)
v62.color = ColorSequence.new(v63, v64 or v63)
v62.size = NumberSequence.new(0.25, 1.4)
v62.trans = NumberSequence.new(0.35, 1)
v62.life = NumberRange.new(0.45, 0.8)
v62.speed = NumberRange.new(10, 20)
v62.spread = Vector2.new(12, 12)
__set_list(v61, 1, {v62})
v_u_28.Water = v61
local v65 = {}
local v66 = {
	["n"] = 3,
	["tex"] = "rbxassetid://117259566277353",
	["flip"] = true,
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -12, 0),
	["lightInf"] = 0.35,
	["light"] = 0.1,
	["dir"] = nil
}
local v67 = Color3.fromRGB(70, 235, 90)
local v68 = Color3.fromRGB(28, 135, 48)
v66.color = ColorSequence.new(v67, v68 or v67)
v66.size = NumberSequence.new(0.6, 2)
v66.trans = NumberSequence.new(0, 1)
v66.life = NumberRange.new(0.22, 0.36)
v66.speed = NumberRange.new(2, 6)
v66.spread = Vector2.new(55, 55)
v66.dir = Enum.NormalId.Front
local v69 = {
	["n"] = 10,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -38, 0),
	["lightInf"] = 0.4,
	["dir"] = nil
}
local v70 = Color3.fromRGB(70, 235, 90)
local v71 = Color3.fromRGB(28, 135, 48)
v69.color = ColorSequence.new(v70, v71 or v70)
v69.size = NumberSequence.new(0.14, 0.08)
v69.trans = NumberSequence.new(0, 0.3)
v69.life = NumberRange.new(0.3, 0.6)
v69.speed = NumberRange.new(8, 20)
v69.spread = Vector2.new(45, 45)
v69.dir = Enum.NormalId.Front
local v72 = {
	["n"] = 3,
	["tex"] = "rbxassetid://97779084885256",
	["flip"] = true,
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["drag"] = 5,
	["lightInf"] = 0.4,
	["light"] = 0.15,
	["dir"] = nil
}
local v73 = Color3.fromRGB(110, 245, 125)
local v74 = Color3.fromRGB(45, 170, 65)
v72.color = ColorSequence.new(v73, v74 or v73)
v72.size = NumberSequence.new(0.8, 3.2)
v72.trans = NumberSequence.new(0.3, 1)
v72.life = NumberRange.new(0.3, 0.55)
v72.speed = NumberRange.new(1.5, 4.5)
v72.spread = Vector2.new(60, 60)
v72.dir = Enum.NormalId.Front
__set_list(v65, 1, {v66, v69, v72})
v_u_28.Blood = v65
local v75 = {}
local v76 = {
	["n"] = 2,
	["tex"] = "rbxassetid://91762132334299",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["light"] = 1,
	["lightInf"] = 0
}
local v77, v78 = Color3.fromRGB(255, 190, 110)
v76.color = ColorSequence.new(v77, v78 or v77)
v76.size = NumberSequence.new(1, 1.6)
v76.trans = NumberSequence.new(0.1, 1)
v76.life = NumberRange.new(0.04, 0.06)
v76.speed = NumberRange.new(0, 0)
__set_list(v75, 1, {v76})
v_u_28.Flash = v75
local v79 = {}
local v80 = {
	["n"] = 6,
	["tex"] = "rbxassetid://87484520824952",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["light"] = 1,
	["lightInf"] = 0
}
local v81 = Color3.fromRGB(255, 160, 70)
local v82 = Color3.fromRGB(255, 90, 30)
v80.color = ColorSequence.new(v81, v82 or v81)
v80.size = NumberSequence.new(5, 14)
v80.trans = NumberSequence.new(0, 1)
v80.life = NumberRange.new(0.25, 0.45)
v80.speed = NumberRange.new(4, 12)
v80.spread = Vector2.new(180, 180)
local v83 = {
	["n"] = 1,
	["tex"] = "rbxassetid://91762132334299",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["light"] = 1,
	["lightInf"] = 0
}
local v84, v85 = Color3.fromRGB(255, 230, 180)
v83.color = ColorSequence.new(v84, v85 or v84)
v83.size = NumberSequence.new(22, 26)
v83.trans = NumberSequence.new(0, 1)
v83.life = NumberRange.new(0.1, 0.12)
v83.speed = NumberRange.new(0, 0)
local v86 = {
	["n"] = 14,
	["tex"] = "rbxasset://textures/particles/smoke_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["drag"] = 2.2,
	["accel"] = Vector3.new(0, 3, 0)
}
local v87 = Color3.fromRGB(70, 66, 60)
local v88 = Color3.fromRGB(120, 116, 110)
v86.color = ColorSequence.new(v87, v88 or v87)
v86.size = NumberSequence.new(6, 20)
v86.trans = NumberSequence.new(0.15, 1)
v86.life = NumberRange.new(2.5, 4.5)
v86.speed = NumberRange.new(6, 16)
v86.spread = Vector2.new(180, 180)
local v89 = {
	["n"] = 22,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -55, 0)
}
local v90, v91 = Color3.fromRGB(60, 55, 50)
v89.color = ColorSequence.new(v90, v91 or v90)
v89.size = NumberSequence.new(0.35, 0.25)
v89.trans = NumberSequence.new(0, 0.2)
v89.life = NumberRange.new(1, 1.7)
v89.speed = NumberRange.new(25, 50)
v89.spread = Vector2.new(70, 70)
__set_list(v79, 1, {v80, v83, v86, v89})
v_u_28.Explosion = v79
local v92 = {}
local v93 = {
	["n"] = 30,
	["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
	["color"] = nil,
	["size"] = nil,
	["trans"] = nil,
	["life"] = nil,
	["speed"] = nil,
	["spread"] = nil,
	["accel"] = Vector3.new(0, -50, 0),
	["light"] = 0.3
}
local v94, v95 = Color3.fromRGB(215, 232, 245)
v93.color = ColorSequence.new(v94, v95 or v94)
v93.size = NumberSequence.new(0.18, 0.1)
v93.trans = NumberSequence.new(0.1, 0.5)
v93.life = NumberRange.new(0.8, 1.4)
v93.speed = NumberRange.new(4, 14)
v93.spread = Vector2.new(180, 180)
__set_list(v92, 1, {v93})
v_u_28.GlassBreak = v92
local function v_u_107() -- name: setupEmitters
	-- upvalues: (copy) v_u_28, (ref) v_u_19, (copy) v_u_3, (copy) v_u_27, (copy) v_u_20
	for v96, v97 in v_u_28 do
		local v98 = Instance.new("Attachment")
		v98.Name = v96
		v98.Parent = v_u_19
		local v99 = {}
		local v100
		if v96 == "Blood" then
			local v101 = v_u_3:FindFirstChild("Assets")
			if v101 then
				v101 = v101:FindFirstChild("VFX")
			end
			if v101 then
				v101 = v101:FindFirstChild("Combat")
			end
			if v101 then
				v101 = v101:FindFirstChild("Blood")
			end
			v100 = v101 or nil
		else
			v100 = nil
		end
		if v100 then
			for _, v102 in v100:GetChildren() do
				if not v102:IsA("ParticleEmitter") then
					continue
				end
				local v103 = v102:Clone()
				v103.Enabled = false
				v103.Parent = v98
				local v104 = {
					["e"] = v103,
					["n"] = v102:GetAttribute("Count") or 1
				}
				table.insert(v99, v104)
			end
		end
		if #v99 == 0 then
			for _, v105 in v97 do
				local v106 = {
					["e"] = v_u_27(v98, v105),
					["n"] = v105.n
				}
				table.insert(v99, v106)
			end
		end
		v_u_20[v96] = {
			["att"] = v98,
			["list"] = v99
		}
	end
end
local function v_u_120(p108, p109, p110) -- name: play
	-- upvalues: (copy) v_u_20, (copy) v_u_14
	local v111 = v_u_20[p108]
	if v111 then
		v111.att.WorldCFrame = p109
		local v112 = p110 or 1
		local v113 = v_u_14:GetAttribute("ParticleScale")
		local v114
		if type(v113) == "number" then
			v114 = math.clamp(v113, 0.1, 1)
		else
			v114 = (v_u_14:GetAttribute("Graphics") or "High") == "Low" and 0.5 or 1
		end
		local v115 = v112 * v114
		for _, v116 in v111.list do
			local v117 = v116.n * v115 + 0.5
			local v118 = math.floor(v117)
			local v119 = math.max(1, v118)
			v116.e:Emit(v119)
		end
	end
end
v_u_13.emit = v_u_120
function v_u_13.idFor(p121) -- name: idFor
	-- upvalues: (copy) v_u_10, (copy) v_u_15
	local v122 = v_u_10.Weapons[p121]
	if type(v122) == "table" then
		v122 = v122[v_u_15:NextInteger(1, #v122)]
	end
	if type(v122) == "number" then
		v122 = "rbxassetid://" .. v122
	elseif type(v122) ~= "string" then
		v122 = nil
	end
	if not v122 then
		v122 = v_u_10.Impacts[p121]
		if type(v122) == "table" then
			v122 = v122[v_u_15:NextInteger(1, #v122)]
		end
		if type(v122) == "number" then
			v122 = "rbxassetid://" .. v122
		elseif type(v122) ~= "string" then
			v122 = nil
		end
		if not v122 then
			local v123 = v_u_10.Match
			if v123 then
				v123 = v_u_10.Match[p121]
			end
			if type(v123) == "table" then
				v123 = v123[v_u_15:NextInteger(1, #v123)]
			end
			if type(v123) == "number" then
				return "rbxassetid://" .. v123
			end
			if type(v123) == "string" then
				return v123
			end
			v122 = nil
		end
	end
	return v122
end
local v_u_124 = v_u_19
local v_u_125 = {}
for v126, v127 in v_u_10.Trim or {} do
	if type(v126) ~= "number" or type(v127) ~= "table" then
		continue
	end
	v_u_125["rbxassetid://" .. string.format("%d", v126)] = v127
end
local v_u_128 = {}
local function v_u_135(p129, p130) -- name: applyTrim
	-- upvalues: (copy) v_u_125, (copy) v_u_128
	local v131 = p130 and v_u_125[p130] or nil
	if v131 then
		p129.TimePosition = v131.s or 0
		if v131.g then
			p129.Volume = p129.Volume * v131.g
		end
		if v131.e and not p129.Looped then
			local v132 = v_u_128
			local v133 = {
				["v"] = p129.Volume,
				["e"] = v131.e
			}
			local v134 = v131.f or 0.08
			v133.f = math.max(v134, 0.01)
			v132[p129] = v133
		else
			v_u_128[p129] = nil
		end
	else
		v_u_128[p129] = nil
		p129.TimePosition = 0
		return
	end
end
v_u_13.applyTrim = v_u_135
local function v_u_143() -- name: stepEnv
	-- upvalues: (copy) v_u_128
	for v136, v137 in v_u_128 do
		if v136.IsPlaying then
			local v138 = v136.TimePosition
			if v137.e <= v138 then
				v136:Stop()
				v_u_128[v136] = nil
			else
				if v137.e - v137.f >= v138 then
					continue
				end
				local v139 = v136.Volume
				local v140 = v137.v
				local v141 = v137.e - v138
				local v142 = v140 * math.max(v141, 0) / v137.f
				v136.Volume = math.min(v139, v142)
			end
		else
			v_u_128[v136] = nil
		end
	end
end
local function v_u_156(p144, p145, p146, p147) -- name: shotFor
	-- upvalues: (copy) v_u_10, (copy) v_u_15
	local v148 = p144 and (v_u_10.Guns and v_u_10.Guns[p144]) or nil
	local v149 = v148 and (v148.Speed or 1) or 1
	if p147 then
		if v148 and v148.Supp then
			local v150 = v148.Supp
			if type(v150) == "table" then
				v150 = v150[v_u_15:NextInteger(1, #v150)]
			end
			if type(v150) == "number" then
				v150 = "rbxassetid://" .. v150
			elseif type(v150) ~= "string" then
				v150 = nil
			end
			return v150, v149
		end
		local v151 = (p146 == "Pistol" or p146 == "SMG") and "Shot_SuppressedPistol" or "Shot_Suppressed"
		local v152 = v_u_10.Weapons[v151]
		if type(v152) == "table" then
			v152 = v152[v_u_15:NextInteger(1, #v152)]
		end
		if type(v152) == "number" then
			v152 = "rbxassetid://" .. v152
		elseif type(v152) ~= "string" then
			v152 = nil
		end
		if not v152 then
			v152 = v_u_10.Impacts[v151]
			if type(v152) == "table" then
				v152 = v152[v_u_15:NextInteger(1, #v152)]
			end
			if type(v152) == "number" then
				v152 = "rbxassetid://" .. v152
			elseif type(v152) ~= "string" then
				v152 = nil
			end
			if not v152 then
				v152 = v_u_10.Match
				if v152 then
					v152 = v_u_10.Match[v151]
				end
				if type(v152) == "table" then
					v152 = v152[v_u_15:NextInteger(1, #v152)]
				end
				if type(v152) == "number" then
					v152 = "rbxassetid://" .. v152
				elseif type(v152) ~= "string" then
					v152 = nil
				end
			end
		end
		return v152, v149
	else
		if v148 and v148.Shot then
			local v153 = v148.Shot
			if type(v153) == "table" then
				v153 = v153[v_u_15:NextInteger(1, #v153)]
			end
			if type(v153) == "number" then
				v153 = "rbxassetid://" .. v153
			elseif type(v153) ~= "string" then
				v153 = nil
			end
			return v153, v149
		end
		local v154 = "Shot_" .. (p145 or "AR556")
		local v155 = v_u_10.Weapons[v154]
		if type(v155) == "table" then
			v155 = v155[v_u_15:NextInteger(1, #v155)]
		end
		if type(v155) == "number" then
			v155 = "rbxassetid://" .. v155
		elseif type(v155) ~= "string" then
			v155 = nil
		end
		if not v155 then
			v155 = v_u_10.Impacts[v154]
			if type(v155) == "table" then
				v155 = v155[v_u_15:NextInteger(1, #v155)]
			end
			if type(v155) == "number" then
				v155 = "rbxassetid://" .. v155
			elseif type(v155) ~= "string" then
				v155 = nil
			end
			if not v155 then
				v155 = v_u_10.Match
				if v155 then
					v155 = v_u_10.Match[v154]
				end
				if type(v155) == "table" then
					v155 = v155[v_u_15:NextInteger(1, #v155)]
				end
				if type(v155) == "number" then
					v155 = "rbxassetid://" .. v155
				elseif type(v155) ~= "string" then
					v155 = nil
				end
			end
		end
		return v155, 1
	end
end
v_u_13.shotFor = v_u_156
local v_u_157 = setmetatable({}, {
	["__mode"] = "k"
})
local v_u_158 = {}
local v_u_159 = {}
local v_u_160 = 0
local v_u_161 = 0
local v_u_162 = nil
local function v_u_169() -- name: setupSounds
	-- upvalues: (ref) v_u_124, (copy) v_u_158, (copy) v_u_4, (copy) v_u_159
	for v163 = 1, 32 do
		local v164 = Instance.new("Attachment")
		v164.Name = "Snd" .. v163
		v164.Parent = v_u_124
		local v165 = Instance.new("Sound")
		v165.RollOffMode = Enum.RollOffMode.InverseTapered
		v165.Parent = v164
		v_u_158[v163] = {
			["att"] = nil,
			["s"] = nil,
			["prio"] = 0,
			["t0"] = 0,
			["att"] = v164,
			["s"] = v165
		}
	end
	local v166 = Instance.new("Folder")
	v166.Name = "CombatSFX2D"
	v166.Parent = v_u_4
	for v167 = 1, 12 do
		local v168 = Instance.new("Sound")
		v168.Parent = v166
		v_u_159[v167] = {
			["s"] = nil,
			["prio"] = 1,
			["t0"] = 0,
			["s"] = v168
		}
	end
end
local function v_u_179(p170, p171, p172) -- name: pickVoice
	local v173 = #p170
	for _ = 1, v173 do
		p171 = p171 % v173 + 1
		local v174 = p170[p171]
		if v174.s.IsPlaying then
			continue
		end
		return v174, p171
	end
	local v175 = (1 / 0)
	local v176 = (1 / 0)
	local v177 = nil
	for _, v178 in p170 do
		if v178.prio >= v175 and (v178.prio ~= v175 or v178.t0 >= v176) then
			continue
		end
		v175 = v178.prio
		v176 = v178.t0
		v177 = v178
	end
	if v177 and p172 >= v175 then
		return v177, p171
	else
		return nil, p171
	end
end
local v_u_180 = nil
local v_u_181 = {}
local function v_u_188(p182) -- name: clickVoice
	-- upvalues: (copy) v_u_181, (ref) v_u_180, (copy) v_u_4, (ref) v_u_162
	local v183 = v_u_181[p182]
	if v183 then
		return v183
	end
	if not v_u_180 then
		local v184 = Instance.new("Folder")
		v184.Name = "ReloadClicks"
		v184.Parent = v_u_4
		v_u_180 = v184
	end
	local v185 = {
		["list"] = nil,
		["i"] = 0,
		["list"] = {}
	}
	for v186 = 1, 2 do
		local v187 = Instance.new("Sound")
		v187.Name = "Click" .. p182
		v187.SoundId = "rbxassetid://" .. p182
		v187.SoundGroup = v_u_162
		v187.Parent = v_u_180
		v185.list[v186] = v187
	end
	v_u_181[p182] = v185
	return v185
end
local function v_u_193(p189, p190) -- name: playClick
	-- upvalues: (copy) v_u_188, (ref) v_u_162, (copy) v_u_10, (copy) v_u_15, (copy) v_u_135
	local v191 = v_u_188(p189)
	v191.i = v191.i % #v191.list + 1
	local v192 = v191.list[v191.i]
	if v192.IsPlaying then
		v192:Stop()
	end
	if v_u_162 and v192.SoundGroup ~= v_u_162 then
		v192.SoundGroup = v_u_162
	end
	v192.Volume = (p190 or 0.75) * (v_u_10.ReloadClickVolume or 1)
	v192.PlaybackSpeed = 0.98 + v_u_15:NextNumber() * 0.04
	v_u_135(v192, v192.SoundId)
	v192:Play()
	return v192
end
v_u_13.playClick = v_u_193
local function v_u_207(p194, p195) -- name: reloadKey
	-- upvalues: (copy) v_u_193, (copy) v_u_17, (copy) v_u_10
	local v196 = string.sub(p194, 3, 3)
	local v197 = string.sub(p194, 4)
	if v196 == ":" then
		local v198 = tonumber(v197)
		if v198 and v198 > 0 then
			return v_u_193(v198, p195)
		else
			return nil
		end
	elseif v196 == ">" then
		return v197
	elseif v196 == "?" then
		local v199 = v_u_17.WeaponController
		if not v199 then
			local v200 = script.Parent:FindFirstChild("WeaponController")
			if v200 then
				local v201 = require
				local v202
				v202, v199 = pcall(v201, v200)
				if v202 and type(v199) == "table" then
					v_u_17.WeaponController = v199
				else
					v199 = nil
				end
			else
				v199 = nil
			end
		end
		local v203 = v199 and v199.getStats
		if v203 then
			v203 = v199.getStats()
		end
		local v204
		if v203 then
			local v205 = v_u_10.reloadKit
			if type(v205) == "function" then
				v204 = v_u_10.reloadKit(v203.id)
			else
				v204 = nil
			end
		else
			v204 = nil
		end
		if v204 then
			local v206 = not v204[v197] and v_u_10.ReloadClicks
			if v206 then
				v206 = v_u_10.ReloadClicks[v197]
			end
			if type(v206) == "number" and v206 > 0 then
				return v_u_193(v206, p195)
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_13.play3D(p208, p209, p210) -- name: play3D
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (ref) v_u_160, (copy) v_u_179, (copy) v_u_158, (copy) v_u_135
	local v211
	if p208:sub(1, 13) == "rbxassetid://" and p208 then
		v211 = p208
	else
		v211 = v_u_10.Weapons[p208]
		if type(v211) == "table" then
			v211 = v211[v_u_15:NextInteger(1, #v211)]
		end
		if type(v211) == "number" then
			v211 = "rbxassetid://" .. v211
		elseif type(v211) ~= "string" then
			v211 = nil
		end
		if not v211 then
			v211 = v_u_10.Impacts[p208]
			if type(v211) == "table" then
				v211 = v211[v_u_15:NextInteger(1, #v211)]
			end
			if type(v211) == "number" then
				v211 = "rbxassetid://" .. v211
			elseif type(v211) ~= "string" then
				v211 = nil
			end
			if not v211 then
				v211 = v_u_10.Match
				if v211 then
					v211 = v_u_10.Match[p208]
				end
				if type(v211) == "table" then
					v211 = v211[v_u_15:NextInteger(1, #v211)]
				end
				if type(v211) == "number" then
					v211 = "rbxassetid://" .. v211
				elseif type(v211) ~= "string" then
					v211 = nil
				end
			end
		end
	end
	if not v211 then
		return nil
	end
	local v212 = p210 or {}
	local v213, v214 = v_u_179(v_u_158, v_u_160, v212.prio or 1)
	v_u_160 = v214
	if not v213 then
		return nil
	end
	local v215 = v213.s
	v215:Stop()
	v213.att.WorldPosition = p209
	if v215.SoundId ~= v211 then
		v215.SoundId = v211
	end
	v213.t0 = os.clock()
	v215.Volume = v212.volume or 0.8
	v215.PlaybackSpeed = (v212.speed or 1) * (0.96 + v_u_15:NextNumber() * 0.08)
	v215.RollOffMinDistance = v212.min or 8
	v215.RollOffMaxDistance = v212.max or 500
	v215.Looped = v212.looped == true
	v213.prio = v212.prio or 1
	v_u_135(v215, v211)
	v215:Play()
	return v215
end
function v_u_13.play2D(p216, p217, p218) -- name: play2D
	-- upvalues: (copy) v_u_207, (copy) v_u_17, (copy) v_u_10, (copy) v_u_15, (ref) v_u_161, (copy) v_u_179, (copy) v_u_159, (copy) v_u_135
	local v219, v220 = string.byte(p216, 1, 2)
	if v219 == 82 and (v220 == 67 and #p216 > 3) then
		p216 = v_u_207(p216, p217)
		if type(p216) ~= "string" then
			return p216
		end
	elseif p216 == "ShellInsert" then
		local v221 = v_u_17.WeaponController
		if not v221 then
			local v222 = script.Parent:FindFirstChild("WeaponController")
			if v222 then
				local v223 = require
				local v224
				v224, v221 = pcall(v223, v222)
				if v224 and type(v221) == "table" then
					v_u_17.WeaponController = v221
				else
					v221 = nil
				end
			else
				v221 = nil
			end
		end
		local v225
		if v221 and (v221.isReloading and v221.isReloading()) then
			local v226 = v_u_17.WeaponController
			if not v226 then
				local v227 = script.Parent:FindFirstChild("WeaponController")
				if v227 then
					local v228 = require
					local v229
					v229, v226 = pcall(v228, v227)
					if v229 and type(v226) == "table" then
						v_u_17.WeaponController = v226
					else
						v226 = nil
					end
				else
					v226 = nil
				end
			end
			local v230 = v226 and v226.getStats
			if v230 then
				v230 = v226.getStats()
			end
			local v231
			if v230 then
				local v232 = v_u_10.reloadKit
				if type(v232) == "function" then
					v231 = v_u_10.reloadKit(v230.id)
				else
					v231 = nil
				end
			else
				v231 = nil
			end
			v225 = v231 ~= nil
		else
			v225 = false
		end
		if v225 then
			return nil
		end
	end
	local v233
	if p216:sub(1, 13) == "rbxassetid://" and p216 then
		v233 = p216
	else
		v233 = v_u_10.Weapons[p216]
		if type(v233) == "table" then
			v233 = v233[v_u_15:NextInteger(1, #v233)]
		end
		if type(v233) == "number" then
			v233 = "rbxassetid://" .. v233
		elseif type(v233) ~= "string" then
			v233 = nil
		end
		if not v233 then
			v233 = v_u_10.Impacts[p216]
			if type(v233) == "table" then
				v233 = v233[v_u_15:NextInteger(1, #v233)]
			end
			if type(v233) == "number" then
				v233 = "rbxassetid://" .. v233
			elseif type(v233) ~= "string" then
				v233 = nil
			end
			if not v233 then
				v233 = v_u_10.Match
				if v233 then
					v233 = v_u_10.Match[p216]
				end
				if type(v233) == "table" then
					v233 = v233[v_u_15:NextInteger(1, #v233)]
				end
				if type(v233) == "number" then
					v233 = "rbxassetid://" .. v233
				elseif type(v233) ~= "string" then
					v233 = nil
				end
			end
		end
	end
	if not v233 then
		return nil
	end
	local v234, v235 = v_u_179(v_u_159, v_u_161, 1)
	v_u_161 = v235
	if not v234 then
		return nil
	end
	v234.t0 = os.clock()
	local v236 = v234.s
	v236:Stop()
	if v236.SoundId ~= v233 then
		v236.SoundId = v233
	end
	v236.Volume = p217 or 0.7
	v236.PlaybackSpeed = (p218 or 1) * (0.97 + v_u_15:NextNumber() * 0.06)
	v236.Looped = false
	v_u_135(v236, v233)
	v236:Play()
	return v236
end
local v_u_237 = nil
local v_u_238 = nil
function v_u_13.reloadClip(p239, p240, p241) -- name: reloadClip
	-- upvalues: (copy) v_u_17, (copy) v_u_10, (copy) v_u_15, (ref) v_u_237, (ref) v_u_162, (copy) v_u_4, (ref) v_u_238, (copy) v_u_135
	local v242 = v_u_17.WeaponController
	if not v242 then
		local v243 = script.Parent:FindFirstChild("WeaponController")
		if v243 then
			local v244 = require
			local v245
			v245, v242 = pcall(v244, v243)
			if v245 and type(v242) == "table" then
				v_u_17.WeaponController = v242
			else
				v242 = nil
			end
		else
			v242 = nil
		end
	end
	local v246 = v242 and v242.getStats
	if v246 then
		v246 = v242.getStats()
	end
	local v247
	if v246 then
		local v248 = v_u_10.reloadKit
		if type(v248) == "function" then
			v247 = v_u_10.reloadKit(v246.id)
		else
			v247 = nil
		end
	else
		v247 = nil
	end
	if v247 then
		return nil
	end
	if type(p239) == "table" then
		p239 = p239[v_u_15:NextInteger(1, #p239)]
	end
	if type(p239) == "number" then
		p239 = "rbxassetid://" .. p239
	elseif type(p239) ~= "string" then
		p239 = nil
	end
	if not p239 then
		return nil
	end
	if not v_u_237 then
		local v249 = Instance.new("Sound")
		v249.Name = "ReloadClip"
		v249.SoundGroup = v_u_162
		v249.Parent = v_u_4
		v_u_237 = v249
	end
	local v250 = v_u_237
	if v_u_238 then
		v_u_238:Cancel()
		v_u_238 = nil
	end
	v250:Stop()
	if v250.SoundId ~= p239 then
		v250.SoundId = p239
	end
	if v_u_162 and v250.SoundGroup ~= v_u_162 then
		v250.SoundGroup = v_u_162
	end
	v250.Volume = p240 or 0.75
	v250.PlaybackSpeed = p241 or 1
	v_u_135(v250, p239)
	v250:Play()
	return v250
end
function v_u_13.stopReloadClip(p251) -- name: stopReloadClip
	-- upvalues: (ref) v_u_237, (ref) v_u_238
	local v_u_252 = v_u_237
	if v_u_252 and v_u_252.IsPlaying then
		if v_u_238 then
			v_u_238:Cancel()
		end
		local v_u_253 = game:GetService("TweenService"):Create(v_u_252, TweenInfo.new(p251 or 0.12), {
			["Volume"] = 0
		})
		v_u_238 = v_u_253
		v_u_253.Completed:Connect(function(p254)
			-- upvalues: (ref) v_u_238, (copy) v_u_253, (copy) v_u_252
			if p254 == Enum.PlaybackState.Completed and v_u_238 == v_u_253 then
				v_u_252:Stop()
			end
		end)
		v_u_253:Play()
	end
end
local v_u_255 = nil
local v_u_256 = {}
local v_u_257 = {}
local v_u_258 = setmetatable({}, {
	["__mode"] = "k"
})
local function v_u_265(p259, p260) -- name: bank2D
	-- upvalues: (copy) v_u_256, (ref) v_u_162, (ref) v_u_255
	local v261 = v_u_256[p259]
	if v261 then
		return v261
	end
	local v262 = {
		["list"] = nil,
		["i"] = 0,
		["list"] = {}
	}
	for v263 = 1, p260 do
		local v264 = Instance.new("Sound")
		v264.Name = "Shot"
		v264.SoundId = p259
		v264.SoundGroup = v_u_162
		v264.Parent = v_u_255
		v262.list[v263] = v264
	end
	v_u_256[p259] = v262
	return v262
end
local function v_u_272(p266, p267, p268, p269) -- name: playBank
	-- upvalues: (ref) v_u_255, (copy) v_u_265, (copy) v_u_15, (copy) v_u_135
	if p266 and v_u_255 then
		local v270 = v_u_265(p266, p267)
		v270.i = v270.i % #v270.list + 1
		local v271 = v270.list[v270.i]
		if v271.IsPlaying then
			v271:Stop()
		end
		v271.Volume = p268
		v271.PlaybackSpeed = p269 * (0.97 + v_u_15:NextNumber() * 0.06)
		v_u_135(v271, p266)
		v271:Play()
	end
end
local function v_u_281() -- name: setupGunVoices
	-- upvalues: (copy) v_u_4, (ref) v_u_255, (ref) v_u_124, (copy) v_u_257
	local v273 = Instance.new("Folder")
	v273.Name = "CombatGun2D"
	v273.Parent = v_u_4
	v_u_255 = v273
	for v274 = 1, 14 do
		local v275 = Instance.new("Attachment")
		v275.Name = "Gun" .. v274
		v275.Parent = v_u_124
		local v276 = {
			["att"] = nil,
			["near"] = nil,
			["far"] = nil,
			["ni"] = 0,
			["fi"] = 0,
			["last"] = 0,
			["owner"] = nil,
			["att"] = v275,
			["near"] = {},
			["far"] = {}
		}
		for v277 = 1, 9 do
			local v278 = Instance.new("Sound")
			v278.RollOffMode = Enum.RollOffMode.InverseTapered
			v278.Parent = v275
			if v277 <= 6 then
				local v279 = v276.near
				table.insert(v279, v278)
			else
				local v280 = v276.far
				table.insert(v280, v278)
			end
		end
		v_u_257[v274] = v276
	end
end
local function v_u_288(p282) -- name: channelFor
	-- upvalues: (copy) v_u_258, (copy) v_u_257
	local v283 = os.clock()
	local v284
	if p282 then
		v284 = v_u_258[p282]
	else
		v284 = p282
	end
	if v284 and v284.owner == p282 then
		v284.last = v283
		return v284
	end
	local v285 = v_u_257[1]
	local v286 = (1 / 0)
	for _, v287 in v_u_257 do
		if v287.last >= v286 then
			continue
		end
		v286 = v287.last
		v285 = v287
	end
	if v285.owner then
		v_u_258[v285.owner] = nil
	end
	v285.owner = p282
	v285.last = v283
	if p282 then
		v_u_258[p282] = v285
	end
	return v285
end
local function v_u_299(p289, p290, p291, p292, p293, p294, p295) -- name: playVoice
	-- upvalues: (copy) v_u_15, (copy) v_u_135
	if p291 then
		local v296 = p290 and p289.far or p289.near
		local v297
		if p290 then
			p289.fi = p289.fi % #v296 + 1
			v297 = p289.fi
		else
			p289.ni = p289.ni % #v296 + 1
			v297 = p289.ni
		end
		local v298 = v296[v297]
		if v298.IsPlaying then
			v298:Stop()
		end
		if v298.SoundId ~= p291 then
			v298.SoundId = p291
		end
		v298.Volume = p292
		v298.PlaybackSpeed = p293 * (0.96 + v_u_15:NextNumber() * 0.08)
		v298.RollOffMinDistance = p294
		v298.RollOffMaxDistance = p295
		v_u_135(v298, p291)
		v298:Play()
	end
end
local v_u_300 = nil
local v_u_301 = setmetatable({}, {
	["__mode"] = "k"
})
local v_u_302 = {}
local function v_u_333(p_u_303, p304, p_u_305, p_u_306, p307) -- name: gunshotSound
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_156, (copy) v_u_10, (copy) v_u_15, (copy) v_u_157, (copy) v_u_8, (copy) v_u_16, (ref) v_u_300, (copy) v_u_302, (copy) v_u_301, (copy) v_u_257, (copy) v_u_288, (copy) v_u_299
	local v308 = workspace.CurrentCamera
	if v308 then
		if p_u_306 == nil or p_u_306 ~= v_u_14.Character then
			local v_u_309 = (v308.CFrame.Position - p_u_303).Magnitude
			local v_u_310 = v_u_9.Weapons[p304]
			local v311 = v_u_156
			local v312
			if v_u_310 then
				v312 = v_u_310.Sound
			else
				v312 = v_u_310
			end
			local v313
			if v_u_310 then
				v313 = v_u_310.Class
			else
				v313 = v_u_310
			end
			local v314, v_u_315 = v311(p304, v312, v313, p_u_305)
			local v_u_316
			if p307 and not p_u_305 then
				local v317 = p304 and (v_u_10.Guns and v_u_10.Guns[p304]) or nil
				if v317 and v317.Burst then
					local v318 = v317.Burst
					if type(v318) == "table" then
						v318 = v318[v_u_15:NextInteger(1, #v318)]
					end
					if type(v318) == "number" then
						v318 = "rbxassetid://" .. v318
					elseif type(v318) ~= "string" then
						v318 = nil
					end
					v_u_316 = v318 or nil
				else
					v_u_316 = nil
				end
				if v_u_316 then
					local v319 = p_u_306 or "?"
					local v320 = os.clock()
					if v320 - (v_u_157[v319] or -10) < 0.3 then
						return
					end
					v_u_157[v319] = v320
				else
					v_u_316 = v314
				end
			else
				v_u_316 = v314
			end
			local v_u_321 = v_u_8.m(150)
			local v_u_322
			if v_u_310 == nil then
				v_u_322 = false
			else
				v_u_322 = (v_u_310.TBS or 0.1) < 0.07
			end
			task.delay(v_u_309 / v_u_16, function()
				-- upvalues: (copy) p_u_303, (copy) p_u_306, (ref) v_u_300, (ref) v_u_302, (ref) v_u_301, (ref) v_u_257, (ref) v_u_288, (copy) p_u_305, (ref) v_u_299, (ref) v_u_316, (copy) v_u_315, (ref) v_u_8, (copy) v_u_309, (copy) v_u_321, (copy) v_u_322, (ref) v_u_10, (ref) v_u_15, (copy) v_u_310
				local v323 = p_u_303
				local v324 = p_u_306
				if v_u_300 then
					local v325 = v324 or v_u_302
					local v326 = os.clock()
					if v326 - (v_u_301[v325] or -10) >= 0.15 then
						v_u_301[v325] = v326
						v_u_300:Fire("Shot", v323, v324)
					end
				end
				if #v_u_257 == 0 then
					return
				else
					local v327 = v_u_288(p_u_306)
					v327.att.WorldPosition = p_u_303
					if p_u_305 then
						v_u_299(v327, false, v_u_316, 0.7, v_u_315, 6, v_u_8.m(130))
					else
						if v_u_309 < v_u_321 * 1.3 then
							v_u_299(v327, false, v_u_316, v_u_322 and 0.9 or 1, v_u_315, 18, v_u_321 * 1.5)
						end
						if v_u_309 > v_u_321 * 0.6 then
							local v328 = (v_u_309 - v_u_321 * 0.6) / v_u_321
							local v329 = math.clamp(v328, 0.3, 1) * 0.9
							local v330 = v_u_299
							local v331 = true
							local v332 = v_u_10.Weapons.Shot_Distant
							if type(v332) == "table" then
								v332 = v332[v_u_15:NextInteger(1, #v332)]
							end
							if type(v332) == "number" then
								v332 = "rbxassetid://" .. v332
							elseif type(v332) ~= "string" then
								v332 = nil
							end
							if not v332 then
								v332 = v_u_10.Impacts.Shot_Distant
								if type(v332) == "table" then
									v332 = v332[v_u_15:NextInteger(1, #v332)]
								end
								if type(v332) == "number" then
									v332 = "rbxassetid://" .. v332
								elseif type(v332) ~= "string" then
									v332 = nil
								end
								if not v332 then
									v332 = v_u_10.Match
									if v332 then
										v332 = v_u_10.Match.Shot_Distant
									end
									if type(v332) == "table" then
										v332 = v332[v_u_15:NextInteger(1, #v332)]
									end
									if type(v332) == "number" then
										v332 = "rbxassetid://" .. v332
									elseif type(v332) ~= "string" then
										v332 = nil
									end
								end
							end
							v330(v327, v331, v332, v329, v_u_310 and (v_u_310.Class == "SR" or v_u_310.Class == "LMG") and 0.9 or 1, 60, v_u_8.m(1100))
						end
					end
				end
			end)
		end
	else
		return
	end
end
v_u_13.gunshotSound = v_u_333
local v_u_334 = 0
function v_u_13.meleeSound(p335, p336) -- name: meleeSound
	-- upvalues: (copy) v_u_10, (ref) v_u_334
	local v337 = v_u_10.Melee or {}
	local v338 = type(p335) ~= "string" and "Punch" or p335
	if v338 ~= "Punch" and v338 ~= "Kick" then
		if p336 == "swing" then
			local v339 = {
				["id"] = nil,
				["vol"] = 0.55,
				["speed"] = nil
			}
			local v340 = v337.Swing
			v339.id = "rbxassetid://" .. tostring(v340)
			v339.speed = (v338 == "Pan" or v338 == "Crowbar") and 0.9 or 1.12
			return v339
		end
		if v338 == "Pan" then
			local v341 = {
				["id"] = nil,
				["vol"] = 0.9,
				["speed"] = 1
			}
			local v342 = v337.PanHit
			v341.id = "rbxassetid://" .. tostring(v342)
			return v341
		end
		if v338 == "Crowbar" then
			local v343 = {
				["id"] = nil,
				["vol"] = 0.85,
				["speed"] = 1
			}
			local v344
			if p336 == "flesh" then
				v344 = v337.BluntHit
			else
				v344 = v337.BluntSurface
			end
			v343.id = "rbxassetid://" .. tostring(v344)
			return v343
		end
		local v345 = {
			["id"] = nil,
			["vol"] = nil,
			["speed"] = 1.05
		}
		local v346
		if p336 == "flesh" then
			v346 = v337.BladeHit
		else
			v346 = v337.BladeSurface
		end
		v345.id = "rbxassetid://" .. tostring(v346)
		v345.vol = p336 == "flesh" and 0.85 or 0.6
		return v345
	end
	local v347 = v338 == "Kick"
	if p336 == "swing" then
		local v348 = {}
		local v349 = v337.FistWhiff
		v348.id = "rbxassetid://" .. tostring(v349)
		v348.vol = v347 and 0.75 or 0.6
		v348.speed = v347 and 0.88 or 1
		return v348
	end
	local v350 = v337.FistHit or {}
	local v351 = math.random
	local v352 = #v350
	local v353 = v351(1, (math.max(1, v352)))
	if #v350 > 1 and v353 == v_u_334 then
		v353 = v353 % #v350 + 1
	end
	v_u_334 = v353
	if p336 ~= "flesh" then
		local v354 = {
			["id"] = nil,
			["vol"] = 0.45,
			["speed"] = 0.72
		}
		local v355 = v350[v353]
		v354.id = "rbxassetid://" .. tostring(v355)
		return v354
	end
	local v356 = {}
	local v357 = v350[v353]
	v356.id = "rbxassetid://" .. tostring(v357)
	v356.vol = v347 and 0.95 or 0.8
	v356.speed = v347 and 0.88 or 1
	return v356
end
local v_u_358 = {}
local v_u_359 = 0
local function v_u_370(p360, p361, p362) -- name: flashLight
	-- upvalues: (copy) v_u_14, (copy) v_u_358, (ref) v_u_359, (copy) v_u_15
	if (v_u_14:GetAttribute("Graphics") or "High") ~= "Low" and #v_u_358 ~= 0 then
		local v363
		if p362 then
			v363 = v_u_358[1]
		else
			local v364 = workspace.CurrentCamera
			if v364 and (p361 < 2 and (v364.CFrame.Position - p360).Magnitude > 220) then
				return
			end
			local v365 = v_u_359
			local v366 = #v_u_358 - 1
			v_u_359 = v365 % math.max(v366, 1) + 1
			local v367 = v_u_358
			local v368 = v_u_359 + 1
			local v369 = #v_u_358
			v363 = v367[math.min(v368, v369)]
		end
		v363.part.CFrame = CFrame.new(p360)
		v363.light.Brightness = (2.2 + v_u_15:NextNumber() * 1.6) * p361
		v363.light.Range = math.min(p361, 3) * 6 + 8 + v_u_15:NextNumber() * 3
		v363.light.Enabled = true
		v363.off = os.clock() + (p361 >= 2 and 0.09 or 0.03 + v_u_15:NextNumber() * 0.025)
	end
end
local v_u_371 = require(script.Parent.ViewmodelController.Pose).SCALE
local v_u_372 = {
	["AR"] = 1,
	["SMG"] = 0.8,
	["Pistol"] = 0.7,
	["LMG"] = 1.1,
	["DMR"] = 1.15,
	["SR"] = 1.35,
	["SG"] = 1.6,
	["Special"] = 1
}
local v_u_373 = setmetatable({}, {
	["__mode"] = "k"
})
local v_u_374 = nil
local function v_u_389() -- name: muzzleTemplates
	-- upvalues: (copy) v_u_3, (ref) v_u_374, (copy) v_u_27
	local v375 = v_u_3:FindFirstChild("Assets")
	if v375 then
		v375 = v375:FindFirstChild("VFX")
	end
	if v375 then
		v375 = v375:FindFirstChild("Combat")
	end
	if v375 then
		v375 = v375:FindFirstChild("Muzzle")
	end
	if v375 then
		local v376 = {}
		for _, v377 in v375:GetChildren() do
			if not v377:IsA("ParticleEmitter") then
				continue
			end
			table.insert(v376, v377)
		end
		if #v376 > 0 then
			return v376
		end
	end
	if not v_u_374 then
		local v378 = Instance.new("Folder")
		local v379 = v_u_27
		local v380 = {
			["tex"] = "rbxassetid://107552689082652",
			["color"] = nil,
			["size"] = nil,
			["trans"] = nil,
			["life"] = nil,
			["speed"] = nil,
			["light"] = 1,
			["lightInf"] = 0,
			["locked"] = true,
			["z"] = 0.3
		}
		local v381 = Color3.fromRGB(255, 225, 160)
		local v382 = Color3.fromRGB(255, 160, 70)
		v380.color = ColorSequence.new(v381, v382 or v381)
		v380.size = NumberSequence.new(0.32, 0.46)
		v380.trans = NumberSequence.new(0, 1)
		v380.life = NumberRange.new(0.045, 0.06)
		v380.speed = NumberRange.new(0, 0)
		local v383 = v379(v378, v380)
		v383.Name = "Core"
		local v384 = v_u_27
		local v385 = {
			["tex"] = "rbxasset://textures/particles/smoke_main.dds",
			["color"] = nil,
			["size"] = nil,
			["trans"] = nil,
			["life"] = nil,
			["speed"] = nil,
			["spread"] = nil,
			["drag"] = 1.6,
			["accel"] = Vector3.new(0, 1.4, 0),
			["dir"] = nil
		}
		local v386, v387 = Color3.fromRGB(200, 200, 196)
		v385.color = ColorSequence.new(v386, v387 or v386)
		v385.size = NumberSequence.new(0.25, 1.5)
		v385.trans = NumberSequence.new(0.75, 1)
		v385.life = NumberRange.new(1, 1.8)
		v385.speed = NumberRange.new(1, 2.5)
		v385.spread = Vector2.new(15, 15)
		v385.dir = Enum.NormalId.Front
		local v388 = v384(v378, v385)
		v388.Name = "Smoke"
		v_u_374 = { v383, v388 }
	end
	return v_u_374
end
local function v_u_400(p390) -- name: rigFor
	-- upvalues: (copy) v_u_373, (copy) v_u_389
	local v391 = v_u_373[p390]
	if v391 and (v391.alive and v391.alive.Parent == p390) then
		return v391
	end
	local v392 = {
		["items"] = {},
		["jets"] = {}
	}
	for _, v393 in v_u_389() do
		local v394 = v393:GetAttribute("Count") or 1
		if v393.Name == "Jet" then
			for _, v395 in { Enum.NormalId.Left, Enum.NormalId.Right } do
				local v396 = v393:Clone()
				v396.Name = "B3Jet"
				v396.Enabled = false
				v396.EmissionDirection = v395
				v396.Parent = p390
				local v397 = v392.jets
				local v398 = {
					["e"] = nil,
					["base"] = nil,
					["n"] = nil,
					["k"] = 1,
					["e"] = v396,
					["base"] = v393.Size,
					["n"] = v394
				}
				table.insert(v397, v398)
			end
		else
			local v399 = v393:Clone()
			v399.Name = "B3" .. v393.Name
			v399.Enabled = false
			v399.Parent = p390
			v392.items[v393.Name] = {
				["e"] = nil,
				["base"] = nil,
				["n"] = nil,
				["k"] = 1,
				["e"] = v399,
				["base"] = v393.Size,
				["n"] = v394
			}
			v392.alive = v392.alive or v399
		end
	end
	if not v392.alive then
		return nil
	end
	v_u_373[p390] = v392
	return v392
end
local function v_u_409(p401, p402) -- name: scaledSize
	local v403 = {}
	for _, v404 in p401.Keypoints do
		local v405 = NumberSequenceKeypoint.new
		local v406 = v404.Time
		local v407 = v404.Value * p402
		local v408 = v404.Envelope * p402
		table.insert(v403, v405(v406, v407, v408))
	end
	return NumberSequence.new(v403)
end
function v_u_13.muzzleFlash(p410, p411) -- name: muzzleFlash
	-- upvalues: (copy) v_u_400, (copy) v_u_14, (copy) v_u_372, (copy) v_u_371, (copy) v_u_15, (copy) v_u_409, (copy) v_u_370
	if p410 and p410.Parent then
		local v412 = p411 or {}
		local v413 = v_u_400(p410)
		if v413 then
			local v414 = (v_u_14:GetAttribute("Graphics") or "High") == "Low"
			local v415 = v412.device or (v412.hidden and "S" or nil)
			local v416 = v412.class or "AR"
			local v417 = (v_u_372[v416] or 1) * (v412.scale or 1) * (v412.fp and v_u_371 or 1)
			local v418 = v413.items
			if v415 ~= "S" then
				local v419 = v415 == "F" and 0.45 or (v415 == "C" and 0.8 or 1)
				local v420 = v417 * v419 * (0.85 + v_u_15:NextNumber() * 0.3)
				local v421 = v418.Core
				local v422 = v418.Core and (v418.Core.n or 1) or 1
				if v421 and v422 > 0 then
					if v421 then
						local v423 = v421.k - v420
						if math.abs(v423) > 0.02 then
							v421.e.Size = v_u_409(v421.base, v420)
							v421.k = v420
						end
					end
					v421.e:Emit(v422)
				end
				if v415 ~= "F" and v418.Flame then
					local v424 = v418.Flame
					local v425 = v418.Flame.n + (v416 == "SG" and 1 or 0)
					if v424 and v425 > 0 then
						if v424 then
							local v426 = v424.k - v420
							if math.abs(v426) > 0.02 then
								v424.e.Size = v_u_409(v424.base, v420)
								v424.k = v420
							end
						end
						v424.e:Emit(v425)
					end
				end
				local v427 = v418.Glow
				if v427 then
					if v427 then
						local v428 = v427.k - v420
						if math.abs(v428) > 0.02 then
							v427.e.Size = v_u_409(v427.base, v420)
							v427.k = v420
						end
					end
					v427.e:Emit(1)
				end
				if v415 == "C" then
					for _, v429 in v413.jets do
						local v430 = v429.n
						if not v429 then
							continue
						end
						if v430 <= 0 then
							continue
						end
						if v429 then
							local v431 = v429.k - v417
							if math.abs(v431) > 0.02 then
								v429.e.Size = v_u_409(v429.base, v417)
								v429.k = v417
							end
						end
						v429.e:Emit(v430)
					end
				end
				if not v414 and (v418.Sparks and (v416 == "SG" or v416 == "SR")) then
					local v432 = v418.Sparks
					local v433 = v416 == "SG" and 5 or 3
					if v432 and v433 > 0 then
						if v432 then
							local v434 = v432.k - v417
							if math.abs(v434) > 0.02 then
								v432.e.Size = v_u_409(v432.base, v417)
								v432.k = v417
							end
						end
						v432.e:Emit(v433)
					end
				end
				local v435 = p410.WorldCFrame
				v_u_370(v435.Position + v435.LookVector * 0.4, (v412.fp and 0.7 or 1) * v419, v412.own)
			end
			if not v414 and (v412.smoke ~= false and v418.Smoke) then
				local v436 = v418.Smoke
				local v437 = v417 * (v415 == "S" and 0.65 or 1)
				local v438 = (v416 == "SG" or v416 == "SR") and 2 or 1
				if v436 then
					if v438 <= 0 then
						return
					end
					if v436 then
						local v439 = v436.k - v437
						if math.abs(v439) > 0.02 then
							v436.e.Size = v_u_409(v436.base, v437)
							v436.k = v437
						end
					end
					v436.e:Emit(v438)
				end
			end
		end
	else
		return
	end
end
local v_u_440 = {
	["v"] = 0,
	["last"] = 0,
	["rig"] = nil,
	["untilT"] = 0,
	["on"] = false
}
local function v_u_448(p441, p442) -- name: heatShot
	-- upvalues: (copy) v_u_440, (copy) v_u_373, (copy) v_u_409
	local v443 = os.clock()
	local v444 = v_u_440
	local v445 = v_u_440.v - (v443 - v_u_440.last) * 1.5
	v444.v = math.max(0, v445) + 1
	v_u_440.last = v443
	if v_u_440.on and (v_u_440.rig and v_u_440.rig.items.Trail) then
		v_u_440.rig.items.Trail.e.Enabled = false
	end
	v_u_440.on = false
	v_u_440.rig = p441 and v_u_373[p441] or nil
	local v446 = v_u_440.rig and v_u_440.rig.items.Trail
	if v446 then
		local v447 = v446.k - p442
		if math.abs(v447) > 0.02 then
			v446.e.Size = v_u_409(v446.base, p442)
			v446.k = p442
		end
	end
end
local function v_u_455() -- name: stepHeat
	-- upvalues: (copy) v_u_440, (copy) v_u_14
	if v_u_440.v <= 0 or not v_u_440.rig then
		return
	else
		local v449 = v_u_440.rig.items.Trail
		if v449 and v449.e.Parent then
			local v450 = os.clock()
			if v_u_440.on then
				if v_u_440.untilT < v450 then
					if v_u_440.rig and v_u_440.rig.items.Trail then
						v_u_440.rig.items.Trail.e.Enabled = false
					end
					v_u_440.on = false
					v_u_440.v = 0
				end
			elseif v450 - v_u_440.last > 0.25 then
				if v_u_440.v >= 6 and (v_u_14:GetAttribute("Graphics") or "High") ~= "Low" then
					v_u_440.on = true
					local v451 = v_u_440
					local v452 = v_u_440.v * 0.12
					v451.untilT = v450 + math.clamp(v452, 1, 3)
					local v453 = v449.e
					local v454 = v_u_440.v * 0.45
					v453.Rate = math.clamp(v454, 3, 10)
					v449.e.Enabled = true
				else
					v_u_440.v = 0
				end
			end
		else
			v_u_440.v = 0
		end
	end
end
function v_u_13.ejectShell(p_u_456, p457) -- name: ejectShell
	-- upvalues: (copy) v_u_17, (copy) v_u_14
	local v_u_458 = v_u_17.ShellFx
	if not v_u_458 then
		local v459 = script.Parent:FindFirstChild("ShellFx")
		if v459 then
			local v460 = require
			local v461
			v461, v_u_458 = pcall(v460, v459)
			if v461 and type(v_u_458) == "table" then
				v_u_17.ShellFx = v_u_458
			else
				v_u_458 = nil
			end
		else
			v_u_458 = nil
		end
	end
	if v_u_458 and p_u_456 then
		local v462 = v_u_17.WeaponController
		if not v462 then
			local v463 = script.Parent:FindFirstChild("WeaponController")
			if v463 then
				local v464 = require
				local v465
				v465, v462 = pcall(v464, v463)
				if v465 and type(v462) == "table" then
					v_u_17.WeaponController = v462
				else
					v462 = nil
				end
			else
				v462 = nil
			end
		end
		local v466 = v462 and v462.getStats
		if v466 then
			v466 = v462.getStats()
		end
		local v_u_467 = v466 and v_u_458.kindFor(v466) or (p457 == "SG" and "12g" or "762")
		local v468 = v_u_17.ViewmodelController
		if not v468 then
			local v469 = script.Parent:FindFirstChild("ViewmodelController")
			if v469 then
				local v470 = require
				local v471
				v471, v468 = pcall(v470, v469)
				if v471 and type(v468) == "table" then
					v_u_17.ViewmodelController = v468
				else
					v468 = nil
				end
			else
				v468 = nil
			end
		end
		local v472 = v468 ~= nil and v468.isVisible ~= nil and v468.isVisible()
		if v472 then
			if v468.getEject == nil then
				v472 = false
			else
				v472 = v468.getEject() == p_u_456
			end
		end
		if v472 then
			local v_u_473 = os.clock()
			task.delay(0.6, function()
				-- upvalues: (copy) v_u_458, (copy) v_u_473, (copy) p_u_456, (copy) v_u_467, (ref) v_u_14
				if v_u_458.lastFpp() < v_u_473 - 0.9 then
					if p_u_456.Parent then
						local v474 = v_u_458.ejectFrom
						local v475 = p_u_456
						local v476 = v_u_467
						local v477 = true
						local v478 = v_u_14.Character
						if v478 then
							v478 = v478:FindFirstChild("HumanoidRootPart")
						end
						v474(v475, v476, v477, v478 and v478.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
					end
				end
			end)
		elseif p_u_456.Parent then
			local v479 = v_u_458.ejectFrom
			local v480 = false
			local v481 = v_u_14.Character
			if v481 then
				v481 = v481:FindFirstChild("HumanoidRootPart")
			end
			v479(p_u_456, v_u_467, v480, v481 and v481.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
		end
	else
		return
	end
end
function v_u_13.localShot(p482, p483, p_u_484, p485, p486) -- name: localShot
	-- upvalues: (copy) v_u_156, (copy) v_u_10, (copy) v_u_15, (copy) v_u_157, (copy) v_u_14, (copy) v_u_272, (copy) v_u_17, (copy) v_u_13, (copy) v_u_448, (copy) v_u_372, (copy) v_u_371
	if p482 then
		local v487, v488 = v_u_156(p482.id, p482.sound, p482.class, p482.suppressed)
		local v489 = p482.suppressed and 0.55 or 0.85
		if (p482.tbs or 0.1) < 0.07 then
			v489 = v489 * 0.9
		end
		local v490
		if p486 == "Burst" and not p482.suppressed then
			local v491 = p482.id
			local v492 = v491 and (v_u_10.Guns and v_u_10.Guns[v491]) or nil
			local v493
			if v492 and v492.Burst then
				local v494 = v492.Burst
				if type(v494) == "table" then
					v494 = v494[v_u_15:NextInteger(1, #v494)]
				end
				if type(v494) == "number" then
					v494 = "rbxassetid://" .. v494
				elseif type(v494) ~= "string" then
					v494 = nil
				end
				v493 = v494 or nil
			else
				v493 = nil
			end
			v490 = v493 or nil
		else
			v490 = nil
		end
		if v490 then
			local v495 = os.clock()
			if v495 - (v_u_157[v_u_14] or -10) >= 0.3 then
				v_u_157[v_u_14] = v495
				v_u_272(v490, 4, v489, v488)
			end
		else
			v_u_272(v487, 10, v489, v488)
		end
		local v496 = 1
		if p485 then
			local v497 = v_u_17.ViewmodelController
			if not v497 then
				local v498 = script.Parent:FindFirstChild("ViewmodelController")
				if v498 then
					local v499 = require
					local v500
					v500, v497 = pcall(v499, v498)
					if v500 and type(v497) == "table" then
						v_u_17.ViewmodelController = v497
					else
						v497 = nil
					end
				else
					v497 = nil
				end
			end
			v496 = v497 and (v497.isScoped and v497.isScoped()) and 0.6 or v496
		end
		local v501 = p482.muzzleDevice or (p482.suppressed and "S" or (p482.flashHidden and "F" or nil))
		v_u_13.muzzleFlash(p483, {
			["fp"] = nil,
			["device"] = nil,
			["class"] = nil,
			["scale"] = nil,
			["own"] = true,
			["fp"] = p485,
			["device"] = v501,
			["class"] = p482.class,
			["scale"] = v496
		})
		v_u_448(p483, (v_u_372[p482.class] or 1) * (p485 and v_u_371 or 1))
		local v_u_502 = v_u_17.ShellFx
		if not v_u_502 then
			local v503 = script.Parent:FindFirstChild("ShellFx")
			if v503 then
				local v504 = require
				local v505
				v505, v_u_502 = pcall(v504, v503)
				if v505 and type(v_u_502) == "table" then
					v_u_17.ShellFx = v_u_502
				else
					v_u_502 = nil
				end
			else
				v_u_502 = nil
			end
		end
		if v_u_502 and p_u_484 then
			local v_u_506 = v_u_502.kindFor(p482)
			if v_u_506 and v_u_502.ejectsOnFire(p482) then
				local v507 = v_u_502.ejectFrom
				local v508 = p485 == true
				local v509 = v_u_14.Character
				if v509 then
					v509 = v509:FindFirstChild("HumanoidRootPart")
				end
				v507(p_u_484, v_u_506, v508, v509 and v509.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
				return
			end
			if v_u_506 and (p482.pumpEvery and not p485) then
				local v510 = v_u_502.actionDelay(p482) or 0.3
				task.delay(v510, function()
					-- upvalues: (copy) p_u_484, (copy) v_u_502, (copy) v_u_506, (ref) v_u_14
					if p_u_484.Parent then
						local v511 = v_u_502.ejectFrom
						local v512 = p_u_484
						local v513 = v_u_506
						local v514 = false
						local v515 = v_u_14.Character
						if v515 then
							v515 = v515:FindFirstChild("HumanoidRootPart")
						end
						v511(v512, v513, v514, v515 and v515.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
					end
				end)
			end
		end
	end
end
local v_u_516 = {}
local function v_u_519() -- name: setupTracers
	-- upvalues: (ref) v_u_18, (copy) v_u_516
	for v517 = 1, 48 do
		local v518 = Instance.new("Part")
		v518.Name = "Tracer"
		v518.Material = Enum.Material.Neon
		v518.Color = Color3.fromRGB(255, 196, 120)
		v518.Size = Vector3.new(0.045, 0.045, 5)
		v518.Anchored = true
		v518.CanCollide = false
		v518.CanQuery = false
		v518.CanTouch = false
		v518.CastShadow = false
		v518.Transparency = 1
		v518.CFrame = CFrame.new(0, -10000, 0)
		v518.Parent = v_u_18
		v_u_516[v517] = {
			["part"] = nil,
			["alive"] = false,
			["part"] = v518
		}
	end
end
local v_u_520 = 0
function v_u_13.tracer(p521, p522, p523, p524, p525) -- name: tracer
	-- upvalues: (ref) v_u_520, (copy) v_u_516
	v_u_520 = v_u_520 % #v_u_516 + 1
	local v526 = v_u_516[v_u_520]
	v526.alive = true
	v526.origin = p521
	v526.dir = p522
	v526.v0 = p523
	v526.k = p524
	v526.t = 0
	v526.tEnd = 3
	v526.part.Transparency = p525 and 0.45 or 0.6
	local v527 = p523 * 0.012
	local v528 = math.clamp(v527, 2, 9)
	v526.part.Size = Vector3.new(0.045, 0.045, v528)
	v526.len = v528
	return v526
end
function v_u_13.stopTracer(p529, p530) -- name: stopTracer
	if p529 then
		local v531 = p529.tEnd
		p529.tEnd = math.min(v531, p530)
	end
end
local v_u_532 = {}
local v_u_533 = 0
local function v_u_537(p534, p535, p536) -- name: hole
	-- upvalues: (copy) v_u_14, (ref) v_u_533, (copy) v_u_532
	if p536 and (p536.Anchored and (v_u_14:GetAttribute("Graphics") or "High") ~= "Low") then
		v_u_533 = v_u_533 % #v_u_532 + 1
		v_u_532[v_u_533].CFrame = CFrame.lookAt(p534 + p535 * 0.005, p534 + p535 * 2) * CFrame.Angles(0, 1.5707963267948966, 0)
	end
end
function v_u_13.onMatchReset(p538) -- name: onMatchReset
	-- upvalues: (copy) v_u_440, (copy) v_u_532, (ref) v_u_533
	if v_u_440.rig and v_u_440.rig.items.Trail then
		v_u_440.rig.items.Trail.e.Enabled = false
	end
	v_u_440.on = false
	v_u_440.v = 0
	if p538 ~= "Character" then
		for _, v539 in v_u_532 do
			v539.CFrame = CFrame.new(0, -10000, 0)
		end
		v_u_533 = 0
	end
end
local v_u_540 = v_u_162
local v_u_541 = v_u_300
local v_u_542 = {}
local function v_u_545() -- name: setupHoles
	-- upvalues: (ref) v_u_18, (copy) v_u_532
	for v543 = 1, 64 do
		local v544 = Instance.new("Part")
		v544.Name = "Hole"
		v544.Shape = Enum.PartType.Cylinder
		v544.Size = Vector3.new(0.02, 0.16, 0.16)
		v544.Color = Color3.fromRGB(22, 20, 18)
		v544.Material = Enum.Material.SmoothPlastic
		v544.Anchored = true
		v544.CanCollide = false
		v544.CanQuery = false
		v544.CanTouch = false
		v544.CastShadow = false
		v544.CFrame = CFrame.new(0, -10000, 0)
		v544.Parent = v_u_18
		v_u_532[v543] = v544
	end
end
for _, v546 in {
	"Metal",
	"DiamondPlate",
	"CorrodedMetal",
	"Foil"
} do
	v_u_542[v546] = "Metal"
end
for _, v547 in { "Wood", "WoodPlanks" } do
	v_u_542[v547] = "Wood"
end
for _, v548 in {
	"Grass",
	"Ground",
	"Sand",
	"Mud",
	"LeafyGrass",
	"Snow",
	"Salt",
	"Fabric",
	"Carpet"
} do
	v_u_542[v548] = "Dirt"
end
for _, v549 in { "Glass", "Ice", "Glacier" } do
	v_u_542[v549] = "Glass"
end
v_u_542.Water = "Water"
local v_u_550 = setmetatable({}, {
	["__mode"] = "k"
})
function v_u_13.blood(p551, p552, p553) -- name: blood
	-- upvalues: (copy) v_u_550, (copy) v_u_14, (copy) v_u_120, (copy) v_u_13
	if typeof(p551) == "Vector3" then
		local v554 = p553 or {}
		local v555 = workspace.CurrentCamera
		local v556 = v555 and ((v555.CFrame.Position - p551).Magnitude or 0) or 0
		if v556 <= 600 then
			local v557 = v554.victim
			if v557 then
				local v558 = os.clock()
				if v_u_550[v557] and v558 - v_u_550[v557] < 0.06 then
					return
				end
				v_u_550[v557] = v558
				if v557 == v_u_14.Character and v556 < 4 then
					return
				end
			end
			local v559 = typeof(p552) == "Vector3" and p552.Magnitude > 0.001 and p552.Unit or (v555 and v556 > 0.01 and ((p551 - v555.CFrame.Position).Unit or Vector3.new(0, 1, 0)) or Vector3.new(0, 1, 0))
			local v560 = (v554.scale or 1) * (v554.head and 1.6 or 1)
			v_u_120("Blood", CFrame.lookAt(p551, p551 + v559), v560)
			local v561 = v554.fleshVolume
			local v562 = type(v561) ~= "number" and 0.7 or v554.fleshVolume
			if v554.sound ~= false and (v562 > 0 and v556 < 160) then
				v_u_13.play3D("Flesh", p551, {
					["volume"] = nil,
					["min"] = 5,
					["max"] = 160,
					["prio"] = 1,
					["volume"] = v562 * (v554.head and 1.2 or 1)
				})
			end
		end
	else
		return
	end
end
function v_u_13.impact(p563, p564, p565, p566, p567) -- name: impact
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_542, (copy) v_u_120, (copy) v_u_537
	local v568 = p567 or {}
	local v569 = workspace.CurrentCamera
	local v570 = v569 and ((v569.CFrame.Position - p563).Magnitude or 0) or 0
	if v570 > 700 then
		return
	else
		local v571 = CFrame.lookAt(p563, p563 + p564) * CFrame.Angles(-1.5707963267948966, 0, 0)
		if v568.flesh then
			local v572
			if p566 then
				v572 = v_u_7.fromPart(p566)
			else
				v572 = p566
			end
			local v573
			if v572 and p566 then
				local v574 = v_u_12.zoneFor
				local v575
				v573, v575 = pcall(v574, v572, p566, p563)
				if v573 then
					v573 = v575 == "Head"
				end
			else
				v573 = false
			end
			local v576 = v_u_10.Bullet or {}
			v_u_13.blood(p563, v568.dir or -p564, {
				["victim"] = v572,
				["head"] = v573,
				["scale"] = v568.scale,
				["sound"] = v568.sound,
				["fleshVolume"] = v576.FleshOwnVolume or 0
			})
		else
			local v577 = v_u_542[p565 and p565.Name or ""] or "Concrete"
			if v577 == "Metal" then
				v_u_120("Sparks", v571)
			elseif v577 == "Wood" then
				v_u_120("Splinters", v571)
			elseif v577 == "Dirt" then
				v_u_120("Dirt", v571)
			elseif v577 == "Glass" then
				v_u_120("Glass", v571)
			elseif v577 == "Water" then
				v_u_120("Water", CFrame.new(p563))
			else
				v_u_120("Dust", v571)
			end
			if v577 ~= "Water" and (v577 ~= "Glass" and v570 < 220) then
				v_u_537(p563, p564, p566)
			end
			if v568.sound ~= false and v570 < 160 then
				local v578 = v577 == "Water" and "Dirt" or v577
				v_u_13.play3D(v578, p563, {
					["volume"] = 0.75,
					["min"] = 5,
					["max"] = 160,
					["prio"] = 1
				})
			end
		end
	end
end
function v_u_13.materialHit(p579, p580) -- name: materialHit
	-- upvalues: (copy) v_u_7, (copy) v_u_13
	local v581 = p579.Instance
	local v582 = v_u_7.fromPart(v581) ~= nil
	local v583 = v_u_13.impact
	local v584 = p579.Position
	local v585 = p579.Normal
	local v586 = p579.Material
	local v587 = {
		["flesh"] = v582
	}
	if p580 then
		p580 = p580.sound
	end
	v587.sound = p580
	v583(v584, v585, v586, v581, v587)
end
local v_u_588 = {}
local v_u_589 = 0
local v_u_590 = setmetatable({}, {
	["__mode"] = "k"
})
local function v_u_600(p_u_591) -- name: hurtOther
	-- upvalues: (copy) v_u_14, (copy) v_u_588, (copy) v_u_10, (copy) v_u_590, (copy) v_u_15, (ref) v_u_589, (copy) v_u_13
	if p_u_591 and (p_u_591 ~= v_u_14.Character and #v_u_588 ~= 0) then
		local v_u_592 = v_u_10.Body or {}
		local v_u_593 = p_u_591:FindFirstChild("Head") or p_u_591:FindFirstChild("HumanoidRootPart")
		local v594 = workspace.CurrentCamera
		if v_u_593 and v594 then
			local v_u_595 = v_u_592.HurtOthersRange or 60
			if v_u_595 < (v_u_593.Position - v594.CFrame.Position).Magnitude then
				return
			else
				local v596 = os.clock()
				if v596 - (v_u_590[p_u_591] or -10) >= (v_u_592.HurtGap or 0.3) then
					v_u_590[p_u_591] = v596
					task.defer(function()
						-- upvalues: (copy) p_u_591, (copy) v_u_593, (ref) v_u_588, (ref) v_u_15, (ref) v_u_589, (ref) v_u_13, (copy) v_u_592, (copy) v_u_595
						local v597 = p_u_591:FindFirstChildOfClass("Humanoid")
						if v597 and (v597.Health > 0 and (p_u_591:GetAttribute("Eliminated") ~= true and v_u_593.Parent)) then
							local v598 = #v_u_588
							local v599 = v_u_15:NextInteger(1, v598)
							if v598 > 1 and v599 == v_u_589 then
								v599 = v599 % v598 + 1
							end
							v_u_589 = v599
							v_u_13.play3D(v_u_588[v599], v_u_593.Position, {
								["volume"] = nil,
								["min"] = 6,
								["max"] = nil,
								["prio"] = 1,
								["volume"] = v_u_592.HurtOthersVolume or 0.45,
								["max"] = v_u_595
							})
						end
					end)
				end
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_612(p601) -- name: onHitFx
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (copy) v_u_600
	if type(p601) == "table" then
		local v602 = p601.p
		if typeof(v602) == "Vector3" then
			local v603 = p601.v
			local v604
			if typeof(v603) == "Instance" and p601.v:IsA("Model") then
				v604 = p601.v or nil
			else
				v604 = nil
			end
			local v605 = v_u_10.Bullet or {}
			local v606 = v_u_13.blood
			local v607 = p601.p
			local v608 = p601.d
			local v609
			if typeof(v608) == "Vector3" then
				v609 = p601.d or nil
			else
				v609 = nil
			end
			local v610 = {
				["head"] = p601.h == true,
				["victim"] = v604
			}
			local v611 = p601.sc
			v610.scale = tonumber(v611)
			v610.fleshVolume = v605.FleshOthersVolume or 0.45
			v606(v607, v609, v610)
			v_u_600(v604)
			return
		end
	end
end
local v_u_613 = RaycastParams.new()
v_u_613.FilterType = Enum.RaycastFilterType.Exclude
v_u_613.IgnoreWater = false
local v_u_614 = {}
local function v_u_621(p615) -- name: excludeList
	-- upvalues: (ref) v_u_18, (copy) v_u_14, (copy) v_u_12
	local v616 = { v_u_18 }
	for _, v617 in { "Loot", "Projectiles" } do
		local v618 = workspace:FindFirstChild(v617)
		if not v618 then
			continue
		end
		table.insert(v616, v618)
	end
	local v619 = workspace.CurrentCamera
	if v619 then
		table.insert(v616, v619)
	end
	if v_u_14.Character then
		local v620 = v_u_14.Character
		table.insert(v616, v620)
	end
	if p615 then
		table.insert(v616, p615)
	end
	v_u_12.addGhosts(v616)
	return v616
end
v_u_13.excludeList = v_u_621
local function v_u_625(p622) -- name: handMuzzle
	if p622 then
		local v623 = p622:FindFirstChild("Right Arm")
		if v623 then
			v623 = v623:FindFirstChild("RootPart")
		end
		local v624 = v623 and v623:IsA("Motor6D")
		if v624 then
			v624 = v623.Part1
		end
		if v624 then
			return v624:FindFirstChild("MuzzleTip") or v624:FindFirstChild("Muzzle")
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_626 = setmetatable({}, {
	["__mode"] = "k"
})
local function v_u_631(p627, p628) -- name: duplicate
	-- upvalues: (copy) v_u_626
	if not p627 or type(p628) ~= "number" then
		return false
	end
	local v629 = v_u_626[p627]
	if not v629 then
		v629 = {
			["i"] = 0
		}
		v_u_626[p627] = v629
	end
	for v630 = 1, 16 do
		if v629[v630] ~= p628 then
			continue
		end
		return true
	end
	v629.i = v629.i % 16 + 1
	v629[v629.i] = p628
	return false
end
local v_u_632 = nil
local v_u_633 = v_u_8.m(50)
local v_u_634 = -10
local v_u_635 = -10
local function v_u_645(p636, p637, p638) -- name: playWhiz
	-- upvalues: (copy) v_u_10, (ref) v_u_634, (copy) v_u_15, (copy) v_u_13
	local v639 = v_u_10.Bullet or {}
	local v640 = os.clock()
	if v640 - v_u_634 < 0.05 then
		return
	end
	v_u_634 = v640
	local v641 = v639.Whiz
	local v642
	if type(v641) == "table" then
		if #v641 == 0 then
			v642 = nil
			if v642 then
				v_u_13.play3D(v642, p636, {
					["volume"] = nil,
					["min"] = 3,
					["max"] = 30,
					["prio"] = 2,
					["volume"] = v639.WhizVolume or 0.9
				})
			end
			if not p638 or p637 >= (v639.CrackRadius or 4) then
				return
			end
		else
			v641 = v641[v_u_15:NextInteger(1, #v641)]
			if type(v641) == "number" and v641 > 0 then
				v642 = "rbxassetid://" .. v641
			else
				v642 = nil
			end
			if v642 then
				v_u_13.play3D(v642, p636, {
					["volume"] = nil,
					["min"] = 3,
					["max"] = 30,
					["prio"] = 2,
					["volume"] = v639.WhizVolume or 0.9
				})
			end
			if not p638 or p637 >= (v639.CrackRadius or 4) then
				return
			end
		end
	else
		if type(v641) == "number" and v641 > 0 then
			v642 = "rbxassetid://" .. v641
		else
			v642 = nil
		end
		if v642 then
			v_u_13.play3D(v642, p636, {
				["volume"] = nil,
				["min"] = 3,
				["max"] = 30,
				["prio"] = 2,
				["volume"] = v639.WhizVolume or 0.9
			})
		end
		if not p638 or p637 >= (v639.CrackRadius or 4) then
			return
		end
	end
	local v643 = v639.Crack
	local v644
	if type(v643) == "table" then
		if #v643 == 0 then
			v644 = nil
			if v644 then
				v_u_13.play3D(v644, p636, {
					["volume"] = nil,
					["min"] = 3,
					["max"] = 25,
					["prio"] = 2,
					["volume"] = v639.CrackVolume or 0.8
				})
			end
		else
			v643 = v643[v_u_15:NextInteger(1, #v643)]
			if type(v643) == "number" and v643 > 0 then
				v644 = "rbxassetid://" .. v643
			else
				v644 = nil
			end
			if v644 then
				v_u_13.play3D(v644, p636, {
					["volume"] = nil,
					["min"] = 3,
					["max"] = 25,
					["prio"] = 2,
					["volume"] = v639.CrackVolume or 0.8
				})
			end
		end
	else
		if type(v643) == "number" and v643 > 0 then
			v644 = "rbxassetid://" .. v643
		else
			v644 = nil
		end
		if v644 then
			v_u_13.play3D(v644, p636, {
				["volume"] = nil,
				["min"] = 3,
				["max"] = 25,
				["prio"] = 2,
				["volume"] = v639.CrackVolume or 0.8
			})
		end
	end
end
local function v_u_651(p646) -- name: nearImpact
	-- upvalues: (copy) v_u_10, (ref) v_u_635, (copy) v_u_15, (copy) v_u_13
	local v647 = v_u_10.Bullet or {}
	local v648 = os.clock()
	if v648 - v_u_635 < 0.08 then
		return
	end
	local v649 = v647.NearImpact
	local v650
	if type(v649) == "table" then
		if #v649 == 0 then
			v650 = nil
			if v650 then
				v_u_635 = v648
				v_u_13.play3D(v650, p646, {
					["volume"] = nil,
					["speed"] = nil,
					["min"] = 4,
					["max"] = 40,
					["prio"] = 2,
					["volume"] = v647.NearImpactVolume or 0.5,
					["speed"] = v647.NearImpactSpeed or 1
				})
			end
		else
			v649 = v649[v_u_15:NextInteger(1, #v649)]
			if type(v649) == "number" and v649 > 0 then
				v650 = "rbxassetid://" .. v649
			else
				v650 = nil
			end
			if v650 then
				v_u_635 = v648
				v_u_13.play3D(v650, p646, {
					["volume"] = nil,
					["speed"] = nil,
					["min"] = 4,
					["max"] = 40,
					["prio"] = 2,
					["volume"] = v647.NearImpactVolume or 0.5,
					["speed"] = v647.NearImpactSpeed or 1
				})
			end
		end
	else
		if type(v649) == "number" and v649 > 0 then
			v650 = "rbxassetid://" .. v649
		else
			v650 = nil
		end
		if v650 then
			v_u_635 = v648
			v_u_13.play3D(v650, p646, {
				["volume"] = nil,
				["speed"] = nil,
				["min"] = 4,
				["max"] = 40,
				["prio"] = 2,
				["volume"] = v647.NearImpactVolume or 0.5,
				["speed"] = v647.NearImpactSpeed or 1
			})
		end
	end
end
local function v_u_709(p652) -- name: onShot
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_631, (copy) v_u_333, (copy) v_u_625, (ref) v_u_632, (copy) v_u_13, (copy) v_u_633, (copy) v_u_17, (copy) v_u_8, (copy) v_u_10, (copy) v_u_614, (copy) v_u_11, (copy) v_u_645, (copy) v_u_15
	if type(p652) == "table" then
		local v653 = p652.origin
		if typeof(v653) == "Vector3" then
			local v654 = p652.dir
			if typeof(v654) == "Vector3" then
				local v655 = workspace.CurrentCamera
				if v655 then
					local v656 = v_u_9.Weapons[p652.weaponId or ""]
					local v657 = p652.shooter
					local v_u_658
					if typeof(v657) == "Instance" and p652.shooter:IsA("Model") then
						v_u_658 = p652.shooter or nil
					else
						v_u_658 = nil
					end
					if v_u_658 == v_u_14.Character then
						return
					elseif v_u_631(v_u_658, p652.sid) then
						return
					else
						local v659 = v655.CFrame.Position
						local v660 = (v659 - p652.origin).Magnitude
						local v661 = p652.suppressed == true
						v_u_333(p652.origin, p652.weaponId or "", v661, v_u_658, p652.bu == true)
						if v660 < 900 then
							local v662 = v_u_625(v_u_658)
							if not v662 and (v_u_632 and p652.dir.Magnitude > 0.001) then
								v_u_632.WorldCFrame = CFrame.lookAt(p652.origin, p652.origin + p652.dir)
								v662 = v_u_632
							end
							local v663 = p652.md
							local v664 = type(v663) == "string" and p652.md or (v661 and "S" or nil)
							local v665 = v_u_13.muzzleFlash
							local v666 = {
								["device"] = v664
							}
							local v667
							if v656 then
								v667 = v656.Class
							else
								v667 = v656
							end
							v666.class = v667
							v666.smoke = v660 < 300
							v665(v662, v666)
							local v_u_668
							if v660 < v_u_633 and v_u_658 then
								local v669 = v_u_17.ShellFx
								if not v669 then
									local v670 = script.Parent:FindFirstChild("ShellFx")
									if v670 then
										local v671 = require
										local v672
										v672, v669 = pcall(v671, v670)
										if v672 and type(v669) == "table" then
											v_u_17.ShellFx = v669
										else
											v669 = nil
										end
									else
										v669 = nil
									end
								end
								v_u_668 = v669 or nil
							else
								v_u_668 = nil
							end
							local v_u_673
							if v_u_668 then
								v_u_673 = v_u_668.kindFor(p652.weaponId)
							else
								v_u_673 = v_u_668
							end
							if v_u_668 and v_u_673 then
								if v_u_668.ejectsOnFire(p652.weaponId) then
									local v674 = v_u_668.ejectFrom
									local v675
									if v_u_658 then
										local v676 = v_u_658:FindFirstChild("Right Arm")
										if v676 then
											v676 = v676:FindFirstChild("RootPart")
										end
										v675 = v676 and v676:IsA("Motor6D")
										if v675 then
											v675 = v676.Part1
										end
										if v675 then
											v675 = v675:FindFirstChild("Eject")
										end
									else
										v675 = nil
									end
									local v677 = false
									local v678
									if v_u_658 then
										v678 = v_u_658:FindFirstChild("HumanoidRootPart")
									else
										v678 = v_u_658
									end
									v674(v675, v_u_673, v677, v678 and v678.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
								else
									local v679 = v_u_668.actionDelay(p652.weaponId)
									if v679 then
										task.delay(v679, function()
											-- upvalues: (copy) v_u_668, (copy) v_u_658, (copy) v_u_673
											local v680 = v_u_668.ejectFrom
											local v681 = v_u_658
											local v682
											if v681 then
												local v683 = v681:FindFirstChild("Right Arm")
												if v683 then
													v683 = v683:FindFirstChild("RootPart")
												end
												v682 = v683 and v683:IsA("Motor6D")
												if v682 then
													v682 = v683.Part1
												end
												if v682 then
													v682 = v682:FindFirstChild("Eject")
												end
											else
												v682 = nil
											end
											local v684 = v_u_673
											local v685 = false
											local v686 = v_u_658
											if v686 then
												v686 = v686:FindFirstChild("HumanoidRootPart")
											end
											v680(v682, v684, v685, v686 and v686.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
										end)
									end
								end
							end
						end
						local v687 = v_u_8.ms(v656 and (v656.Velocity or 800) or 800)
						local v688 = not v656 or v656.Drag or (v_u_9.Class[v656.Class] and (v_u_9.Class[v656.Class].Drag or 0.4) or 0.4)
						local v689 = p652.dir.Unit
						local v_u_690
						if v656 == nil or (v656.Velocity == nil or v656.Velocity <= 345) then
							v_u_690 = false
						else
							v_u_690 = not v656.Subsonic
						end
						local v691 = v_u_14.Character
						if v691 then
							v691 = v691:FindFirstChild("Head")
						end
						local v692
						if v691 and v_u_14:GetAttribute("Spectating") == nil then
							v692 = v691.Position
						else
							local v693 = workspace.CurrentCamera
							v692 = v693 and v693.CFrame.Position or nil
						end
						local v694 = v_u_10.Bullet and v_u_10.Bullet.WhizRadius or 6
						local v695 = false
						local v_u_696 = (1 / 0)
						local v697
						if v692 then
							v697 = (v692 - p652.origin):Dot(v689)
							if v697 > 4 then
								v_u_696 = (p652.origin + v689 * v697 - v692).Magnitude
								if v_u_696 < v694 + 1.5 then
									v695 = true
								else
									v695 = false
								end
							end
						else
							v697 = 0
						end
						local v698 = (v659 - p652.origin):Dot(v689)
						if (v659 - p652.origin - v689 * math.max(v698, 0)).Magnitude > 650 or #v_u_614 > 40 then
							if v695 and (v692 and (v_u_696 < v694 and v_u_696 > 0.9)) then
								local v_u_699 = p652.origin + v689 * v697
								local v700 = v_u_11.timeFor(v687, v688, v697) or v697 / v687
								task.delay(v700, function()
									-- upvalues: (ref) v_u_645, (copy) v_u_699, (ref) v_u_696, (copy) v_u_690
									v_u_645(v_u_699, v_u_696, v_u_690)
								end)
							end
						else
							local v701 = p652.pellets or 1
							local v702 = math.min(v701, 3)
							for v703 = 1, v702 do
								local v704
								if v702 > 1 then
									v704 = v_u_11.cone(v689, v656 and (v656.PelletSpread or 8) or 8, v_u_15)
								else
									v704 = v689
								end
								local v705 = v_u_614
								local v706 = {
									["origin"] = nil,
									["dir"] = nil,
									["v0"] = nil,
									["k"] = nil,
									["t"] = 0,
									["shooter"] = nil,
									["tr"] = nil,
									["maxT"] = 2.2,
									["near"] = nil,
									["sonic"] = nil,
									["whizzed"] = false,
									["origin"] = p652.origin,
									["dir"] = v704,
									["v0"] = v687,
									["k"] = v688,
									["shooter"] = v_u_658
								}
								local v707
								if v703 == 1 and v660 < 450 then
									v707 = v_u_13.tracer(p652.origin, v704, v687, v688, false) or nil
								else
									v707 = nil
								end
								v706.tr = v707
								local v708
								if v695 then
									v708 = v703 == 1
								else
									v708 = v695
								end
								v706.near = v708
								v706.sonic = v_u_690
								table.insert(v705, v706)
							end
						end
					end
				else
					return
				end
			end
		end
	end
end
local _ = v_u_8.Gravity
local v_u_710 = {}
local v_u_711 = {}
local v_u_712 = {}
local v_u_713 = { "Loot", "Projectiles" }
local function v_u_723() -- name: refreshRemoteFilter
	-- upvalues: (copy) v_u_712, (ref) v_u_18, (copy) v_u_713, (copy) v_u_14, (copy) v_u_12
	table.clear(v_u_712)
	local v714 = v_u_712
	local v715 = v_u_18
	table.insert(v714, v715)
	for _, v716 in v_u_713 do
		local v717 = workspace:FindFirstChild(v716)
		if not v717 then
			continue
		end
		local v718 = v_u_712
		table.insert(v718, v717)
	end
	local v719 = workspace.CurrentCamera
	if v719 then
		local v720 = v_u_712
		table.insert(v720, v719)
	end
	if v_u_14.Character then
		local v721 = v_u_712
		local v722 = v_u_14.Character
		table.insert(v721, v722)
	end
	v_u_12.addGhosts(v_u_712)
	return #v_u_712
end
local function v_u_771(p724) -- name: step
	-- upvalues: (copy) v_u_143, (copy) v_u_358, (copy) v_u_455, (copy) v_u_710, (copy) v_u_711, (copy) v_u_516, (copy) v_u_11, (copy) v_u_614, (copy) v_u_14, (copy) v_u_10, (copy) v_u_723, (copy) v_u_712, (copy) v_u_613, (copy) v_u_12, (copy) v_u_645, (copy) v_u_13, (copy) v_u_7, (copy) v_u_651
	local v725 = os.clock()
	v_u_143()
	for _, v726 in v_u_358 do
		if not v726.light.Enabled or v726.off >= v725 then
			continue
		end
		v726.light.Enabled = false
	end
	v_u_455()
	table.clear(v_u_710)
	table.clear(v_u_711)
	for _, v727 in v_u_516 do
		if not v727.alive then
			continue
		end
		v727.t = v727.t + p724
		local v728 = v727.t
		local v729 = v727.tEnd
		local v730 = math.min(v728, v729)
		local v731 = v_u_11.position(v727.origin, v727.dir, v727.v0, v727.k, v730)
		local v732 = v_u_11.dist(v727.v0, v727.k, v730)
		if v727.t >= v727.tEnd or v732 < 0.5 then
			if v727.t < v727.tEnd then
				continue
			end
			v727.alive = false
			local v733 = v_u_710
			local v734 = v727.part
			table.insert(v733, v734)
			local v735 = v_u_711
			local v736 = CFrame.new
			table.insert(v735, v736(0, -10000, 0))
		else
			local v737 = v727.len
			local v738 = math.min(v737, v732)
			local v739 = v_u_11.velocity(v727.dir, v727.v0, v727.k, v730).Unit
			local v740 = v_u_710
			local v741 = v727.part
			table.insert(v740, v741)
			local v742 = v_u_711
			local v743 = CFrame.lookAt
			local v744 = v731 - v739 * (v738 * 0.5)
			table.insert(v742, v743(v744, v731))
		end
	end
	if #v_u_710 > 0 then
		workspace:BulkMoveTo(v_u_710, v_u_711, Enum.BulkMoveMode.FireCFrameChanged)
	end
	if #v_u_614 > 0 then
		local v745 = v_u_14.Character
		if v745 then
			v745 = v745:FindFirstChild("Head")
		end
		local v746
		if v745 and v_u_14:GetAttribute("Spectating") == nil then
			v746 = v745.Position
		else
			local v747 = workspace.CurrentCamera
			v746 = v747 and v747.CFrame.Position or nil
		end
		local v748 = v_u_10.Bullet or {}
		local v749 = v748.WhizRadius or 6
		local v750 = v748.NearImpactRadius or 10
		local v751 = v_u_723()
		for v752 = #v_u_614, 1, -1 do
			local v753 = v_u_614[v752]
			local v754 = v753.t
			local v755 = v753.t + p724
			v753.t = v755
			v_u_712[v751 + 1] = v753.shooter
			v_u_613.FilterDescendantsInstances = v_u_712
			local v756 = v_u_11.position(v753.origin, v753.dir, v753.v0, v753.k, v754)
			local v757 = v_u_11.position(v753.origin, v753.dir, v753.v0, v753.k, v755)
			local v758 = v757 - v756
			local v759 = workspace:Raycast(v756, v758, v_u_613)
			local v760 = 0
			while v759 and (v760 < 4 and v_u_12.passThrough(v759.Instance)) do
				v760 = v760 + 1
				local v761 = v759.Position + v758.Unit * 0.05
				local v762 = v757 - v761
				if v762:Dot(v758) <= 0 then
					v759 = nil
					break
				end
				v759 = workspace:Raycast(v761, v762, v_u_613)
			end
			local v763
			if v759 then
				local v764 = (v759.Position - v756).Magnitude
				local v765 = v758.Magnitude
				v763 = v764 / math.max(v765, 0.0001)
			else
				v763 = 1
			end
			if v753.near and (not v753.whizzed and v746) then
				local v766 = v758:Dot(v758)
				if v766 > 1e-6 then
					local v767 = (v746 - v756):Dot(v758) / v766
					if v767 <= v763 then
						v753.whizzed = true
						local v768 = v756 + v758 * math.max(v767, 0)
						local v769 = (v768 - v746).Magnitude
						if v769 < v749 and v769 > 0.9 then
							v_u_645(v768, v769, v753.sonic == true)
						end
					elseif v759 then
						v753.whizzed = true
					end
				end
			end
			if v759 then
				v_u_13.stopTracer(v753.tr, v754 + p724 * v763)
				local v770
				if v_u_7.fromPart(v759.Instance) == nil then
					v_u_13.impact(v759.Position, v759.Normal, v759.Material, v759.Instance, {})
					v770 = true
				else
					v770 = false
				end
				if v770 and (v746 and (v759.Position - v746).Magnitude < v750) then
					v_u_651(v759.Position)
				end
				table.remove(v_u_614, v752)
			else
				if v753.maxT >= v755 then
					break
				end
				table.remove(v_u_614, v752)
			end
		end
		v_u_712[v751 + 1] = nil
	end
end
local v_u_772 = {}
local v_u_773 = {}
local function v_u_804(p_u_774) -- name: startSmoke
	-- upvalues: (copy) v_u_8, (ref) v_u_18, (copy) v_u_14, (copy) v_u_27, (copy) v_u_13, (copy) v_u_772
	local v775 = workspace:GetServerTimeNow()
	local v776 = (p_u_774.endsAt or v775 + (p_u_774.duration or 40)) - v775
	if v776 > 1 then
		local v777 = p_u_774.radius or v_u_8.m(6)
		local v778 = p_u_774.pos
		local v_u_779 = Instance.new("Part")
		v_u_779.Name = "SmokeCloud"
		v_u_779.Anchored = true
		v_u_779.CanCollide = false
		v_u_779.CanQuery = false
		v_u_779.CanTouch = false
		v_u_779.Transparency = 1
		v_u_779.Size = Vector3.new(0.2, 0.2, 0.2)
		v_u_779.CFrame = CFrame.new(v778)
		v_u_779.Parent = v_u_18
		local v780 = (v_u_14:GetAttribute("Graphics") or "High") == "Low"
		local v781 = { Vector3.new(0, 0, 0) }
		local v_u_782 = {}
		for v783 = 1, 6 do
			local v784 = v783 / 6 * 3.141592653589793 * 2
			local v785 = math.cos(v784) * v777 * 0.55
			local v786 = 0.5 + v783 % 2 * v777 * 0.25
			local v787 = math.sin(v784) * v777 * 0.55
			local v788 = Vector3.new(v785, v786, v787)
			table.insert(v781, v788)
		end
		for _, v789 in v781 do
			local v790 = Instance.new("Attachment")
			v790.Position = v789 + Vector3.new(0, 1, 0)
			v790.Parent = v_u_779
			local v791 = v_u_27
			local v792 = {
				["tex"] = "rbxasset://textures/particles/smoke_main.dds",
				["color"] = nil,
				["size"] = nil,
				["trans"] = nil,
				["life"] = nil,
				["speed"] = nil,
				["spread"] = nil,
				["drag"] = 0.8,
				["accel"] = Vector3.new(0.4, 0.35, 0.2),
				["rot"] = nil
			}
			local v793 = Color3.fromRGB(205, 205, 200)
			local v794 = Color3.fromRGB(175, 175, 172)
			v792.color = ColorSequence.new(v793, v794 or v793)
			v792.size = NumberSequence.new({ NumberSequenceKeypoint.new(0, v777 * 0.45), NumberSequenceKeypoint.new(1, v777 * 1.05) })
			v792.trans = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.08, 0.12),
				NumberSequenceKeypoint.new(0.75, 0.2),
				NumberSequenceKeypoint.new(1, 1)
			})
			v792.life = NumberRange.new(7, 10)
			v792.speed = NumberRange.new(0.6, 2.2)
			v792.spread = Vector2.new(180, 180)
			v792.rot = NumberRange.new(-12, 12)
			local v795 = v791(v790, v792)
			v795.Rate = v780 and 1.6 or 3.2
			v795.Enabled = true
			v795:Emit(v780 and 3 or 6)
			table.insert(v_u_782, v795)
		end
		local v796 = (p_u_774.duration or v776) - v776
		local v797 = math.max(0, v796)
		if v797 < 1 then
			v_u_13.play3D("SmokeDeploy", p_u_774.pos, {
				["volume"] = 0.85,
				["min"] = 8,
				["max"] = 160,
				["prio"] = 2
			})
		end
		local v_u_798 = {
			["part"] = v_u_779,
			["ems"] = v_u_782,
			["snd"] = v_u_13.play3D("SmokeHiss", p_u_774.pos, {
				["volume"] = nil,
				["min"] = 6,
				["max"] = 120,
				["prio"] = 2,
				["looped"] = true,
				["volume"] = v797 < 1 and 0.35 or 0.5
			}),
			["endsAt"] = v775 + v776
		}
		v_u_772[p_u_774.id or #v_u_772 + 1] = v_u_798
		local v799 = v776 - 9
		local v800 = math.max(v799, 0.5)
		local v801 = task.delay
		local v802 = v776 - (p_u_774.soundStops or 10)
		v801(math.max(v802, 0.5), function()
			-- upvalues: (copy) v_u_798
			if v_u_798.snd and v_u_798.snd.Looped then
				v_u_798.snd.Looped = false
				v_u_798.snd:Stop()
			end
		end)
		task.delay(v800, function()
			-- upvalues: (copy) v_u_782
			for _, v803 in v_u_782 do
				v803.Enabled = false
			end
		end)
		task.delay(v776 + 2, function()
			-- upvalues: (copy) v_u_779, (ref) v_u_772, (copy) p_u_774
			v_u_779:Destroy()
			v_u_772[p_u_774.id] = nil
		end)
	end
end
local function v_u_838(p_u_805) -- name: startFire
	-- upvalues: (copy) v_u_8, (ref) v_u_18, (copy) v_u_15, (copy) v_u_27, (copy) v_u_14, (copy) v_u_13, (copy) v_u_773
	local v806 = workspace:GetServerTimeNow()
	local v807 = (p_u_805.endsAt or v806 + (p_u_805.duration or 10)) - v806
	if v807 > 0.2 then
		local v808 = p_u_805.radius or v_u_8.m(3.5)
		local v809 = p_u_805.pos
		local v810 = Instance.new("Part")
		v810.Name = "FireArea"
		v810.Anchored = true
		v810.CanCollide = false
		v810.CanQuery = false
		v810.CanTouch = false
		v810.Transparency = 1
		v810.Size = Vector3.new(0.2, 0.2, 0.2)
		v810.CFrame = CFrame.new(v809)
		v810.Parent = v_u_18
		local v811 = { Vector3.new(0, 0, 0) }
		local v812 = {}
		for v813 = 1, 8 do
			local v814 = v813 / 8 * 3.141592653589793 * 2
			local v815 = math.cos(v814) * v808 * 0.6
			local v816 = math.sin(v814) * v808 * 0.6
			local v817 = Vector3.new(v815, 0, v816)
			table.insert(v811, v817)
		end
		for _ = 1, 5 do
			local v818 = v_u_15:NextNumber() * 3.141592653589793 * 2
			local v819 = v808 * (0.3 + v_u_15:NextNumber() * 0.6)
			local v820 = math.cos(v818) * v819
			local v821 = math.sin(v818) * v819
			local v822 = Vector3.new(v820, 0, v821)
			table.insert(v811, v822)
		end
		for v823, v824 in v811 do
			local v825 = Instance.new("Attachment")
			v825.Position = v824 + Vector3.new(0, 0.3, 0)
			v825.Parent = v810
			local v826 = v_u_27
			local v827 = {
				["tex"] = "rbxasset://textures/particles/fire_main.dds",
				["color"] = nil,
				["size"] = nil,
				["trans"] = nil,
				["life"] = nil,
				["speed"] = nil,
				["spread"] = nil,
				["light"] = 1,
				["lightInf"] = 0,
				["accel"] = Vector3.new(0, 4, 0)
			}
			local v828 = Color3.fromRGB(255, 170, 70)
			local v829 = Color3.fromRGB(255, 70, 20)
			v827.color = ColorSequence.new(v828, v829 or v828)
			v827.size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.2), NumberSequenceKeypoint.new(0.4, 2.6), NumberSequenceKeypoint.new(1, 0.2) })
			v827.trans = NumberSequence.new(0.15, 1)
			v827.life = NumberRange.new(0.5, 1)
			v827.speed = NumberRange.new(2, 5)
			v827.spread = Vector2.new(12, 12)
			local v830 = v826(v825, v827)
			v830.Rate = (v_u_14:GetAttribute("Graphics") or "High") == "Low" and 6 or 12
			v830.Enabled = true
			table.insert(v812, v830)
			if v823 % 3 ~= 1 then
				continue
			end
			local v831 = v_u_27
			local v832 = {
				["tex"] = "rbxasset://textures/particles/smoke_main.dds",
				["color"] = nil,
				["size"] = nil,
				["trans"] = nil,
				["life"] = nil,
				["speed"] = nil,
				["spread"] = nil,
				["accel"] = Vector3.new(0.5, 2, 0)
			}
			local v833, v834 = Color3.fromRGB(45, 42, 40)
			v832.color = ColorSequence.new(v833, v834 or v833)
			v832.size = NumberSequence.new(2, 7)
			v832.trans = NumberSequence.new(0.4, 1)
			v832.life = NumberRange.new(2, 3.5)
			v832.speed = NumberRange.new(3, 6)
			v832.spread = Vector2.new(10, 10)
			local v835 = v831(v825, v832)
			v835.Rate = 2
			v835.Enabled = true
			table.insert(v812, v835)
		end
		local v836 = Instance.new("PointLight")
		v836.Color = Color3.fromRGB(255, 140, 60)
		v836.Range = v808 * 3
		v836.Brightness = 2.5
		v836.Parent = v810
		local v_u_837 = {
			["part"] = v810,
			["ems"] = v812,
			["light"] = v836,
			["snd"] = v_u_13.play3D("FireLoop", p_u_805.pos, {
				["volume"] = 0.8,
				["min"] = 8,
				["max"] = 150,
				["prio"] = 2,
				["looped"] = true
			})
		}
		v_u_773[p_u_805.id or 0] = v_u_837
		task.delay(v807, function()
			-- upvalues: (ref) v_u_773, (copy) p_u_805, (copy) v_u_837, (ref) v_u_13
			if v_u_773[p_u_805.id or 0] == v_u_837 then
				v_u_13.endFire(p_u_805.id or 0)
			end
		end)
	end
end
function v_u_13.endFire(p839) -- name: endFire
	-- upvalues: (copy) v_u_773, (copy) v_u_5
	local v_u_840 = v_u_773[p839]
	if v_u_840 then
		v_u_773[p839] = nil
		for _, v841 in v_u_840.ems do
			v841.Enabled = false
		end
		if v_u_840.snd then
			v_u_840.snd.Looped = false
			v_u_840.snd:Stop()
		end
		v_u_5:Create(v_u_840.light, TweenInfo.new(1.2), {
			["Brightness"] = 0
		}):Play()
		task.delay(3, function()
			-- upvalues: (copy) v_u_840
			v_u_840.part:Destroy()
		end)
	end
end
local function v_u_849(p842) -- name: cameraShake
	-- upvalues: (copy) v_u_3
	local v843 = v_u_3.Client.Controllers:FindFirstChild("CameraController")
	if v843 then
		local v844 = require
		local v845, v846 = pcall(v844, v843)
		if v845 and v846 then
			local v847 = v846.shake
			if type(v847) == "function" then
				local v848 = v846.shake
				pcall(v848, p842)
			end
		end
	end
end
local function v_u_862(p850) -- name: explosion
	-- upvalues: (copy) v_u_120, (copy) v_u_370, (copy) v_u_16, (copy) v_u_8, (copy) v_u_13, (copy) v_u_849, (copy) v_u_772
	local v_u_851 = p850.pos
	local v852 = p850.scale
	local v853 = tonumber(v852) or 1
	local v854 = math.clamp(v853, 0.5, 3)
	v_u_120("Explosion", CFrame.new(v_u_851), v854)
	v_u_370(v_u_851 + Vector3.new(0, 2, 0), math.min(v854, 1.5) * 4)
	local v855 = workspace.CurrentCamera
	local v_u_856 = v855 and ((v855.CFrame.Position - v_u_851).Magnitude or 0) or 0
	local v857 = v_u_856 / v_u_16
	task.delay(v857, function()
		-- upvalues: (copy) v_u_856, (ref) v_u_8, (ref) v_u_13, (copy) v_u_851
		if v_u_856 < v_u_8.m(120) then
			v_u_13.play3D("GrenadeExplosion", v_u_851, {
				["volume"] = 1,
				["min"] = 20,
				["max"] = nil,
				["prio"] = 4,
				["max"] = v_u_8.m(200)
			})
		end
		if v_u_856 > v_u_8.m(60) then
			v_u_13.play3D("ExplosionFar", v_u_851, {
				["volume"] = 0.9,
				["min"] = 80,
				["max"] = nil,
				["prio"] = 3,
				["max"] = v_u_8.m(1200)
			})
		end
	end)
	local v858 = p850.shakeRadius or v_u_8.m(30)
	if v_u_856 < v858 then
		v_u_849((p850.shake or 1) * (1 - v_u_856 / v858) * 2)
	end
	for _, v_u_859 in v_u_772 do
		if (v_u_859.part.Position - v_u_851).Magnitude >= v_u_8.m(14) then
			continue
		end
		for _, v860 in v_u_859.ems do
			v860.Enabled = false
		end
		task.delay(1.5, function()
			-- upvalues: (copy) v_u_859
			if v_u_859.part.Parent and workspace:GetServerTimeNow() < v_u_859.endsAt - 9 then
				for _, v861 in v_u_859.ems do
					v861.Enabled = true
				end
			end
		end)
	end
end
local v_u_863 = nil
local v_u_864 = nil
local v_u_865 = nil
function v_u_13.blind(p_u_866, p867) -- name: blind
	-- upvalues: (ref) v_u_863, (ref) v_u_864, (copy) v_u_14, (copy) v_u_5, (ref) v_u_865, (copy) v_u_13
	if not v_u_863 then
		local v868, v869 = pcall(function()
			return require(game:GetService("ReplicatedStorage").Client.UIKit.Templates).clone("CombatFlash")
		end)
		if v868 then
			if v869 then
				v868 = v869:FindFirstChild("Flash")
			else
				v868 = v869
			end
		end
		if v868 and v868:IsA("Frame") then
			v_u_863 = v869
			v_u_864 = v868
			v_u_864.BackgroundTransparency = 1
			v_u_863.IgnoreGuiInset = true
			v_u_863.ScreenInsets = Enum.ScreenInsets.None
			v_u_864.AnchorPoint = Vector2.zero
			v_u_864.Position = UDim2.new()
			v_u_864.Size = UDim2.fromScale(1, 1)
			v_u_863.Enabled = true
			v_u_863.Parent = v_u_14:WaitForChild("PlayerGui")
		end
	end
	if not v_u_863 then
		v_u_863 = Instance.new("ScreenGui")
		v_u_863.Name = "CombatFlash"
		v_u_863.IgnoreGuiInset = true
		v_u_863.ScreenInsets = Enum.ScreenInsets.None
		v_u_863.ResetOnSpawn = false
		v_u_863.DisplayOrder = 50
		v_u_864 = Instance.new("Frame")
		v_u_864.Size = UDim2.fromScale(1, 1)
		v_u_864.BackgroundColor3 = Color3.new(1, 1, 1)
		v_u_864.BackgroundTransparency = 1
		v_u_864.BorderSizePixel = 0
		v_u_864.Parent = v_u_863
		v_u_863.Parent = v_u_14:WaitForChild("PlayerGui")
	end
	v_u_864.BackgroundTransparency = p867 and 0 or 0.35
	local v_u_870 = p867 and p_u_866 * 0.55 or p_u_866 * 0.2
	task.delay(v_u_870, function()
		-- upvalues: (ref) v_u_5, (ref) v_u_864, (copy) p_u_866, (copy) v_u_870
		local v871 = v_u_5
		local v872 = v_u_864
		local v873 = TweenInfo.new
		local v874 = p_u_866 - v_u_870
		v871:Create(v872, v873(math.max(v874, 0.2), Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["BackgroundTransparency"] = 1
		}):Play()
	end)
	v_u_865 = v_u_13.play2D("EarRing", p867 and 0.35 or 0.2, 1)
	if v_u_865 then
		local v_u_875 = v_u_865
		v_u_5:Create(v_u_875, TweenInfo.new(p_u_866 * 1.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Volume"] = 0
		}):Play()
		task.delay(p_u_866 * 1.4 + 0.1, function()
			-- upvalues: (copy) v_u_875, (ref) v_u_13
			if v_u_875.SoundId == v_u_13.idFor("EarRing") then
				v_u_875:Stop()
			end
		end)
	end
end
local v_u_876 = Color3.fromRGB(220, 45, 40)
local v_u_877 = Color3.fromRGB(190, 70, 60)
local v_u_878 = {}
local v_u_879 = nil
local v_u_880 = RaycastParams.new()
v_u_880.FilterType = Enum.RaycastFilterType.Exclude
v_u_880.RespectCanCollide = true
v_u_880.IgnoreWater = true
local function v_u_888(p881) -- name: smokeTrans
	local v882 = p881 * 0.65 + 0.15
	local v883 = NumberSequence.new
	local v884 = {}
	local v885 = NumberSequenceKeypoint.new(0, v882)
	local v886 = NumberSequenceKeypoint.new
	local v887 = v882 + 0.25
	__set_list(v884, 1, {v885, v886(0.6, (math.min(1, v887))), NumberSequenceKeypoint.new(1, 1)})
	return v883(v884)
end
local function v_u_898(p889, p890) -- name: addFlareEmitter
	-- upvalues: (copy) v_u_27, (copy) v_u_876, (copy) v_u_877, (copy) v_u_888
	local v891 = Instance.new("Attachment")
	v891.Parent = p889.holder
	v891.WorldPosition = p890
	local v892 = v_u_27
	local v893 = {
		["tex"] = "rbxasset://textures/particles/smoke_main.dds",
		["color"] = nil,
		["size"] = nil,
		["trans"] = nil,
		["life"] = nil,
		["speed"] = nil,
		["spread"] = nil,
		["drag"] = 0.9,
		["accel"] = Vector3.new(0, 0.35, 0),
		["rot"] = nil,
		["lightInf"] = 0.6
	}
	local v894 = v_u_876
	local v895 = v_u_877
	v893.color = ColorSequence.new(v894, v895 or v894)
	v893.size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5), NumberSequenceKeypoint.new(0.3, 12), NumberSequenceKeypoint.new(1, 22) })
	v893.trans = v_u_888(p889.fade)
	v893.life = NumberRange.new(8, 12)
	v893.speed = NumberRange.new(0.6, 1.8)
	v893.spread = Vector2.new(180, 180)
	v893.rot = NumberRange.new(-10, 10)
	local v896 = v892(v891, v893)
	v896.Rate = 1.3 * (1 - 0.7 * p889.fade)
	v896.Enabled = true
	v896:Emit(3)
	local v897 = p889.smoke
	table.insert(v897, v896)
	p889.lastAtt = v891
end
local function v_u_904(p899, p900) -- name: flareTrailTo
	-- upvalues: (copy) v_u_898
	local v901 = p899.lastPt
	local v902 = (p900 - v901).Magnitude
	if v902 >= 0.001 then
		local v903 = 10 - p899.carry
		while v903 <= v902 do
			v_u_898(p899, v901:Lerp(p900, v903 / v902))
			v903 = v903 + 10
		end
		p899.carry = v902 - (v903 - 10)
		p899.lastPt = p900
	end
end
local function v_u_916(p905) -- name: endFlare
	-- upvalues: (copy) v_u_878, (copy) v_u_5
	local v_u_906
	if p905 then
		v_u_906 = v_u_878[p905]
	else
		v_u_906 = p905
	end
	if v_u_906 then
		v_u_878[p905] = nil
		for _, v907 in v_u_906.smoke do
			v907.Enabled = false
		end
		for _, v908 in v_u_906.burn do
			v908.Enabled = false
		end
		if v_u_906.light and v_u_906.light.Parent then
			v_u_5:Create(v_u_906.light, TweenInfo.new(2), {
				["Brightness"] = 0
			}):Play()
		end
		local v_u_909 = v_u_906.fade
		task.spawn(function()
			-- upvalues: (copy) v_u_909, (copy) v_u_906
			for v910 = 1, 25 do
				local v911 = NumberSequence.new
				local v912 = 0.55 + 0.4 * v_u_909 + (1 - (0.55 + 0.4 * v_u_909)) * v910 / 25
				local v913 = v911((math.min(1, v912)))
				for _, v914 in v_u_906.beams do
					if not v914.Parent then
						continue
					end
					v914.Transparency = v913
				end
				task.wait(0.2)
			end
			for _, v915 in v_u_906.beams do
				v915.Enabled = false
			end
		end)
		task.delay(13, function()
			-- upvalues: (copy) v_u_906
			if v_u_906.folder.Parent then
				v_u_906.folder:Destroy()
			end
		end)
	end
end
local function v_u_927(p_u_917, p918) -- name: flareBurst
	-- upvalues: (copy) v_u_904, (copy) v_u_27, (copy) v_u_876, (copy) v_u_877, (copy) v_u_5, (copy) v_u_878
	if not p_u_917.done then
		p_u_917.done = true
		p_u_917.tBurst = workspace:GetServerTimeNow()
		v_u_904(p_u_917, p918)
		p_u_917.head.CFrame = CFrame.new(p918)
		local v919 = v_u_27
		local v920 = p_u_917.head
		local v921 = {
			["tex"] = "rbxasset://textures/particles/smoke_main.dds",
			["color"] = nil,
			["size"] = nil,
			["trans"] = nil,
			["life"] = nil,
			["speed"] = nil,
			["spread"] = nil,
			["drag"] = 0.8,
			["accel"] = Vector3.new(0, 1.2, 0),
			["lightInf"] = 0.3,
			["light"] = 0.4
		}
		local v922 = v_u_876
		local v923 = v_u_877
		v921.color = ColorSequence.new(v922, v923 or v922)
		v921.size = NumberSequence.new(2, 9)
		v921.trans = NumberSequence.new(0.15, 1)
		v921.life = NumberRange.new(3, 5)
		v921.speed = NumberRange.new(1, 3)
		v921.spread = Vector2.new(180, 180)
		local v924 = v919(v920, v921)
		v924.Rate = 12
		v924.Enabled = true
		local v925 = p_u_917.burn
		table.insert(v925, v924)
		p_u_917.light.Range = 60
		p_u_917.light.Brightness = 4
		task.delay(18, function()
			-- upvalues: (copy) p_u_917, (ref) v_u_5
			for _, v926 in p_u_917.burn do
				v926.Enabled = false
			end
			if p_u_917.light.Parent then
				v_u_5:Create(p_u_917.light, TweenInfo.new(2), {
					["Brightness"] = 0
				}):Play()
			end
		end)
		task.delay(6, function()
			-- upvalues: (ref) v_u_878, (copy) p_u_917
			if v_u_878[p_u_917.id] == p_u_917 and not p_u_917.untilT then
				p_u_917.untilT = p_u_917.tBurst + 20
			end
		end)
	end
end
local function v_u_945() -- name: stepFlares
	-- upvalues: (copy) v_u_878, (copy) v_u_11, (copy) v_u_880, (copy) v_u_904, (copy) v_u_927, (copy) v_u_888, (copy) v_u_916, (ref) v_u_879
	local v928 = workspace:GetServerTimeNow()
	local v929 = false
	for v930, v931 in v_u_878 do
		v929 = true
		if v931.done then
			if not v931.untilT then
				continue
			end
			local v932 = v928 - v931.tBurst
			local v933 = v931.untilT - v931.tBurst
			local v934 = v932 / math.max(1, v933)
			local v935 = math.clamp(v934, 0, 1)
			if v935 - v931.fade > 0.03 then
				v931.fade = v935
				local v936 = v_u_888(v935)
				for _, v937 in v931.smoke do
					v937.Rate = (1 - v935 * 0.7) * 1.3
					v937.Transparency = v936
				end
				local v938 = NumberSequence.new(v935 * 0.4 + 0.55)
				for _, v939 in v931.beams do
					v939.Transparency = v938
				end
			end
			if v931.untilT > v928 then
				continue
			end
			v_u_916(v930)
		else
			local v940 = v928 - v931.t0
			local v941 = v931.maxT
			local v942 = math.clamp(v940, 0, v941)
			local v943 = v_u_11.position(v931.origin, v931.dir, v931.v0, v931.drag, v942)
			local v944
			if (v943 - v931.lastPt).Magnitude > 0.001 then
				v944 = workspace:Raycast(v931.lastPt, v943 - v931.lastPt, v_u_880) or nil
			else
				v944 = nil
			end
			if v944 then
				v943 = v944.Position
			end
			if v931.finalPos and (v943 - v931.origin).Magnitude >= (v931.finalPos - v931.origin).Magnitude then
				v943 = v931.finalPos
			end
			v_u_904(v931, v943)
			v931.head.CFrame = CFrame.new(v943)
			if not v944 and (v931.maxT > v942 and v943 ~= v931.finalPos) then
				continue
			end
			v_u_927(v931, v931.finalPos or v943)
		end
	end
	if not v929 and v_u_879 then
		v_u_879:Disconnect()
		v_u_879 = nil
	end
end
local function v_u_958(p946, p947) -- name: newFlare
	-- upvalues: (ref) v_u_18, (copy) v_u_27, (copy) v_u_878, (copy) v_u_898, (ref) v_u_879, (copy) v_u_2, (copy) v_u_945
	local v948 = Instance.new("Folder")
	v948.Name = "FlareTrail"
	v948.Parent = v_u_18
	local v949 = Instance.new("Part")
	v949.Name = "FlareTrailHost"
	v949.Anchored = true
	v949.CanCollide = false
	v949.CanQuery = false
	v949.CanTouch = false
	v949.Transparency = 1
	v949.Size = Vector3.new(0.2, 0.2, 0.2)
	v949.CFrame = CFrame.new(p947)
	v949.Parent = v_u_18
	v949.Parent = v948
	local v950 = Instance.new("Part")
	v950.Name = "FlareHead"
	v950.Anchored = true
	v950.CanCollide = false
	v950.CanQuery = false
	v950.CanTouch = false
	v950.Transparency = 1
	v950.Size = Vector3.new(0.2, 0.2, 0.2)
	v950.CFrame = CFrame.new(p947)
	v950.Parent = v_u_18
	v950.Parent = v948
	local v951 = Instance.new("PointLight")
	v951.Color = Color3.fromRGB(255, 40, 30)
	v951.Range = 30
	v951.Brightness = 3
	v951.Shadows = false
	v951.Parent = v950
	local v952 = v_u_27
	local v953 = {
		["tex"] = "rbxasset://textures/particles/sparkles_main.dds",
		["color"] = nil,
		["size"] = nil,
		["trans"] = nil,
		["life"] = nil,
		["speed"] = nil,
		["spread"] = nil,
		["light"] = 1,
		["lightInf"] = 0
	}
	local v954, v955 = Color3.fromRGB(255, 120, 80)
	v953.color = ColorSequence.new(v954, v955 or v954)
	v953.size = NumberSequence.new(1.2, 0.2)
	v953.trans = NumberSequence.new(0, 1)
	v953.life = NumberRange.new(0.3, 0.6)
	v953.speed = NumberRange.new(4, 8)
	v953.spread = Vector2.new(180, 180)
	local v956 = v952(v950, v953)
	v956.Rate = 25
	v956.Enabled = true
	local v957 = {
		["id"] = nil,
		["folder"] = nil,
		["holder"] = nil,
		["head"] = nil,
		["light"] = nil,
		["smoke"] = nil,
		["burn"] = nil,
		["beams"] = nil,
		["lastPt"] = nil,
		["carry"] = 0,
		["fade"] = 0,
		["done"] = false,
		["id"] = p946,
		["folder"] = v948,
		["holder"] = v949,
		["head"] = v950,
		["light"] = v951,
		["smoke"] = {},
		["burn"] = { v956 },
		["beams"] = {},
		["lastPt"] = p947
	}
	v_u_878[p946] = v957
	v_u_898(v957, p947)
	if not v_u_879 then
		v_u_879 = v_u_2.Heartbeat:Connect(v_u_945)
	end
	return v957
end
local function v_u_969(p959) -- name: flareLaunch
	-- upvalues: (copy) v_u_878, (copy) v_u_958, (copy) v_u_880, (ref) v_u_18
	local v960 = p959.id
	local v961 = tonumber(v960)
	if v961 and not v_u_878[v961] then
		local v962 = p959.origin
		if typeof(v962) == "Vector3" then
			local v963 = p959.dir
			if typeof(v963) == "Vector3" then
				local v964 = v_u_958(v961, p959.origin)
				v964.origin = p959.origin
				v964.dir = p959.dir.Magnitude > 0.001 and (p959.dir.Unit or Vector3.new(0, 1, 0)) or Vector3.new(0, 1, 0)
				local v965 = p959.v0
				v964.v0 = tonumber(v965) or 120
				local v966 = p959.drag
				v964.drag = tonumber(v966) or 0.2
				local v967 = p959.t0
				v964.t0 = tonumber(v967) or workspace:GetServerTimeNow()
				local v968 = p959.maxT
				v964.maxT = tonumber(v968) or 2.5
				v_u_880.FilterDescendantsInstances = {
					v_u_18,
					workspace:FindFirstChild("Live"),
					workspace:FindFirstChild("Loot"),
					workspace:FindFirstChild("Projectiles")
				}
				return
			end
		end
	end
end
local function v_u_985(p970) -- name: flareTrail
	-- upvalues: (copy) v_u_878, (copy) v_u_958, (copy) v_u_904, (copy) v_u_927
	local v971 = p970.id
	local v972 = tonumber(v971) or -math.random(1, 1000000000)
	local v973 = p970.untilT
	local v974 = tonumber(v973)
	if not v974 then
		local v975 = p970.life
		if tonumber(v975) then
			local v976 = workspace:GetServerTimeNow()
			local v977 = p970.life
			v974 = v976 + tonumber(v977) or nil
		else
			v974 = nil
		end
	end
	local v978 = v_u_878[v972]
	if v978 then
		v978.finalPos = p970.pos
		v978.untilT = v974 or v978.untilT
	else
		local v979 = {}
		local v980 = p970.path
		if type(v980) == "table" then
			for _, v981 in p970.path do
				if typeof(v981) ~= "Vector3" then
					continue
				end
				table.insert(v979, v981)
			end
		end
		local v982 = #v979 == 0 and { p970.pos } or v979
		local v983 = v_u_958(v972, v982[1])
		for v984 = 2, #v982 do
			v_u_904(v983, v982[v984])
		end
		v_u_927(v983, p970.pos)
		v983.untilT = v974 or v983.tBurst + 20
	end
end
local function v_u_1022(p_u_986) -- name: onFx
	-- upvalues: (copy) v_u_862, (copy) v_u_804, (copy) v_u_838, (copy) v_u_13, (copy) v_u_370, (copy) v_u_120, (copy) v_u_16, (copy) v_u_8, (copy) v_u_3, (copy) v_u_14, (copy) v_u_600, (copy) v_u_969, (copy) v_u_985, (copy) v_u_916
	if type(p_u_986) ~= "table" then
		return
	end
	local v987 = p_u_986.kind
	if type(v987) ~= "string" then
		return
	end
	local v988 = p_u_986.kind
	if v988 == "Explosion" then
		local v989 = p_u_986.pos
		if typeof(v989) == "Vector3" then
			v_u_862(p_u_986)
			return
		end
	end
	if v988 == "Smoke" then
		local v990 = p_u_986.pos
		if typeof(v990) == "Vector3" then
			v_u_804(p_u_986)
			return
		end
	end
	if v988 == "Fire" then
		local v991 = p_u_986.pos
		if typeof(v991) == "Vector3" then
			v_u_838(p_u_986)
			return
		end
	end
	if v988 == "FireEnd" then
		local v992 = p_u_986.id
		if type(v992) == "number" then
			v_u_13.endFire(p_u_986.id)
			return
		end
	end
	if v988 == "Flash" then
		local v993 = p_u_986.duration
		if type(v993) == "number" then
			v_u_13.blind(p_u_986.duration, p_u_986.direct == true)
			return
		end
	end
	if v988 == "FlashBang" then
		local v994 = p_u_986.pos
		if typeof(v994) == "Vector3" then
			v_u_370(p_u_986.pos, 6)
			v_u_120("Flash", CFrame.new(p_u_986.pos), 4)
			local v995 = workspace.CurrentCamera
			local v996 = v995 and ((v995.CFrame.Position - p_u_986.pos).Magnitude or 0) or 0
			task.delay(v996 / v_u_16, function()
				-- upvalues: (ref) v_u_13, (copy) p_u_986, (ref) v_u_8
				v_u_13.play3D("FlashBang", p_u_986.pos, {
					["volume"] = 1,
					["min"] = 20,
					["max"] = nil,
					["prio"] = 4,
					["max"] = v_u_8.m(250)
				})
			end)
			return
		end
	end
	if v988 == "Shatter" then
		local v997 = p_u_986.pos
		if typeof(v997) == "Vector3" then
			v_u_120("Glass", CFrame.new(p_u_986.pos), 1.5)
			v_u_13.play3D("MolotovBreak", p_u_986.pos, {
				["volume"] = 0.9,
				["min"] = 8,
				["max"] = 120,
				["prio"] = 2
			})
			return
		end
	end
	if v988 == "Glass" then
		local v998 = p_u_986.pos
		if typeof(v998) == "Vector3" then
			v_u_120("GlassBreak", CFrame.new(p_u_986.pos), 1)
			local v999 = require
			local v1000 = script.Parent
			local v1001, v1002 = pcall(v999, v1000:FindFirstChild("AudioController"))
			local v1003 = require
			local v1004 = v_u_3.Shared.Config.GameConfig
			local v1005, v1006 = pcall(v1003, v1004)
			if v1001 and (type(v1002) == "table" and (v1002.playAt and (v1005 and (v1006.Sounds and v1006.Sounds.GlassBreak)))) then
				v1002.playAt(v1006.Sounds.GlassBreak, p_u_986.pos, 0.9, 160)
			else
				v_u_13.play3D("GlassBreak", p_u_986.pos, {
					["volume"] = 0.9,
					["min"] = 8,
					["max"] = 150,
					["prio"] = 2
				})
			end
		end
	end
	if v988 == "Ricochet" then
		local v1007 = p_u_986.pos
		if typeof(v1007) == "Vector3" then
			v_u_120("Sparks", CFrame.new(p_u_986.pos), 1.5)
			v_u_13.play3D("PanHit", p_u_986.pos, {
				["volume"] = 1,
				["min"] = 8,
				["max"] = 120,
				["prio"] = 3
			})
			return
		end
	end
	local v1008, v1009, v1010, v1011, v1012, v1013, v1014, v1015, v1016, v1017, v1018, v1019
	if v988 == "MeleeSwing" then
		local v1020 = p_u_986.pos
		if typeof(v1020) == "Vector3" then
			if p_u_986.shooter ~= v_u_14.Character then
				local v1021 = v_u_13.meleeSound(p_u_986.weapon, "swing")
				v_u_13.play3D(v1021.id, p_u_986.pos, {
					["volume"] = nil,
					["speed"] = nil,
					["min"] = 4,
					["max"] = 40,
					["prio"] = 1,
					["volume"] = v1021.vol,
					["speed"] = v1021.speed
				})
				return
			end
			return
		end
		if v988 ~= "MeleeHit" then
			if v988 == "FlareLaunch" then
				v_u_969(p_u_986)
				return
			end
			if v988 == "Flare" then
				v1008 = p_u_986.pos
				if typeof(v1008) == "Vector3" then
					v_u_985(p_u_986)
					return
				end
			end
			if v988 == "FlareEnd" then
				v1009 = v_u_916
				v1010 = p_u_986.id
				v1009((tonumber(v1010)))
			end
			return
		end
		v1011 = p_u_986.pos
		if typeof(v1011) == "Vector3" then
			v1012 = v_u_13.meleeSound(p_u_986.weapon, p_u_986.flesh and "flesh" or "surface")
			v_u_13.play3D(v1012.id, p_u_986.pos, {
				["volume"] = nil,
				["speed"] = nil,
				["min"] = 5,
				["max"] = 60,
				["prio"] = 2,
				["volume"] = v1012.vol,
				["speed"] = v1012.speed
			})
			if p_u_986.flesh then
				v1013 = p_u_986.weapon == "Punch" and true or p_u_986.weapon == "Kick"
				v1014 = p_u_986.victim
				if typeof(v1014) == "Instance" then
					v1015 = p_u_986.victim or nil
				else
					v1015 = nil
				end
				v1016 = v_u_13.blood
				v1017 = p_u_986.pos
				v1018 = p_u_986.dir
				if typeof(v1018) == "Vector3" then
					v1019 = p_u_986.dir or nil
				else
					v1019 = nil
				end
				v1016(v1017, v1019, {
					["victim"] = nil,
					["scale"] = nil,
					["sound"] = false,
					["victim"] = v1015,
					["scale"] = v1013 and 0.45 or 0.85
				})
				if v1015 and (v1015:IsA("Model") and p_u_986.shooter ~= v_u_14.Character) then
					v_u_600(v1015)
					return
				end
			end
			return
		end
		if v988 == "FlareLaunch" then
			v_u_969(p_u_986)
			return
		end
		if v988 == "Flare" then
			v1008 = p_u_986.pos
			if typeof(v1008) == "Vector3" then
				v_u_985(p_u_986)
				return
			end
		end
		if v988 == "FlareEnd" then
			v1009 = v_u_916
			v1010 = p_u_986.id
			v1009((tonumber(v1010)))
		end
	else
		if v988 ~= "MeleeHit" then
			if v988 == "FlareLaunch" then
				v_u_969(p_u_986)
				return
			end
			if v988 == "Flare" then
				v1008 = p_u_986.pos
				if typeof(v1008) == "Vector3" then
					v_u_985(p_u_986)
					return
				end
			end
			if v988 == "FlareEnd" then
				v1009 = v_u_916
				v1010 = p_u_986.id
				v1009((tonumber(v1010)))
			end
			return
		end
		v1011 = p_u_986.pos
		if typeof(v1011) == "Vector3" then
			v1012 = v_u_13.meleeSound(p_u_986.weapon, p_u_986.flesh and "flesh" or "surface")
			v_u_13.play3D(v1012.id, p_u_986.pos, {
				["volume"] = nil,
				["speed"] = nil,
				["min"] = 5,
				["max"] = 60,
				["prio"] = 2,
				["volume"] = v1012.vol,
				["speed"] = v1012.speed
			})
			if p_u_986.flesh then
				v1013 = p_u_986.weapon == "Punch" and true or p_u_986.weapon == "Kick"
				v1014 = p_u_986.victim
				if typeof(v1014) == "Instance" then
					v1015 = p_u_986.victim or nil
				else
					v1015 = nil
				end
				v1016 = v_u_13.blood
				v1017 = p_u_986.pos
				v1018 = p_u_986.dir
				if typeof(v1018) == "Vector3" then
					v1019 = p_u_986.dir or nil
				else
					v1019 = nil
				end
				v1016(v1017, v1019, {
					["victim"] = nil,
					["scale"] = nil,
					["sound"] = false,
					["victim"] = v1015,
					["scale"] = v1013 and 0.45 or 0.85
				})
				if v1015 and (v1015:IsA("Model") and p_u_986.shooter ~= v_u_14.Character) then
					v_u_600(v1015)
					return
				end
			end
			return
		end
		if v988 == "FlareLaunch" then
			v_u_969(p_u_986)
			return
		end
		if v988 == "Flare" then
			v1008 = p_u_986.pos
			if typeof(v1008) == "Vector3" then
				v_u_985(p_u_986)
				return
			end
		end
		if v988 == "FlareEnd" then
			v1009 = v_u_916
			v1010 = p_u_986.id
			v1009((tonumber(v1010)))
		end
	end
end
function v_u_13.init() -- name: init
	-- upvalues: (ref) v_u_18, (ref) v_u_124, (copy) v_u_358, (ref) v_u_632, (ref) v_u_541, (copy) v_u_6, (copy) v_u_10, (copy) v_u_588, (copy) v_u_107, (copy) v_u_169, (copy) v_u_281, (copy) v_u_519, (copy) v_u_545, (copy) v_u_613, (copy) v_u_621
	v_u_18 = workspace:FindFirstChild("FX")
	if not v_u_18 then
		v_u_18 = Instance.new("Folder")
		v_u_18.Name = "FX"
		v_u_18.Parent = workspace
	end
	local v1023 = Instance.new("Part")
	v1023.Name = "CombatFxHost"
	v1023.Anchored = true
	v1023.CanCollide = false
	v1023.CanQuery = false
	v1023.CanTouch = false
	v1023.Transparency = 1
	v1023.Size = Vector3.new(0.2, 0.2, 0.2)
	v1023.CFrame = CFrame.new(Vector3.new(0, 0, 0))
	v1023.Parent = v_u_18
	v_u_124 = v1023
	for v1024 = 1, 3 do
		local v1025 = Instance.new("Part")
		v1025.Name = "CombatFxLight"
		v1025.Anchored = true
		v1025.CanCollide = false
		v1025.CanQuery = false
		v1025.CanTouch = false
		v1025.Transparency = 1
		v1025.Size = Vector3.new(0.2, 0.2, 0.2)
		v1025.CFrame = CFrame.new(Vector3.new(0, -10000, 0))
		v1025.Parent = v_u_18
		local v1026 = Instance.new("PointLight")
		v1026.Color = Color3.fromRGB(255, 190, 120)
		v1026.Shadows = false
		v1026.Enabled = false
		v1026.Parent = v1025
		v_u_358[v1024] = {
			["part"] = nil,
			["light"] = nil,
			["off"] = 0,
			["part"] = v1025,
			["light"] = v1026
		}
	end
	local v1027 = Instance.new("Attachment")
	v1027.Name = "WorldMuzzle"
	v1027.Parent = v_u_124
	v_u_632 = v1027
	v_u_541 = v_u_6.local_("MinimapNoise")
	local v1028 = v_u_10.Body or {}
	local v1029 = v1028.Hurt
	for _, v1030 in type(v1029) == "table" and v1028.Hurt or {} do
		if type(v1030) ~= "number" or v1030 <= 0 then
			continue
		end
		local v1031 = v_u_588
		local v1032 = "rbxassetid://" .. v1030
		table.insert(v1031, v1032)
	end
	v_u_107()
	v_u_169()
	v_u_281()
	v_u_519()
	v_u_545()
	v_u_613.FilterDescendantsInstances = v_u_621(nil)
end
function v_u_13.start() -- name: start
	-- upvalues: (ref) v_u_540, (copy) v_u_158, (copy) v_u_159, (copy) v_u_257, (copy) v_u_256, (copy) v_u_10, (copy) v_u_188, (copy) v_u_15, (copy) v_u_265, (copy) v_u_6, (copy) v_u_709, (copy) v_u_612, (copy) v_u_1022, (copy) v_u_2, (copy) v_u_771, (copy) v_u_3
	local v1033 = script.Parent:FindFirstChild("AudioController")
	if v1033 then
		local v1034 = require
		local v1035, v1036 = pcall(v1034, v1033)
		local v1037
		if v1035 and type(v1036) == "table" then
			local v1038 = v1036.getGroup
			v1037 = type(v1038) == "function" and v1036.getGroup("Effects") or nil
		else
			v1037 = nil
		end
		if v1037 then
			v_u_540 = v1037
			for _, v1039 in v_u_158 do
				v1039.s.SoundGroup = v1037
			end
			for _, v1040 in v_u_159 do
				v1040.s.SoundGroup = v1037
			end
			for _, v1041 in v_u_257 do
				for _, v1042 in v1041.near do
					v1042.SoundGroup = v1037
				end
				for _, v1043 in v1041.far do
					v1043.SoundGroup = v1037
				end
			end
			for _, v1044 in v_u_256 do
				for _, v1045 in v1044.list do
					v1045.SoundGroup = v1037
				end
			end
		end
	end
	for _, v1046 in v_u_10.ReloadClicks or {} do
		if type(v1046) ~= "number" or v1046 <= 0 then
			continue
		end
		v_u_188(v1046)
	end
	for _, v1047 in v_u_10.ReloadKits or {} do
		for _, v1048 in v1047 do
			if type(v1048) ~= "number" or v1048 <= 0 then
				continue
			end
			v_u_188(v1048)
		end
	end
	for v1049, v1050 in v_u_10.Weapons do
		if type(v1049) ~= "string" or string.sub(v1049, 1, 5) ~= "Shot_" then
			continue
		end
		for _, v1052 in type(v1050) == "table" and v1050 and v1050 or { v1050 } do
			local v1052
			if type(v1052) == "table" then
				v1052 = v1052[v_u_15:NextInteger(1, #v1052)]
			end
			if type(v1052) == "number" then
				v1052 = "rbxassetid://" .. v1052
			elseif type(v1052) ~= "string" then
				v1052 = nil
			end
			if not v1052 then
				continue
			end
			v_u_265(v1052, v1049 == "Shot_Distant" and 6 or 10)
		end
	end
	for _, v1053 in v_u_10.Guns or {} do
		for _, v1054 in { "Shot", "Supp" } do
			local v1055 = v1053[v1054]
			if v1055 then
				v1055 = v1053[v1054]
				if type(v1055) == "table" then
					v1055 = v1055[v_u_15:NextInteger(1, #v1055)]
				end
				if type(v1055) == "number" then
					v1055 = "rbxassetid://" .. v1055
				elseif type(v1055) ~= "string" then
					v1055 = nil
				end
			end
			if not v1055 then
				continue
			end
			v_u_265(v1055, 10)
		end
		local v1056 = v1053.Burst
		if v1056 then
			v1056 = v1053.Burst
			if type(v1056) == "table" then
				v1056 = v1056[v_u_15:NextInteger(1, #v1056)]
			end
			if type(v1056) == "number" then
				v1056 = "rbxassetid://" .. v1056
			elseif type(v1056) ~= "string" then
				v1056 = nil
			end
		end
		if not v1056 then
			break
		end
		v_u_265(v1056, 4)
	end
	v_u_6.unreliable("ShotFx").OnClientEvent:Connect(v_u_709)
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_612
		v_u_6.unreliable("HitFx").OnClientEvent:Connect(v_u_612)
	end)
	v_u_6.event("CombatFx").OnClientEvent:Connect(v_u_1022)
	v_u_2.Heartbeat:Connect(v_u_771)
	task.spawn(function()
		-- upvalues: (ref) v_u_3
		local v_u_1057 = {}
		local v1058 = v_u_3:FindFirstChild("Assets")
		if v1058 then
			v1058 = v1058:FindFirstChild("Sounds")
		end
		if v1058 then
			v1058 = v1058:FindFirstChild("Weapons")
		end
		if v1058 then
			for _, v1059 in v1058:GetDescendants() do
				if not v1059:IsA("Sound") then
					continue
				end
				table.insert(v_u_1057, v1059)
			end
			pcall(function()
				-- upvalues: (copy) v_u_1057
				game:GetService("ContentProvider"):PreloadAsync(v_u_1057)
			end)
		end
	end)
end
return v_u_13