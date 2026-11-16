-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Config.ItemConfig.WeaponFallback

local v_u_1 = {}
local v_u_2 = {
	["M"] = "Muzzle",
	["G"] = "Grip",
	["O"] = "Optic",
	["Mg"] = "Mag",
	["S"] = "Stock"
}
local function v18(p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) -- name: w
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v14 = {}
	for v15 in string.gmatch(p9 or "", "%S+") do
		local v16 = v_u_2[v15]
		if not v16 then
			continue
		end
		v14[v16] = true
	end
	local v17 = p13 or (p5 == "Pistol" and "Pistol" or (p5 == "Melee" and "Melee" or "Primary"))
	v_u_1[p3] = {
		["Name"] = p4,
		["Class"] = p5,
		["Slot"] = v17,
		["SlotKind"] = v17,
		["Ammo"] = p6,
		["MagSize"] = p7,
		["ExtMagSize"] = p8,
		["Slots"] = v14,
		["MaxZoom"] = p10 or 0,
		["Spawn"] = p11 or "World",
		["Allow"] = p12
	}
end
local v19 = {
	["Stock"] = { "TacticalStock", "HeavyStock" }
}
local v20 = {
	["Stock"] = { "TacticalStock" }
}
v18("HK416", "HK416", "AR", "Ammo_556", 30, 40, "M G O Mg S", 6, "World", v19)
v18("AKM", "AKM", "AR", "Ammo_762", 30, 40, "M O Mg", 6)
v18("BerylM762", "Beryl M762", "AR", "Ammo_762", 30, 40, "M G O Mg", 6)
v18("SCARL", "SCAR-L", "AR", "Ammo_556", 30, 40, "M G O Mg", 6)
v18("M16A4", "M16A4", "AR", "Ammo_556", 30, 40, "M O Mg S", 15, "World", v19)
v18("Mk47", "Mk47 Mutant", "AR", "Ammo_762", 20, 30, "M G O Mg S", 15, "World", v19)
v18("AUG", "AUG A3", "AR", "Ammo_556", 30, 40, "M G O Mg", 6)
v18("QBZ", "QBZ-95", "AR", "Ammo_556", 30, 40, "M G O Mg", 6)
v18("G36C", "G36C", "AR", "Ammo_556", 30, 40, "M G O Mg", 6)
v18("ACE32", "ACE 32", "AR", "Ammo_762", 30, 40, "M G O Mg S", 6, "World", v19)
v18("K2", "K2", "AR", "Ammo_556", 30, 40, "M G O Mg", 6)
v18("Groza", "OTs-14 Groza", "AR", "Ammo_762", 30, 40, "M O Mg", 6, "Supply", {
	["Muzzle"] = { "Suppressor_AR" }
})
v18("FAMAS", "FAMAS G2", "AR", "Ammo_556", 25, 30, "M O Mg", 6, "Supply")
v18("SKS", "SKS", "DMR", "Ammo_762", 10, 20, "M G O Mg S", 15)
v18("Mini14", "Mini-14", "DMR", "Ammo_556", 20, 30, "M O Mg", 15)
v18("SLR", "L1A1 SLR", "DMR", "Ammo_762", 10, 20, "M O Mg S", 15)
v18("Mk12", "Mk 12 SPR", "DMR", "Ammo_556", 20, 30, "M G O Mg S", 15)
v18("SVD", "Dragunov SVD", "DMR", "Ammo_762", 10, 20, "M O Mg S", 15)
v18("VSS", "VSS Vintorez", "DMR", "Ammo_9mm", 10, 20, "Mg S", 4)
v18("Mk14", "Mk 14 EBR", "DMR", "Ammo_762", 10, 20, "M O Mg S", 15, "Supply")
v18("Kar98k", "Kar98k", "SR", "Ammo_762", 5, 5, "M S O", 15, "World", {
	["Stock"] = { "BulletLoops", "CheekPad" }
})
v18("M24", "M24", "SR", "Ammo_762", 5, 7, "M Mg S O", 15)
v18("AWM", "AWM", "SR", "Ammo_300", 5, 7, "M Mg S O", 15, "Supply")
v18("Win94", "Winchester 1894", "SR", "Ammo_45", 8, 8, "S", 0, "World", {
	["Stock"] = { "BulletLoops" }
})
v18("Lynx", "AMR .50", "SR", "Ammo_50", 10, 10, "O", 15, "Supply")
v18("UMP45", "UMP45", "SMG", "Ammo_9mm", 25, 35, "M G O Mg", 6)
v18("Vector", "Vector", "SMG", "Ammo_9mm", 19, 33, "M G O Mg S", 6, "World", v19)
v18("MicroUZI", "Micro UZI", "SMG", "Ammo_9mm", 25, 35, "M O Mg S", 1, "World", v20)
v18("MP5K", "MP5K", "SMG", "Ammo_9mm", 30, 40, "M G O Mg S", 6, "World", v19)
v18("Tommy", "Thompson M1928", "SMG", "Ammo_9mm", 30, 50, "M G Mg", 0, "World", {
	["Grip"] = { "VerticalGrip" }
})
v18("JS9", "JS9", "SMG", "Ammo_9mm", 30, 40, "M G O Mg", 6)
v18("MP9", "MP9", "SMG", "Ammo_9mm", 30, 40, "M O Mg S", 4, "World", v20)
v18("P90", "P90", "SMG", "Ammo_57", 50, 50, "", 1, "Supply")
v18("M249", "M249", "LMG", "Ammo_556", 75, 150, "Mg S O", 6, "World", v19)
v18("RPD", "RPD", "LMG", "Ammo_762", 50, 110, "Mg O", 6)
v18("MG3", "MG3", "LMG", "Ammo_762", 75, 75, "O", 6, "Supply", {
	["Optic"] = {
		"Scope2x",
		"Scope3x",
		"Scope4x",
		"Scope6x"
	}
})
v18("S1897", "Winchester M1897", "SG", "Ammo_12g", 5, 5, "M S", 0, "World", {
	["Muzzle"] = { "Choke", "Duckbill" },
	["Stock"] = { "BulletLoops" }
})
v18("S686", "Beretta 686", "SG", "Ammo_12g", 2, 2, "M S", 0, "World", {
	["Muzzle"] = { "Choke" },
	["Stock"] = { "BulletLoops" }
})
v18("S12K", "Saiga-12K", "SG", "Ammo_12g", 5, 10, "M O Mg", 6, "World", {
	["Muzzle"] = { "Choke", "Duckbill", "Suppressor_AR" }
})
v18("DBS", "DP-12", "SG", "Ammo_12g", 14, 14, "O", 6, "Supply")
v18("SawedOff", "Sawed-Off", "SG", "Ammo_12g", 2, 2, "M", 0, "World", {
	["Muzzle"] = { "Choke" }
}, "Pistol")
v18("O12", "Slugger", "SG", "Ammo_12g", 5, 10, "M O Mg", 6, "World", {
	["Muzzle"] = { "Choke", "Suppressor_AR" }
})
v18("P92", "Beretta 92", "Pistol", "Ammo_9mm", 15, 20, "M G O Mg", 1)
v18("P18C", "Glock 18C", "Pistol", "Ammo_9mm", 17, 25, "M G O Mg", 1)
v18("R1895", "Nagant M1895", "Pistol", "Ammo_762", 7, 7, "M", 0, "World", {
	["Muzzle"] = { "Suppressor_SMG" }
})
v18("Deagle", "Desert Eagle", "Pistol", "Ammo_45", 7, 10, "M G O Mg", 1)
v18("Skorpion", "Skorpion vz. 61", "Pistol", "Ammo_9mm", 20, 40, "M G O Mg S", 1, "World", v20)
v18("FlareGun", "Flare Gun", "Pistol", "FlareRound", 1, 1, "", 0, "Special")
v18("Pan", "Frying Pan", "Melee", nil, 0, 0, "", 0)
v18("Machete", "Machete", "Melee", nil, 0, 0, "", 0)
v18("Crowbar", "Crowbar", "Melee", nil, 0, 0, "", 0)
v18("Sickle", "Sickle", "Melee", nil, 0, 0, "", 0)
v18("Crossbow", "Crossbow", "Special", "Bolt_Crossbow", 1, 1, "O", 4)
v18("Panzerfaust", "Panzerfaust", "Special", nil, 1, 1, "", 0)
return v_u_1