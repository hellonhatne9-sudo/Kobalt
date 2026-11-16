-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ShellFx

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("SoundService")
local v_u_5 = require(v3.Shared.Util.Units)
local v_u_6 = require(v3.Shared.Config.WeaponConfig)
local v_u_7 = require(v3.Shared.Config.AudioConfig)
local v_u_8 = {}
local v_u_9 = v1.LocalPlayer
local v_u_10 = Random.new()
local v_u_11 = v_u_5.Gravity
local v_u_12 = v_u_5.m(50)
local v_u_13 = v_u_5.WeaponStudsPerMeter / 1000
local v_u_14 = v_u_13 * require(script.Parent.ViewmodelController.Pose).SCALE
local v_u_15 = CFrame.new(0, -10000, 0)
local v_u_16 = Color3.fromRGB(205, 163, 82)
local v_u_17 = {
	["9mm"] = {
		["len"] = 19,
		["dia"] = 9.9
	},
	["45"] = {
		["len"] = 23,
		["dia"] = 12
	},
	["556"] = {
		["len"] = 45,
		["dia"] = 9.6,
		["neck"] = 6.4,
		["neckLen"] = 0.2
	},
	["762"] = {
		["len"] = 51,
		["dia"] = 11.9,
		["neck"] = 8.6,
		["neckLen"] = 0.2
	},
	["300"] = {
		["len"] = 67,
		["dia"] = 13.5,
		["neck"] = 8.4,
		["neckLen"] = 0.16
	},
	["57"] = {
		["len"] = 29,
		["dia"] = 7.9,
		["neck"] = 6.3,
		["neckLen"] = 0.25
	},
	["50"] = {
		["len"] = 99,
		["dia"] = 20.4,
		["neck"] = 14,
		["neckLen"] = 0.2
	},
	["12g"] = {
		["len"] = 70,
		["dia"] = 20.5,
		["hull"] = nil,
		["capLen"] = 0.22,
		["hull"] = Color3.fromRGB(168, 30, 26)
	},
	["flare"] = {
		["len"] = 60,
		["dia"] = 26.5,
		["hull"] = nil,
		["capLen"] = 0.18,
		["hull"] = Color3.fromRGB(214, 96, 34)
	}
}
v_u_8.Kinds = v_u_17
local v_u_18 = {
	["Ammo_9mm"] = "9mm",
	["Ammo_45"] = "45",
	["Ammo_556"] = "556",
	["Ammo_762"] = "762",
	["Ammo_300"] = "300",
	["Ammo_57"] = "57",
	["Ammo_12g"] = "12g",
	["Ammo_50"] = "50",
	["FlareRound"] = "flare"
}
local v_u_19 = {
	["S686"] = true,
	["SawedOff"] = true,
	["R1895"] = true,
	["Crossbow"] = true,
	["Panzerfaust"] = true,
	["FlareGun"] = true
}
function v_u_8.kindFor(p20) -- name: kindFor
	-- upvalues: (copy) v_u_6, (copy) v_u_18
	local v21
	if type(p20) == "table" then
		local _ = p20.id
		v21 = v_u_6.Weapons[p20.id or ""]
	elseif type(p20) == "string" then
		v21 = v_u_6.Weapons[p20]
		p20 = nil
	else
		v21 = nil
		p20 = nil
	end
	if v21 then
		local v22 = v21.ShellKind
		if type(v22) == "string" then
			return v21.ShellKind
		end
	end
	local v23 = p20 and p20.ammo
	if v23 then
		v21 = v23
	elseif v21 then
		v21 = v21.Ammo
	end
	return v_u_18[v21 or ""]
