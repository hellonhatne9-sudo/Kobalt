-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.Ballistics

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = {
	["G"] = require(v1.Shared.Util.Units).Gravity
}
local v_u_3 = v_u_2.G
v_u_2.STEP = 0.016666666666666666
v_u_2.MAX_SEG = 0.05
function v_u_2.dist(p4, p5, p6) -- name: dist
	if p5 < 0.0001 then
		return p4 * p6
	end
	local v7 = p4 / p5
	local v8 = -p5 * p6
	return v7 * (1 - math.exp(v8))
end
function v_u_2.timeFor(p9, p10, p11) -- name: timeFor
	if p11 <= 0 then
		return 0
	elseif p10 < 0.0001 then
		return p11 / p9
	else
		local v12 = 1 - p10 * p11 / p9
		if v12 <= 1e-6 then
			return nil
		else
			return -math.log(v12) / p10
		end
	end
end
function v_u_2.maxDist(p13, p14) -- name: maxDist
	return p14 < 0.0001 and (1 / 0) or p13 / p14
end
function v_u_2.position(p15, p16, p17, p18, p19) -- name: position
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return p15 + p16 * v_u_2.dist(p17, p18, p19) + Vector3.new(0, -1, 0) * (0.5 * v_u_3 * p19 * p19)
end
function v_u_2.velocity(p20, p21, p22, p23) -- name: velocity
	-- upvalues: (copy) v_u_3
	local v24 = -p22 * p23
	return p20 * (p21 * math.exp(v24)) + Vector3.new(0, -1, 0) * (v_u_3 * p23)
end
function v_u_2.speed(p25, p26, p27) -- name: speed
	local v28 = -p26 * p27
	return p25 * math.exp(v28)
end
function v_u_2.zeroAngle(p29, p30, p31) -- name: zeroAngle
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v32 = v_u_2.timeFor(p29, p30, p31)
	if not v32 then
		return 0
	end
	local v33 = 0.5 * v_u_3 * v32 * v32
	return math.atan2(v33, p31)
end
function v_u_2.dropAngle(p34, p35, p36, p37) -- name: dropAngle
	-- upvalues: (copy) v_u_2
	return v_u_2.zeroAngle(p34, p35, p36) - v_u_2.zeroAngle(p34, p35, p37)
end
function v_u_2.elevate(p38, p39) -- name: elevate
	if math.abs(p39) < 1e-7 then
		return p38
	else
		local v40 = p38:Cross(Vector3.new(0, 1, 0))
		if v40.Magnitude < 0.0001 then
			return p38
		else
			return (CFrame.fromAxisAngle(v40.Unit, p39) * p38).Unit
		end
	end
end
function v_u_2.falloff(p41, p42) -- name: falloff
	if not p41 or #p41 == 0 then
		return 1
	end
	if p42 <= p41[1][1] then
		return p41[1][2]
	end
	for v43 = 2, #p41 do
		local v44 = p41[v43 - 1]
		local v45 = p41[v43]
		if p42 > v45[1] then
			continue
		end
		local v46 = p42 - v44[1]
		local v47 = v45[1] - v44[1]
		local v48 = v46 / math.max(v47, 1e-6)
		return v44[2] + (v45[2] - v44[2]) * v48
	end
	return p41[#p41][2]
end
function v_u_2.basis(p49) -- name: basis
	local v50 = p49.Y
	local v51 = p49:Cross(math.abs(v50) > 0.95 and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)).Unit
	return v51, v51:Cross(p49).Unit
end
function v_u_2.cone(p52, p53, p54) -- name: cone
	if p53 <= 0.00001 then
		return p52
	end
	local v55 = p53 * 0.5
	local v56 = math.rad(v55)
	local v57 = p54:NextNumber()
	local v58 = math.sqrt(v57) * math.tan(v56)
	local v59 = p54:NextNumber() * 2 * 3.141592653589793
	local v60 = p52.Y
	local v61 = p52:Cross(math.abs(v60) > 0.95 and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)).Unit
	local v62 = v61:Cross(p52).Unit
	return (p52 + v61 * (v58 * math.cos(v59)) + v62 * (v58 * math.sin(v59))).Unit
