-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.WeaponStats

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Shared.Util.Units)
local v_u_3 = require(v1.Shared.Config.WeaponConfig)
local v_u_4 = require(v1.Shared.Config.AttachmentConfig)
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = {
	"Muzzle",
	"Grip",
	"Optic",
	"Mag",
	"Stock"
}
v_u_5.Slots = v_u_7
function v_u_5.sig(p8, p9) -- name: sig
	-- upvalues: (copy) v_u_7
	local v10 = { p8 }
	if p9 then
		for _, v11 in v_u_7 do
			local v12 = p9[v11] or ""
			local v13 = tostring(v12)
			table.insert(v10, v13)
		end
	end
	return table.concat(v10, "|")
end
local function v_u_64(p14, p15) -- name: compute
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_2
	local v16 = v_u_3.Weapons[p14]
	if not v16 then
		return nil
	end
	local v17 = v_u_3.Class[v16.Class] or {}
	local v18 = {}
	local v19 = {}
	if p15 then
		for _, v20 in v_u_7 do
			local v21 = p15[v20]
			local v22
			if v21 then
				v22 = v_u_4.Attachments[v21]
			else
				v22 = v21
			end
			if not v22 or v_u_3.attachSlotFor(p14, v21) ~= v20 then
				continue
			end
			v19[v20] = v21
			for v23, v24 in v22.Mods or {} do
				if type(v24) == "number" then
					v18[v23] = (v18[v23] or 1) * v24
				else
					v18[v23] = v24
				end
			end
		end
	end
	local v25 = {
		["id"] = p14,
		["cfg"] = v16,
		["class"] = v16.Class,
		["damageClass"] = v16.DamageClass or v16.Class,
		["slot"] = v16.Slot,
		["isGun"] = v_u_3.isGun(p14),
		["isMelee"] = v16.Class == "Melee",
		["isThrowable"] = v16.Class == "Throwable",
		["mounted"] = v19,
		["animSet"] = v16.AnimSet or "Rifle",
		["animPack"] = v_u_3.animPack(p14) or "Rifle",
		["sound"] = v16.Sound,
		["subsonic"] = v16.Subsonic == true
	}
	local v26 = v16.EquipTime
	if v26 == nil then
		v26 = v17.EquipTime
	end
	v25.equipTime = v26 or 0.5
	if not v25.isGun then
		return v25
	end
	v25.ammo = v16.Ammo
	local v27
	if v18.ExtMag == true then
		v27 = v16.ExtMagSize ~= nil
	else
		v27 = false
	end
	v25.extMag = v27
	v25.magSize = v25.extMag and v16.ExtMagSize or (v16.MagSize or 1)
	v25.damage = v16.Damage or 0
	v25.pellets = v16.Pellets or 1
	local v28 = (v16.PelletSpread or 0) * (v18.PelletSpread or 1)
	v25.pelletH = v28 * (v18.PelletSpreadH or 1)
	v25.pelletV = v28 * (v18.PelletSpreadV or 1)
	v25.fireModes = v16.FireModes or { "Single" }
	v25.burst = v16.Burst or 3
	v25.tbs = v16.TBS or 0.1
	v25.tbsByMode = v16.TBSByMode or {}
	v25.boltAction = v16.BoltAction == true
	v25.pumpEvery = v16.PumpEvery
	v25.pumpTime = v16.PumpTime
	v25.singleUse = v16.SingleUse == true
	v25.explosion = v16.Explosion
	v25.flare = v16.Flare == true
	v25.velocityMps = v16.Velocity or 800
	v25.v0 = v_u_2.ms(v25.velocityMps)
	local v29 = v16.Drag
	if v29 == nil then
		v29 = v17.Drag
	end
	v25.drag = v29 or 0.4
	local v30 = v_u_2.m
	local v31 = v16.Range
	if v31 == nil then
		v31 = v17.Range
	end
	v25.range = v30(v31 or 1000)
	v25.falloff = v_u_3.Falloff[v16.Falloff or "AR556"] or v_u_3.Falloff.AR556
	local v32 = v16.Recoil or {}
	local v33 = {}
	for v34, v35 in v_u_3.RecoilFeel and v_u_3.RecoilFeel[v16.Class] or (v_u_3.RecoilFeel and v_u_3.RecoilFeel.AR or {}) do
		v33[v34] = v35
	end
	for v36, v37 in v32.Feel or {} do
		v33[v36] = v37
	end
	local v38 = 0
	for v39 = 1, #p14 do
		v38 = (v38 * 31 + string.byte(p14, v39)) % 100003
	end
	v33.Phase = v38 % 628 / 100
	v33.Phase2 = v38 // 7 % 628 / 100
	v33.Freq = (v33.Freq or 0.25) * (v38 % 31 / 100 + 0.85)
	local v40 = {
		["V"] = (v32.V or 0.5) * (v18.VRecoil or 1),
		["H"] = (v32.H or 0.25) * (v18.HRecoil or 1) * (v18.RecoilRandom or 1),
		["Bias"] = (v32.Bias or 0) * (v18.HRecoil or 1),
		["First"] = (v32.First or (v17.First or 1)) * (v18.FirstShot or 1)
	}
	local v41 = v32.Recovery or (v17.Recovery or 0.6)
	local v42 = v18.Recovery or 1
	local v43 = v41 * math.sqrt(v42)
	v40.Recovery = math.clamp(v43, 0, 1)
	v40.RecoverySpeed = (v32.RecoverySpeed or (v17.RecoverySpeed or 20)) * (v18.Recovery or 1)
	v40.Kick = (v32.Kick or (v17.Kick or 0.4)) * (v18.Kick or 1)
	v40.Stand = v32.Stand or 1
	v40.Crouch = v32.Crouch or (v17.Crouch or 0.84)
	v40.Prone = v32.Prone or (v17.Prone or 0.6)
	v40.Ramp = v32.Ramp or { 10, 1.15 }
	v40.KickMul = v18.Kick or 1
	v40.Pattern = v32.Pattern
	v40.Feel = v33
	v25.recoil = v40
	local v44 = v16.Spread or {}
	local v45 = v18.HipSpread or 1
	if v16.Class == "Pistol" and v18.HipSpreadPistol then
		v45 = v45 / (v18.HipSpread or 1) * v18.HipSpreadPistol
	end
	v25.spread = {
		["Hip"] = (v44.Hip or 4) * v45 * (v_u_3.HipSpreadScale and (v_u_3.HipSpreadScale[v16.Class] or 1) or 1),
		["Aim"] = v44.Aim or (v17.AimMult or 0.2),
		["ADS"] = v44.ADS or (v17.ADSMult or 0.03),
		["Bloom"] = v44.Bloom or (v17.Bloom or 0.1),
		["BloomMax"] = v44.BloomMax or (v17.BloomMax or 1),
		["BloomRecover"] = v44.BloomRecover or (v17.BloomRecover or 2)
	}
	local v46 = v16.Sway
	if v46 == nil then
		v46 = v17.Sway
	end
	v25.sway = (v46 or 1) * (v18.Sway or 1)
	local v47 = v16.AimPunch
	if v47 == nil then
		v47 = v17.AimPunch
	end
	v25.aimPunch = v47 or 0.4
	local v48 = v16.Reload or {
		["Tactical"] = 2.5,
		["Empty"] = 3
	}
	local v49 = v18.ReloadTime or 1
	local v50 = {}
	local v51 = v48.Tactical
	if v51 then
		v51 = v48.Tactical * v49
	end
	v50.Tactical = v51
	local v52 = v48.Empty
	if v52 then
		v52 = v48.Empty * v49
	end
	v50.Empty = v52
	local v53 = v48.Clip
	if v53 then
		v53 = v48.Clip * v49
	end
	v50.Clip = v53
	v25.reload = v50
	if v48.Shell then
		v25.reload.Shell = {
			["Start"] = (v48.Shell.Start or 0) * v49,
			["First"] = (v48.Shell.First or 0.7) * v49,
			["Each"] = (v48.Shell.Each or 0.7) * v49,
			["End"] = (v48.Shell.End or 0) * v49
		}
	end
	local v54 = not v19.Optic and v16.BuiltIn
	if v54 then
		v54 = v16.BuiltIn.Optic
	end
	local v55
	if v54 then
		v55 = v_u_4.Attachments[v54]
	else
		v55 = v54
	end
	v25.optic = v54
	local v56
	if v19.Optic == nil then
		v56 = v54 ~= nil
	else
		v56 = false
	end
	v25.opticBuiltIn = v56
	v25.opticCfg = v55
	v25.zoom = v55 and (v55.Zoom or 1.2) or 1.2
	v25.fov = v55 and (v55.FOV or 43) or 43
	v25.hfov = v55 and (v55.HFOV or 70) or 70
	local v57
	if v55 then
		v57 = v55.Variable or nil
	else
		v57 = nil
	end
	v25.variable = v57
	local v58
	if v55 == nil then
		v58 = false
	else
		v58 = v55.ScopeMask == true
	end
	v25.scopeMask = v58
	local v59
	if v55 then
		v59 = v55.Reticle
	else
		v59 = v55
	end
	v25.reticle = v59
	local v60
	if v55 then
		v60 = v55.EyeRelief or nil
	else
		v60 = nil
	end
	v25.eyeRelief = v60
	local v61 = v16.ADSTime
	if v61 == nil then
		v61 = v17.ADSTime
	end
	v25.adsTime = (v61 or 0.25) * (v18.ADSTime or 1)
	if v55 and (v55.Mods and (v55.Mods.ADSTime and not v19.Optic)) then
		v25.adsTime = v25.adsTime * v55.Mods.ADSTime
	end
	if v55 and v55.Zeroing then
		v25.zeroList = v55.Zeroing
	elseif v55 then
		v25.zeroList = { 100 }
	else
		v25.zeroList = v_u_3.ironZeroing(p14)
	end
	local v62
	if v18.Suppressed == true then
		v62 = true
	elseif v16.BuiltIn == nil then
		v62 = false
	else
		v62 = v16.BuiltIn.Suppressed == true
	end
	v25.suppressed = v62
	v25.flashHidden = v18.FlashHidden == true and true or v25.suppressed
	local v63 = v19.Muzzle
	v25.muzzleDevice = v25.suppressed and "S" or (v18.FlashHidden == true and "F" or (type(v63) == "string" and (string.find(v63, "Comp") ~= nil or v63 == "MuzzleBrake") and "C" or nil))
	return v25