end
function v_u_8.ejectsOnFire(p24) -- name: ejectsOnFire
	-- upvalues: (copy) v_u_6, (copy) v_u_19, (copy) v_u_8
	local v25, v26, v27
	if type(p24) == "table" then
		v25 = p24.id
		v26 = v_u_6.Weapons[p24.id or ""]
		v27 = p24
	elseif type(p24) == "string" then
		v26 = v_u_6.Weapons[p24]
		v25 = p24
		v27 = nil
	else
		v25 = nil
		v27 = nil
		v26 = nil
	end
	if v25 and not v_u_19[v25] then
		local v28 = v27 and v27.boltAction
		if not v28 then
			if v26 then
				v28 = v26.BoltAction == true
			else
				v28 = v26
			end
		end
		local v29 = v27 and v27.pumpEvery
		if v29 then
			v26 = v29
		elseif v26 then
			v26 = v26.PumpEvery
		end
		if v28 or v26 then
			return false
		else
			return v_u_8.kindFor(p24) ~= nil
		end
	else
		return false
	end
end
function v_u_8.actionDelay(p30) -- name: actionDelay
	-- upvalues: (copy) v_u_6, (copy) v_u_19, (copy) v_u_8
	local v31, v32, v33
	if type(p30) == "table" then
		v31 = p30.id
		v32 = v_u_6.Weapons[p30.id or ""]
		v33 = p30
	elseif type(p30) == "string" then
		v32 = v_u_6.Weapons[p30]
		v31 = p30
		v33 = nil
	else
		v31 = nil
		v33 = nil
		v32 = nil
	end
	if not v31 or (v_u_19[v31] or v_u_8.kindFor(p30) == nil) then
		return nil
	end
	local v34 = v33 and v33.tbs or (v32 and (v32.TBS or 1) or 1)
	local v35 = v33 and v33.boltAction
	if not v35 then
		if v32 then
			v35 = v32.BoltAction == true
		else
			v35 = v32
		end
	end
	if v35 then
		local v36 = v34 * 0.3
		return math.min(0.25, v36) + v34 * 0.35
	end
	local v37 = v33 and v33.pumpEvery
	if not v37 then
		if v32 then
			v37 = v32.PumpEvery
		else
			v37 = v32
		end
	end
	return not v37 and 0 or 0.15 + (v33 and v33.pumpTime or (v32 and v32.PumpTime or 0.45)) * 0.4
end
local v_u_38 = nil
local v_u_39 = RaycastParams.new()
v_u_39.FilterType = Enum.RaycastFilterType.Exclude
v_u_39.IgnoreWater = false
local function v_u_45() -- name: refreshParams
	-- upvalues: (ref) v_u_38, (copy) v_u_9, (copy) v_u_39
	local v40 = { v_u_38 }
	for _, v41 in {
		"Live",
		"Loot",
		"Projectiles",
		"FX",
		"AudioEmitters"
	} do
		local v42 = workspace:FindFirstChild(v41)
		if not v42 then
			continue
		end
		table.insert(v40, v42)
	end
	local v43 = workspace.CurrentCamera
	if v43 then
		table.insert(v40, v43)
	end
	if v_u_9.Character then
		local v44 = v_u_9.Character
		table.insert(v40, v44)
	end
	v_u_39.FilterDescendantsInstances = v40
end
local v_u_46 = v_u_38
local v_u_47 = {}
local v_u_48 = 0
local v_u_49 = {}
local v_u_50 = -10
local v_u_51 = -10
for _, v52 in {
	"Metal",
	"DiamondPlate",
	"CorrodedMetal",
	"Foil"
} do
	v_u_47[v52] = "Metal"
end
for _, v53 in { "Wood", "WoodPlanks" } do
	v_u_47[v53] = "Wood"
end
for _, v54 in {
	"Grass",
	"LeafyGrass",
	"Ground",
	"Sand",
	"Mud",
	"Snow",
	"Fabric",
	"Carpet",
	"Glacier"
} do
	v_u_47[v54] = "Soft"