end
function v_u_2.pelletDirs(p63, p64, p65, p66, p67) -- name: pelletDirs
	if p65 <= 1 then
		return { p63 }
	end
	local v68 = Random.new(p64)
	local v69 = p63.Y
	local v70 = p63:Cross(math.abs(v69) > 0.95 and Vector3.new(1, 0, 0) or Vector3.new(0, 1, 0)).Unit
	local v71 = v70:Cross(p63).Unit
	local v72 = p66 * 0.5
	local v73 = math.rad(v72)
	local v74 = math.tan(v73)
	local v75 = p67 * 0.5
	local v76 = math.rad(v75)
	local v77 = math.tan(v76)
	local v78 = table.create(p65)
	for v79 = 1, p65 do
		local v80 = v68:NextNumber()
		local v81 = math.sqrt(v80)
		local v82 = v68:NextNumber() * 2 * 3.141592653589793
		v78[v79] = (p63 + v70 * (v81 * math.cos(v82) * v74) + v71 * (v81 * math.sin(v82) * v77)).Unit
	end
	return v78
end
function v_u_2.intercept(p83, p84, p85, p86, p87) -- name: intercept
	-- upvalues: (copy) v_u_2
	local v88 = p84
	local v89 = 0
	for _ = 1, 4 do
		local v90 = (p84 - p83).Magnitude
		v89 = v_u_2.timeFor(p86, p87, v90) or v90 / math.max(p86, 1)
		p84 = v88 + p85 * v89
	end
	return p84, v89
end
function v_u_2.aimDir(p91, p92, p93, p94) -- name: aimDir
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v95 = p92
	for _ = 1, 3 do
		local v96 = (p92 - p91).Magnitude
		local v97 = v_u_2.timeFor(p93, p94, v96)
		if not v97 then
			break
		end
		p92 = v95 - Vector3.new(0, -1, 0) * (0.5 * v_u_3 * v97 * v97)
	end
	local v98 = p92 - p91
	return v98.Magnitude < 0.0001 and Vector3.new(0, 0, 1) or v98.Unit
end
function v_u_2.closest(p99, p100, p101, p102, p103) -- name: closest
	-- upvalues: (copy) v_u_2
	local v104 = (p103 - p99):Dot(p100)
	local v105 = math.max(v104, 0)
	local v106 = v_u_2.timeFor(p101, p102, v105) or v105 / p101
	for _ = 1, 3 do
		local v107 = v_u_2.position(p99, p100, p101, p102, v106)
		local v108 = v_u_2.velocity(p100, p101, p102, v106)
		local v109 = v108:Dot(v108)
		if v109 >= 1e-6 then
			local v110 = (p103 - v107):Dot(v108) / v109
			local v111 = v106 + v110
			v106 = math.max(0, v111)
			if math.abs(v110) >= 0.0001 then
				continue
			end
		end
	end
	return v106, (v_u_2.position(p99, p100, p101, p102, v106) - p103).Magnitude
end
function v_u_2.castArc(p112, p113, p114, p115, p116, p117, p118, p119, p120) -- name: castArc
	-- upvalues: (copy) v_u_2
	local v121 = v_u_2.position(p112, p113, p114, p115, p116)
	local v122 = p116
	for v123 = 1, p118 do
		local v124 = p116 + (p117 - p116) * (v123 / p118)
		local v125 = v_u_2.position(p112, p113, p114, p115, v124)
		local v126 = v121
		local v127 = 0
		while v127 < 6 do
			v127 = v127 + 1
			local v128 = v125 - v121
			local v129 = v128.Magnitude >= 0.001 and workspace:Raycast(v121, v128, p119)
			if not v129 then
				break
			end
			if not (p120 and p120(v129.Instance)) then
				local v130 = (v129.Position - v126).Magnitude
				local v131 = (v125 - v126).Magnitude
				local v132 = v130 / math.max(v131, 1e-6)
				return v129, v122 + (v124 - v122) * math.clamp(v132, 0, 1)
			end
			v121 = v129.Position + v128.Unit * 0.05
		end
		v122 = v124
		v121 = v125
	end
	return nil, nil
end
return v_u_2