end
function v_u_5.get(p65, p66) -- name: get
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_64
	if not p65 then
		return nil
	end
	local v67 = v_u_5.sig(p65, p66)
	local v68 = v_u_6[v67] == nil and v_u_64(p65, p66)
	if v68 then
		v_u_6[v67] = v68
	end
	return v68
end
function v_u_5.tbs(p69, p70) -- name: tbs
	if p70 and (p69.tbsByMode and p69.tbsByMode[p70]) then
		return p69.tbsByMode[p70]
	else
		return p69.tbs
	end
end
function v_u_5.reloadTime(p71, p72) -- name: reloadTime
	local v73 = p71.reload
	return p72 <= 0 and (v73.Empty or v73.Tactical or 3) or (v73.Tactical or v73.Empty or 3)
end
function v_u_5.zeroFor(p74, p75) -- name: zeroFor
	if p74 then
		p74 = p74.zeroList
	end
	if type(p74) == "table" and #p74 ~= 0 then
		if p75 and table.find(p74, p75) then
			return p75
		else
			return p74[1]
		end
	else
		return 100
	end
end
function v_u_5.zeroAngle(p76, p77) -- name: zeroAngle
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	return require(script.Parent.Ballistics).zeroAngle(p76.v0, p76.drag, v_u_2.m(v_u_5.zeroFor(p76, p77)))
end
return v_u_5