end
local v_u_55 = {
	["Hard"] = {
		["vol"] = 0.5,
		["speed"] = 1
	},
	["Metal"] = {
		["vol"] = 0.6,
		["speed"] = 1.12
	},
	["Wood"] = {
		["vol"] = 0.42,
		["speed"] = 0.8
	},
	["Soft"] = {
		["vol"] = 0.3,
		["speed"] = 0.72
	}
}
local v_u_56 = {}
local v_u_57 = 0
local v_u_58 = nil
local function v_u_62(p59) -- name: soundIds
	-- upvalues: (copy) v_u_7
	local v60 = v_u_7.Shells or {}
	local v61 = p59 and v60.Hull or (v60.Brass or { v_u_7.Weapons and v_u_7.Weapons.ShellDrop or 9113631210 })
	return type(v61) ~= "table" and { v61 } or v61
end
local function v_u_77(p63, p64, p65, p66) -- name: tink
	-- upvalues: (copy) v_u_56, (copy) v_u_47, (copy) v_u_55, (copy) v_u_62, (copy) v_u_10, (ref) v_u_57, (ref) v_u_58
	if #v_u_56 == 0 then
		return
	else
		local v67 = workspace.CurrentCamera
		if (v67 and ((v67.CFrame.Position - p64).Magnitude or 0) or 0) <= (p63.fpp and 40 or 32) then
			local v68 = v_u_47[p65.Name] or "Hard"
			local v69 = v_u_55[v68]
			local v70 = v_u_62(p63.hull)
			local v71 = v70[v_u_10:NextInteger(1, #v70)]
			v_u_57 = v_u_57 % #v_u_56 + 1
			local v72 = v_u_56[v_u_57]
			local v73 = v72.s
			v73:Stop()
			v72.att.WorldPosition = p64
			local v74 = "rbxassetid://" .. tostring(v71)
			if v73.SoundId ~= v74 then
				v73.SoundId = v74
			end
			local v75 = p66 / 14
			local v76 = math.clamp(v75, 0.35, 1) * (p63.bounces >= 2 and 0.55 or 1)
			v73.Volume = v69.vol * v76 * (p63.hull and 0.8 or 1) * (p63.big and 1.15 or 1)
			v73.PlaybackSpeed = v69.speed * (p63.hull and 0.62 or 1) * (p63.bounces >= 2 and 1.08 or 1) * (p63.big and 0.85 or 1) * (0.94 + v_u_10:NextNumber() * 0.12)
			v73.SoundGroup = v68 == "Soft" and v_u_58 or v72.group
			v73.RollOffMinDistance = p63.fpp and 4 or 2.5
			v73.RollOffMaxDistance = 45
			v73:Play()
		end
	end
end
local function v_u_83() -- name: alloc
	-- upvalues: (copy) v_u_49
	for _, v78 in v_u_49 do
		if v78.alive then
			continue
		end
		return v78
	end
	local v79 = v_u_49[1]
	local v80 = -1
	for _, v81 in v_u_49 do
		local v82 = v81.t + (v81.rest and 100 or 0)
		if v80 >= v82 then
			continue
		end
		v79 = v81
		v80 = v82
	end
	return v79
end
local function v_u_98(p84, p85, p86) -- name: setLook
	-- upvalues: (copy) v_u_16
	local v87 = p85.len * p86
	local v88 = p85.dia * p86
	p84.r = v88 * 0.5
	p84.hull = p85.hull ~= nil
	p84.big = p85.len >= 60
	local v89 = p84.body
	local v90 = p84.aux
	if p85.hull then
		local v91 = v87 * p85.capLen
		local v92 = v87 - v91
		v89.Size = Vector3.new(v92, v88, v88)
		v89.Color = p85.hull
		v89.Material = Enum.Material.SmoothPlastic
		v89.Reflectance = 0
		local v93 = v88 * 1.04
		local v94 = v88 * 1.04
		v90.Size = Vector3.new(v91, v93, v94)
		v90.Color = v_u_16
		v90.Material = Enum.Material.Metal
		v90.Transparency = 0
		p84.bodyOff = CFrame.new(v91 * 0.5, 0, 0)
		p84.auxOff = CFrame.new(-(v87 - v91) * 0.5, 0, 0)
	elseif p85.neck then
		local v95 = v87 * p85.neckLen
		local v96 = v87 - v95
		v89.Size = Vector3.new(v96, v88, v88)
		v89.Color = v_u_16
		v89.Material = Enum.Material.Metal
		v89.Reflectance = 0.08
		local v97 = p85.neck * p86
		v90.Size = Vector3.new(v95, v97, v97)
		v90.Color = v_u_16
		v90.Material = Enum.Material.Metal
		v90.Transparency = 0
		p84.bodyOff = CFrame.new(-v95 * 0.5, 0, 0)
		p84.auxOff = CFrame.new((v87 - v95) * 0.5, 0, 0)
	else
		v89.Size = Vector3.new(v87, v88, v88)
		v89.Color = v_u_16
		v89.Material = Enum.Material.Metal
		v89.Reflectance = 0.08
		v90.Transparency = 1
		p84.bodyOff = CFrame.identity
		p84.auxOff = nil
	end
	v89.Transparency = 0
end
function v_u_8.eject(p99, p100, p101, p102) -- name: eject
	-- upvalues: (copy) v_u_49, (copy) v_u_17, (ref) v_u_51, (copy) v_u_9, (copy) v_u_12, (copy) v_u_83, (ref) v_u_48, (copy) v_u_98, (copy) v_u_14, (copy) v_u_13, (copy) v_u_10
	if typeof(p99) == "CFrame" and #v_u_49 ~= 0 then
		local v103 = v_u_17[p101 or "556"] or v_u_17["556"]
		if p102 then
			v_u_51 = os.clock()
		else
			if (v_u_9:GetAttribute("Graphics") or "High") == "Low" then
				return
			end
			local v104 = workspace.CurrentCamera
			if v104 and v_u_12 < (v104.CFrame.Position - p99.Position).Magnitude then
				return
			end
		end
		local v105 = v_u_83()
		if not v105.alive then
			v_u_48 = v_u_48 + 1
		end
		v105.alive = true
		v105.fpp = p102 == true
		v_u_98(v105, v103, p102 and v_u_14 or v_u_13)
		v105.t = 0
		v105.rest = false
		v105.placed = false
		v105.bounces = 0
		v105.wallHits = 0
		v105.pos = p99.Position
		v105.vel = (typeof(p100) ~= "Vector3" or (p100 ~= p100 or not p100)) and Vector3.new(0, 0, 0) or p100
		v105.rot = CFrame.fromMatrix(Vector3.new(0, 0, 0), p99.LookVector, p99.UpVector)
		local v106 = v_u_10:NextNumber() * 0.5 - 0.25
		local v107 = v_u_10:NextNumber() * 0.8 - 0.4
		v105.spinAxis = Vector3.new(v106, 1, v107).Unit
		v105.spin = (16 + v_u_10:NextNumber() * 16) * (v_u_10:NextNumber() < 0.5 and -1 or 1)
	end
end
function v_u_8.ejectFrom(p108, p109, p110, p111) -- name: ejectFrom
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_8
	if p108 and p108.Parent then
		local v112 = p108.WorldCFrame
		local v113 = v_u_5.ms(2.8 + v_u_10:NextNumber() * 1.4)
		local v114 = v_u_5.ms(1.4 + v_u_10:NextNumber() * 1.1)
		local v115 = v_u_5.ms(0.3 + v_u_10:NextNumber() * 0.6)
		if p109 == "12g" or p109 == "flare" then
			v113 = v113 * 0.75
			v114 = v114 * 0.8
		end
		local v116 = v112.RightVector * v113 + v112.UpVector * v114 - v112.LookVector * v115 + (p111 or Vector3.new(0, 0, 0))
		v_u_8.eject(v112, v116, p109, p110)
	end
end
function v_u_8.lastFpp() -- name: lastFpp
	-- upvalues: (ref) v_u_51
	return v_u_51
end
local function v_u_123(p117, p118) -- name: restFrame
	-- upvalues: (copy) v_u_10
	local v119 = p118.Y
	local v120 = p118:Cross(math.abs(v119) < 0.9 and Vector3.new(0, 1, 0) or Vector3.new(1, 0, 0))
	local v121 = v_u_10:NextNumber() * 3.141592653589793 * 2
	local v122 = (CFrame.fromAxisAngle(p118, v121) * v120).Unit
	return CFrame.fromMatrix(p117, v122, p118)
end
local v_u_124 = {}
local v_u_125 = {}
local function v_u_169(p126) -- name: step
	-- upvalues: (ref) v_u_48, (copy) v_u_124, (copy) v_u_125, (ref) v_u_50, (copy) v_u_45, (copy) v_u_49, (copy) v_u_15, (copy) v_u_11, (copy) v_u_39, (copy) v_u_77, (copy) v_u_10, (copy) v_u_123
	if v_u_48 > 0 then
		local v127 = math.min(p126, 0.05)
		table.clear(v_u_124)
		table.clear(v_u_125)
		if os.clock() - v_u_50 > 2 then
			v_u_50 = os.clock()
			v_u_45()
		end
		for _, v128 in v_u_49 do
			if not v128.alive then
				continue
			end
			v128.t = v128.t + v127
			if v128.t >= 4 then
				local v129 = v_u_124
				local v130 = v_u_125
				v128.alive = false
				local v131 = v_u_48 - 1
				v_u_48 = math.max(0, v131)
				local v132 = v128.body
				table.insert(v129, v132)
				local v133 = v_u_15
				table.insert(v130, v133)
				local v134 = v128.aux
				table.insert(v129, v134)
				local v135 = v_u_15
				table.insert(v130, v135)
			else
				if v128.rest then
					if not v128.placed then
						local v136 = CFrame.new(v128.pos) * v128.rot
						local v137 = v_u_124
						local v138 = v128.body
						table.insert(v137, v138)
						local v139 = v_u_125
						local v140 = v136 * v128.bodyOff
						table.insert(v139, v140)
						if v128.auxOff then
							local v141 = v_u_124
							local v142 = v128.aux
							table.insert(v141, v142)
							local v143 = v_u_125
							local v144 = v136 * v128.auxOff
							table.insert(v143, v144)
						end
						v128.placed = true
					end
				else
					local v145 = v128.vel
					local v146 = -v_u_11 * v127
					local v147 = v145 + Vector3.new(0, v146, 0)
					local v148 = v127 * 0.4
					local v149 = v147 * (1 - math.min(v148, 0.1))
					local v150 = v128.pos + v149 * v127
					local v151 = v150 - v128.pos
					local v152
					if v151.Magnitude > 0.0001 then
						v152 = workspace:Raycast(v128.pos, v151 + v151.Unit * v128.r, v_u_39)
					else
						v152 = nil
					end
					if v152 then
						if v152.Material == Enum.Material.Water then
							v128.t = 4
						else
							local v153 = v152.Normal
							local v154 = v149:Dot(v153)
							local v155 = -v154
							if v155 > 1.5 then
								v_u_77(v128, v152.Position, v152.Material, v155)
							end
							if v153.Y < 0.6 then
								v128.wallHits = (v128.wallHits or 0) + 1
								if v128.wallHits > 4 then
									v128.t = 4
								end
								v149 = (v149 - v153 * v154) * 0.35 - v153 * v154 * 0.25
								v128.spin = v128.spin * 0.6
								v150 = v152.Position + v153 * (v128.r + 0.03)
							elseif v128.bounces < 2 and v155 > 4 then
								v128.bounces = v128.bounces + 1
								v149 = (v149 - v153 * v154) * 0.55 - v153 * v154 * (0.3 + v_u_10:NextNumber() * 0.14)
								v128.spin = v128.spin * 0.55
								local v156 = v_u_10:NextNumber() - 0.5
								local v157 = v_u_10:NextNumber() - 0.5
								v128.spinAxis = Vector3.new(v156, 1, v157).Unit
								v150 = v152.Position + v153 * (v128.r + 0.005)
							else
								v128.rest = true
								v150 = v152.Position + v153 * (v128.r + 0.002)
								v128.rot = v_u_123(Vector3.new(0, 0, 0), v153)
								v149 = Vector3.new(0, 0, 0)
							end
						end
					end
					v128.vel = v149
					v128.pos = v150
					if not v128.rest then
						v128.rot = v128.rot * CFrame.fromAxisAngle(v128.spinAxis, v128.spin * v127)
					end
					local v158 = CFrame.new(v128.pos) * v128.rot
					local v159 = v_u_124
					local v160 = v128.body
					table.insert(v159, v160)
					local v161 = v_u_125
					local v162 = v158 * v128.bodyOff
					table.insert(v161, v162)
					if v128.auxOff then
						local v163 = v_u_124
						local v164 = v128.aux
						table.insert(v163, v164)
						local v165 = v_u_125
						local v166 = v158 * v128.auxOff
						table.insert(v165, v166)
					end
				end
				if v128.t <= 3.4 then
					continue
				end
				local v167 = (v128.t - 3.4) / 0.6
				local v168 = math.clamp(v167, 0, 1)
				v128.body.Transparency = v168
				if not v128.auxOff then
					continue
				end
				v128.aux.Transparency = v168
			end
		end
		if #v_u_124 > 0 then
			workspace:BulkMoveTo(v_u_124, v_u_125, Enum.BulkMoveMode.FireCFrameChanged)
		end
	end
end
function v_u_8.onMatchReset(p170) -- name: onMatchReset
	-- upvalues: (copy) v_u_124, (copy) v_u_125, (copy) v_u_49, (ref) v_u_48, (copy) v_u_15
	if p170 ~= "Character" then
		table.clear(v_u_124)
		table.clear(v_u_125)
		for _, v171 in v_u_49 do
			if not v171.alive then
				continue
			end
			local v172 = v_u_124
			local v173 = v_u_125
			v171.alive = false
			local v174 = v_u_48 - 1
			v_u_48 = math.max(0, v174)
			local v175 = v171.body
			table.insert(v172, v175)
			local v176 = v_u_15
			table.insert(v173, v176)
			local v177 = v171.aux
			table.insert(v172, v177)
			local v178 = v_u_15
			table.insert(v173, v178)
		end
		if #v_u_124 > 0 then
			workspace:BulkMoveTo(v_u_124, v_u_125, Enum.BulkMoveMode.FireCFrameChanged)
		end
		v_u_48 = 0
	end
end
function v_u_8.init() -- name: init
	-- upvalues: (ref) v_u_46, (copy) v_u_49, (copy) v_u_16, (copy) v_u_15, (copy) v_u_56, (copy) v_u_45
	local v179 = workspace:FindFirstChild("FX")
	if not v179 then
		v179 = Instance.new("Folder")
		v179.Name = "FX"
		v179.Parent = workspace
	end
	local v180 = Instance.new("Folder")
	v180.Name = "Shells"
	v180.Parent = v179
	v_u_46 = v180
	for v181 = 1, 40 do
		local v182 = v_u_49
		local v183 = {
			["body"] = nil,
			["aux"] = nil,
			["alive"] = false,
			["t"] = 0,
			["rest"] = false,
			["bounces"] = 0,
			["bodyOff"] = nil
		}
		local v184 = Instance.new("Part")
		v184.Name = "Shell"
		v184.Shape = Enum.PartType.Cylinder
		v184.Size = Vector3.new(0.2, 0.05, 0.05)
		v184.Material = Enum.Material.Metal
		v184.Color = v_u_16
		v184.Reflectance = 0.08
		v184.Anchored = true
		v184.CanCollide = false
		v184.CanQuery = false
		v184.CanTouch = false
		v184.CastShadow = false
		v184.CFrame = v_u_15
		v184.Parent = v_u_46
		v183.body = v184
		local v185 = Instance.new("Part")
		v185.Name = "ShellNeck"
		v185.Shape = Enum.PartType.Cylinder
		v185.Size = Vector3.new(0.2, 0.05, 0.05)
		v185.Material = Enum.Material.Metal
		v185.Color = v_u_16
		v185.Reflectance = 0.08
		v185.Anchored = true
		v185.CanCollide = false
		v185.CanQuery = false
		v185.CanTouch = false
		v185.CastShadow = false
		v185.CFrame = v_u_15
		v185.Parent = v_u_46
		v183.aux = v185
		v183.bodyOff = CFrame.identity
		v182[v181] = v183
	end
	local v186 = Instance.new("Part")
	v186.Name = "ShellAudio"
	v186.Anchored = true
	v186.CanCollide = false
	v186.CanQuery = false
	v186.CanTouch = false
	v186.Transparency = 1
	v186.Size = Vector3.new(0.2, 0.2, 0.2)
	v186.CFrame = CFrame.new(0, -10000, 0)
	v186.Parent = v180
	for v187 = 1, 10 do
		local v188 = Instance.new("Attachment")
		v188.Name = "Tink" .. v187
		v188.Parent = v186
		local v189 = Instance.new("Sound")
		v189.RollOffMode = Enum.RollOffMode.InverseTapered
		v189.Parent = v188
		v_u_56[v187] = {
			["att"] = nil,
			["s"] = nil,
			["group"] = nil,
			["att"] = v188,
			["s"] = v189
		}
	end
	v_u_45()
end
function v_u_8.start() -- name: start
	-- upvalues: (copy) v_u_4, (ref) v_u_58, (copy) v_u_56, (copy) v_u_62, (copy) v_u_2, (copy) v_u_169
	local v190 = script.Parent:FindFirstChild("AudioController")
	local v191, v192
	if v190 then
		local v193 = require
		v191, v192 = pcall(v193, v190)
	else
		v191 = false
		v192 = nil
	end
	local v194
	if v191 and type(v192) == "table" then
		local v195 = v192.getGroup
		v194 = type(v195) == "function" and v192.getGroup("Effects") or nil
	else
		v194 = nil
	end
	local v196 = Instance.new("SoundGroup")
	v196.Name = "ShellSoft"
	v196.Volume = 1
	local v197 = Instance.new("EqualizerSoundEffect")
	v197.HighGain = -26
	v197.MidGain = -9
	v197.LowGain = 2
	v197.Parent = v196
	v196.Parent = v194 or v_u_4
	v_u_58 = v196
	for _, v198 in v_u_56 do
		v198.group = v194
		v198.s.SoundGroup = v194
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_62
		local v_u_199 = {}
		for _, v200 in { false, true } do
			for _, v201 in v_u_62(v200) do
				local v202 = Instance.new("Sound")
				v202.SoundId = "rbxassetid://" .. tostring(v201)
				table.insert(v_u_199, v202)
			end
		end
		pcall(function()
			-- upvalues: (copy) v_u_199
			game:GetService("ContentProvider"):PreloadAsync(v_u_199)
		end)
		for _, v203 in v_u_199 do
			v203:Destroy()
		end
	end)
	v_u_2.Heartbeat:Connect(function(p204)
		-- upvalues: (ref) v_u_169
		local v205 = v_u_169
		local v206, v207 = pcall(v205, p204)
		if not v206 then
			warn("[ShellFx] " .. tostring(v207))
		end
	end)
end
return v_u_8