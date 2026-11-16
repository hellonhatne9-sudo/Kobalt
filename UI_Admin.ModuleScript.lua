-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.UI_Admin

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("TextChatService")
local v5 = script.Parent.Parent:WaitForChild("UIKit")
local v6 = require(v5.Theme)
local v_u_7 = require(v5.UI)
local v_u_8 = require(v5.Root)
local v_u_9 = require(v5.Deps)
local v_u_10 = require(v5.Art)
local v11 = require(v_u_2:WaitForChild("Shared"):WaitForChild("Config"):WaitForChild("AnalyticsConfig"))
local v_u_12 = v6.Color
local v_u_13 = v6.Font
local v_u_14 = v11.Admin
local v_u_15 = {}
local v_u_16 = {
	{
		["key"] = "role",
		["title"] = "ROLE",
		["w"] = 0.085
	},
	{
		["key"] = "id",
		["title"] = "SERVER",
		["w"] = 0.115
	},
	{
		["key"] = "players",
		["title"] = "PLAYERS",
		["w"] = 0.08
	},
	{
		["key"] = "bots",
		["title"] = "BOTS",
		["w"] = 0.06
	},
	{
		["key"] = "phase",
		["title"] = "PHASE",
		["w"] = 0.095
	},
	{
		["key"] = "up",
		["title"] = "UPTIME",
		["w"] = 0.09
	},
	{
		["key"] = "fps",
		["title"] = "FPS",
		["w"] = 0.065
	},
	{
		["key"] = "mem",
		["title"] = "MEMORY",
		["w"] = 0.09
	},
	{
		["key"] = "ping",
		["title"] = "PING",
		["w"] = 0.075
	},
	{
		["key"] = "hb",
		["title"] = "HEARTBEAT",
		["w"] = 0.09
	},
	{
		["key"] = "err",
		["title"] = "ERRORS",
		["w"] = 0.07
	},
	{
		["key"] = "tp",
		["title"] = "TP FAILS",
		["w"] = 0.075
	}
}
local v_u_17 = {
	{
		["key"] = "lobbies",
		["title"] = "Lobby servers"
	},
	{
		["key"] = "matches",
		["title"] = "Match servers"
	},
	{
		["key"] = "players",
		["title"] = "Players online"
	},
	{
		["key"] = "realavg",
		["title"] = "Real players / match"
	},
	{
		["key"] = "fails",
		["title"] = "Teleport fails \194\183 1h"
	},
	{
		["key"] = "errors",
		["title"] = "Script errors"
	},
	{
		["key"] = "stale",
		["title"] = "Stale servers"
	},
	{
		["key"] = "ranked",
		["title"] = "Ranked"
	}
}
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = {}
local v_u_23 = nil
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = {}
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = false
local v_u_34 = 0
local v_u_35 = nil
local v_u_36 = -1
local v_u_37 = nil
local v_u_38 = false
local v_u_39 = nil
local v_u_40 = -100
local v_u_41 = nil
local function v_u_57(p42) -- name: fmtDur
	local v43 = tonumber(p42) or 0
	local v44 = v43 ~= v43 and 0 or v43
	local v45 = math.floor(v44)
	local v46 = math.max(0, v45)
	if v46 >= 86400 then
		local v47 = string.format
		local v48 = v46 / 86400
		local v49 = math.floor(v48)
		local v50 = v46 % 86400 / 3600
		return v47("%dd %02dh", v49, (math.floor(v50)))
	end
	if v46 < 3600 then
		if v46 < 60 then
			return v46 .. "s"
		end
		local v51 = string.format
		local v52 = v46 / 60
		return v51("%dm %02ds", math.floor(v52), v46 % 60)
	end
	local v53 = string.format
	local v54 = v46 / 3600
	local v55 = math.floor(v54)
	local v56 = v46 % 3600 / 60
	return v53("%dh %02dm", v55, (math.floor(v56)))
end
local function v_u_67() -- name: layout
	-- upvalues: (ref) v_u_19, (copy) v_u_8
	if v_u_19 then
		local v58 = v_u_8.virtualSize()
		local v59 = v_u_8.topInset()
		local v60 = v58.X - 24
		local v61 = math.clamp(v60, 720, 1180)
		local v62 = v58.Y - v59 - 20
		local v63 = math.clamp(v62, 560, 730)
		v_u_19.Size = UDim2.fromOffset(v61, v63)
		local v64 = v_u_19
		local v65 = UDim2.new
		local v66 = (v58.Y - v59 - v63) / 2
		v64.Position = v65(0.5, 0, 0, v59 + math.max(0, v66))
	end
end
local function v_u_70(p68) -- name: clearList
	for _, v69 in p68:GetChildren() do
		if not v69:IsA("GuiObject") then
			continue
		end
		v69:Destroy()
	end
end
local function v_u_77(p71, p72, p73, p74, p75) -- name: section
	-- upvalues: (copy) v_u_7, (copy) v_u_12
	local v76 = v_u_7.panel({
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.35,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Section" .. p72,
		["BackgroundColor3"] = v_u_12.Bg,
		["Size"] = UDim2.new(p73, p74, 1, 0),
		["LayoutOrder"] = p72,
		["Parent"] = p71
	})
	v_u_7.padding(v76, 10, 10, 8, 8)
	return v76, v_u_7.caption(p75, {
		["TextSize"] = 11,
		["Size"] = nil,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 16),
		["Parent"] = v76
	})
end
local function v_u_84(p78) -- name: makeRow
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (ref) v_u_23, (copy) v_u_16, (copy) v_u_13, (ref) v_u_37, (ref) v_u_35, (ref) v_u_41
	local v_u_79 = v_u_7.new("TextButton", {
		["Name"] = nil,
		["Text"] = "",
		["AutoButtonColor"] = false,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Row" .. p78,
		["BackgroundColor3"] = v_u_12.BgLight,
		["Size"] = UDim2.new(1, -6, 0, 24),
		["LayoutOrder"] = p78,
		["Parent"] = v_u_23
	})
	local v80 = 0
	local v81 = {}
	for _, v82 in v_u_16 do
		v81[v82.key] = v_u_7.label({
			["Text"] = "",
			["TextSize"] = 13,
			["Font"] = nil,
			["TextTruncate"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Medium,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Position"] = UDim2.new(v80, 8, 0, 0),
			["Size"] = UDim2.new(v82.w, -8, 1, 0),
			["Parent"] = v_u_79
		})
		v80 = v80 + v82.w
	end
	local v_u_83 = {
		["btn"] = nil,
		["cells"] = nil,
		["id"] = nil,
		["btn"] = v_u_79,
		["cells"] = v81
	}
	v_u_79.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_83, (ref) v_u_37, (copy) v_u_79
		if v_u_83.id ~= v_u_37 then
			v_u_79.BackgroundTransparency = 0.75
		end
	end)
	v_u_79.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_83, (ref) v_u_37, (copy) v_u_79
		if v_u_83.id ~= v_u_37 then
			v_u_79.BackgroundTransparency = 1
		end
	end)
	v_u_79.Activated:Connect(function()
		-- upvalues: (ref) v_u_37, (copy) v_u_83, (ref) v_u_35, (ref) v_u_41
		v_u_37 = v_u_83.id
		if v_u_35 then
			v_u_41(v_u_35)
		end
	end)
	return v_u_83
end
local v_u_237 = {
	{ "Role", function(p85)
			local v86 = p85.r
			return string.upper((tostring(v86 or "?"))) .. (p85.me and "  (this server, live)" or ""), 0
		end },
	{ "Place / version", function(p87)
			local v88 = string.format
			local v89 = p87.pid or "-"
			local v90 = tostring(v89)
			local v91 = p87.pv or "-"
			return v88("%s / v%s", v90, (tostring(v91))), 0
		end },
	{ "Players", function(p92)
			local v93 = string.format
			local v94 = p92.n
			local v95 = tonumber(v94) or 0
			local v96 = v95 ~= v95 and 0 or v95
			local v97 = p92.mx
			local v98 = tonumber(v97) or 0
			local v99 = v98 ~= v98 and 0 or v98
			local v100 = p92.q
			local v101 = tonumber(v100) or 0
			local v102 = v93("%d / %d  (%d searching)", v96, v99, v101 ~= v101 and 0 or v101)
			local v103 = p92.mx
			local v104 = tonumber(v103) or 0
			if (v104 ~= v104 and 0 or v104) > 0 then
				local v105 = p92.n
				local v106 = tonumber(v105) or 0
				local v107 = v106 ~= v106 and 0 or v106
				local v108 = p92.mx
				local v109 = tonumber(v108) or 0
				if (v109 ~= v109 and 0 or v109) <= v107 then
					return v102, 1
				end
			end
			return v102, 0
		end },
	{ "Bots alive", function(p110)
			local v111 = p110.b
			local v112 = tonumber(v111) or 0
			local v113 = v112 ~= v112 and 0 or v112
			return tostring(v113), 0
		end },
	{ "Phase / match", function(p114)
			return ((not p114.ph or p114.ph == "") and "-" or p114.ph) .. ((not p114.mid or p114.mid == "") and "" or "  #" .. p114.mid), 0
		end },
	{ "Alive (match)", function(p115)
			local v116 = p115.al
			local v117 = tonumber(v116) or 0
			local v118 = v117 ~= v117 and 0 or v117
			return tostring(v118), 0
		end },
	{ "Uptime", function(p119)
			-- upvalues: (copy) v_u_57
			return v_u_57(p119.up), 0
		end },
	{ "Server FPS", function(p120)
			local v121 = p120.fps
			local v122 = tonumber(v121) or 0
			local v123 = v122 ~= v122 and 0 or v122
			if v123 <= 0 then
				return "measuring...", 0
			end
			local v124 = string.format
			local v125 = p120.fw
			local v126 = tonumber(v125) or 0
			local v127 = v124("%.0f  (worst frame %d ms)", v123, v126 ~= v126 and 0 or v126)
			local v128 = v123 <= 0 and 0 or (v123 < 25 and 2 or (v123 < 45 and 1 or 0))
			local v129 = p120.fw
			local v130 = tonumber(v129) or 0
			local v131 = (v130 ~= v130 and 0 or v130) >= 250 and 1 or 0
			return v127, math.max(v128, v131)
		end },
	{ "Physics FPS", function(p132)
			local v133 = string.format
			local v134 = p132.pf
			local v135 = tonumber(v134) or 0
			return v133("%.0f", v135 ~= v135 and 0 or v135), 0
		end },
	{ "Memory", function(p136)
			local v137 = string.format
			local v138 = p136.mem
			local v139 = tonumber(v138) or 0
			local v140 = v139 ~= v139 and 0 or v139
			local v141 = p136.lua
			local v142 = tonumber(v141) or 0
			local v143 = v137("%d MB  (Lua %.1f MB)", v140, v142 ~= v142 and 0 or v142)
			local v144 = p136.mem
			local v145 = tonumber(v144) or 0
			local v146 = v145 ~= v145 and 0 or v145
			if v146 >= 5000 then
				return v143, 2
			elseif v146 >= 3000 then
				return v143, 1
			else
				return v143, 0
			end
		end },
	{ "Instances", function(p147)
			local v148 = p147.ic
			local v149 = tonumber(v148) or 0
			local v150 = v149 ~= v149 and 0 or v149
			return tostring(v150), 0
		end },
	{ "Net send", function(p151)
			local v152 = string.format
			local v153 = p151.kb
			local v154 = tonumber(v153) or 0
			return v152("%d kbps", v154 ~= v154 and 0 or v154), 0
		end },
	{ "Ping avg / max", function(p155)
			local v156 = string.format
			local v157 = p155.png
			local v158 = tonumber(v157) or 0
			local v159 = v158 ~= v158 and 0 or v158
			local v160 = p155.pmax
			local v161 = tonumber(v160) or 0
			local v162 = v156("%d / %d ms", v159, v161 ~= v161 and 0 or v161)
			local v163 = p155.png
			local v164 = tonumber(v163) or 0
			local v165 = v164 ~= v164 and 0 or v164
			if v165 >= 300 then
				return v162, 2
			elseif v165 >= 150 then
				return v162, 1
			else
				return v162, 0
			end
		end },
	{ "Server region", function(p166)
			local v167 = p166.srg or "?"
			local v168 = tostring(v167)
			if p166.srg == nil or p166.srg == "?" then
				return v168, 1
			else
				return v168, 0
			end
		end },
	{ "Players by region", function(p169)
			local v170 = p169.rgc
			return (type(v170) ~= "string" or p169.rgc == "") and "-" or p169.rgc, 0
		end },
	{ "Ping median", function(p171)
			local v172 = string.format
			local v173 = p171.pmed
			local v174 = tonumber(v173) or 0
			local v175 = v172("%d ms", v174 ~= v174 and 0 or v174)
			local v176 = p171.pmed
			local v177 = tonumber(v176) or 0
			local v178 = v177 ~= v177 and 0 or v177
			if v178 >= 300 then
				return v175, 2
			elseif v178 >= 150 then
				return v175, 1
			else
				return v175, 0
			end
		end },
	{ "Heartbeat", function(p179)
			-- upvalues: (copy) v_u_57, (copy) v_u_14
			if p179.me then
				return "live", 0
			else
				local v180 = v_u_57(p179.age) .. " ago"
				local v181 = p179.age
				local v182 = tonumber(v181) or 0
				local v183 = v182 ~= v182 and 0 or v182
				if (v_u_14.StaleAfter or 65) < v183 then
					return v180, 2
				elseif v183 > 45 then
					return v180, 1
				else
					return v180, 0
				end
			end
		end },
	{ "DataStore warnings", function(p184)
			local v185 = p184.ds
			local v186 = tonumber(v185) or 0
			local v187 = v186 ~= v186 and 0 or v186
			local v188 = tostring(v187)
			local v189 = p184.ds
			local v190 = tonumber(v189) or 0
			local v191 = v190 ~= v190 and 0 or v190
			if v191 >= 20 then
				return v188, 2
			elseif v191 > 0 then
				return v188, 1
			else
				return v188, 0
			end
		end },
	{ "Teleports sent / retries", function(p192)
			local v193 = string.format
			local v194 = p192.ts
			local v195 = tonumber(v194) or 0
			local v196 = v195 ~= v195 and 0 or v195
			local v197 = p192.tr
			local v198 = tonumber(v197) or 0
			local v199 = v193("%d / %d", v196, v198 ~= v198 and 0 or v198)
			local v200 = p192.tr
			local v201 = tonumber(v200) or 0
			if (v201 ~= v201 and 0 or v201) > 0 then
				return v199, 1
			else
				return v199, 0
			end
		end },
	{ "Teleport fails", function(p202)
			local v203 = p202.tp
			local v204 = tonumber(v203) or 0
			local v205 = v204 ~= v204 and 0 or v204
			local v206 = tostring(v205)
			local v207 = p202.tp
			local v208 = tonumber(v207) or 0
			local v209 = v208 ~= v208 and 0 or v208
			if v209 >= 5 then
				return v206, 2
			elseif v209 > 0 then
				return v206, 1
			else
				return v206, 0
			end
		end },
	{ "Matchmaking fails", function(p210)
			local v211 = p210.mm
			local v212 = tonumber(v211) or 0
			local v213 = v212 ~= v212 and 0 or v212
			local v214 = tostring(v213)
			local v215 = p210.mm
			local v216 = tonumber(v215) or 0
			local v217 = v216 ~= v216 and 0 or v216
			if v217 >= 5 then
				return v214, 2
			elseif v217 > 0 then
				return v214, 1
			else
				return v214, 0
			end
		end },
	{ "MemoryStore errors", function(p218)
			local v219 = p218.msf
			local v220 = tonumber(v219) or 0
			local v221 = v220 ~= v220 and 0 or v220
			local v222 = tostring(v221)
			local v223 = p218.msf
			local v224 = tonumber(v223) or 0
			local v225 = v224 ~= v224 and 0 or v224
			if v225 >= 6 then
				return v222, 2
			elseif v225 > 0 then
				return v222, 1
			else
				return v222, 0
			end
		end },
	{ "Errors / warnings", function(p226)
			local v227 = string.format
			local v228 = p226.ec
			local v229 = tonumber(v228) or 0
			local v230 = v229 ~= v229 and 0 or v229
			local v231 = p226.wc
			local v232 = tonumber(v231) or 0
			local v233 = v227("%d / %d", v230, v232 ~= v232 and 0 or v232)
			local v234 = p226.ec
			local v235 = tonumber(v234) or 0
			local v236 = v235 ~= v235 and 0 or v235
			if v236 >= 50 then
				return v233, 2
			elseif v236 > 0 then
				return v233, 1
			else
				return v233, 0
			end
		end }
}
local function v_u_301() -- name: build
	-- upvalues: (ref) v_u_18, (copy) v_u_8, (copy) v_u_7, (copy) v_u_12, (ref) v_u_19, (copy) v_u_67, (copy) v_u_13, (ref) v_u_20, (ref) v_u_21, (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (copy) v_u_17, (copy) v_u_22, (copy) v_u_2, (copy) v_u_16, (ref) v_u_23, (ref) v_u_25, (copy) v_u_77, (ref) v_u_26, (copy) v_u_237, (copy) v_u_27, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (ref) v_u_31, (ref) v_u_32
	if not v_u_18 then
		v_u_18 = v_u_8.screen("UI_Admin", {
			["order"] = 95,
			["fullscreen"] = true,
			["enabled"] = false
		})
		local v238 = v_u_18.root
		v_u_7.new("TextButton", {
			["Name"] = "Backdrop",
			["Text"] = "",
			["Modal"] = true,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.45,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.Black,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v238
		})
		local v239 = v_u_7.panel({
			["Name"] = "Panel",
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.08,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["BackgroundColor3"] = v_u_12.Panel,
			["Size"] = UDim2.fromOffset(1180, 730),
			["Parent"] = v238
		}, true)
		v_u_19 = v239
		v_u_7.corner(v239, 4)
		v_u_7.padding(v239, 18, 18, 14, 16)
		v_u_67()
		v_u_8.onScaleChanged(v_u_67)
		v_u_7.label({
			["Text"] = "SERVER MONITOR",
			["Font"] = nil,
			["TextSize"] = 22,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Size"] = UDim2.new(0, 230, 0, 30),
			["Parent"] = v239
		})
		v_u_7.label({
			["Text"] = "ADMIN \194\183 OWNER ONLY",
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["TextColor3"] = v_u_12.Accent,
			["Position"] = UDim2.fromOffset(236, 2),
			["Size"] = UDim2.new(0, 200, 0, 30),
			["Parent"] = v239
		})
		v_u_20 = v_u_7.label({
			["Text"] = "Loading...",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -656, 0, 0),
			["Size"] = UDim2.new(1, -1026, 0, 30),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v239
		})
		v_u_21 = v_u_7.button("Refresh", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -36, 0, 0),
			["Size"] = UDim2.fromOffset(90, 30),
			["Parent"] = v239
		}, function()
			-- upvalues: (ref) v_u_15
			v_u_15.refresh()
		end, "default")
		v_u_7.button("Devices", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -268, 0, 0),
			["Size"] = UDim2.fromOffset(86, 30),
			["Parent"] = v239
		}, function()
			-- upvalues: (ref) v_u_9
			local v240 = script:FindFirstChild("Devices")
			if v240 then
				local v241 = require
				local v242, v243 = pcall(v241, v240)
				if v242 and (v243 and v243.open) then
					task.spawn(v243.open, function(p_u_244)
						-- upvalues: (ref) v_u_9
						local v_u_245 = v_u_9.remote("AdminQuery")
						if v_u_245 and v_u_245:IsA("RemoteFunction") then
							local v246, v247 = pcall(function()
								-- upvalues: (copy) v_u_245, (copy) p_u_244
								return v_u_245:InvokeServer(p_u_244)
							end)
							if v246 then
								return v247
							else
								return nil
							end
						else
							return nil
						end
					end)
				end
			end
		end, "default")
		v_u_7.button("Cosmetics", {
			["Name"] = "CosmeticsBtn",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -360, 0, 0),
			["Size"] = UDim2.fromOffset(98, 30),
			["Parent"] = v239
		}, function()
			local v248 = script:FindFirstChild("Cosmetics")
			if v248 then
				local v249 = require
				local v250, v251 = pcall(v249, v248)
				if v250 and (v251 and v251.open) then
					task.spawn(v251.open)
				end
			end
		end, "default")
		v_u_7.button("Anti-cheat", {
			["Name"] = "AntiCheatBtn",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -464, 0, 0),
			["Size"] = UDim2.fromOffset(102, 30),
			["Parent"] = v239
		}, function()
			local v252 = script:FindFirstChild("AntiCheat")
			if v252 then
				local v253 = require
				local v254, v255 = pcall(v253, v252)
				if v254 and (v255 and v255.open) then
					task.spawn(v255.open)
				end
			end
		end, "danger")
		v_u_7.button("Staff", {
			["Name"] = "StaffBtn",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -572, 0, 0),
			["Size"] = UDim2.fromOffset(76, 30),
			["Parent"] = v239
		}, function()
			local v256 = script:FindFirstChild("Staff")
			if v256 then
				local v257 = require
				local v258, v259 = pcall(v257, v256)
				if v258 and (v259 and v259.open) then
					task.spawn(v259.open)
				end
			end
		end, "default")
		v_u_7.button("Give currency", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -132, 0, 0),
			["Size"] = UDim2.fromOffset(130, 30),
			["Parent"] = v239
		}, function()
			local v260 = script.Parent:FindFirstChild("UI_AdminGrant")
			if v260 then
				local v261 = require
				local v262, v263 = pcall(v261, v260)
				if v262 and (v263 and v263.open) then
					task.spawn(v263.open)
				end
			end
		end, "primary")
		v_u_7.new("ImageButton", {
			["Name"] = "Close",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_10.Image.icon_close,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 1),
			["Size"] = UDim2.fromOffset(28, 28),
			["Parent"] = v239
		}).Activated:Connect(function()
			-- upvalues: (ref) v_u_15
			v_u_15.close()
		end)
		local v264 = v_u_7.frame({
			["Name"] = "Tiles",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 42),
			["Size"] = UDim2.new(1, 0, 0, 64),
			["Parent"] = v239
		})
		v_u_7.list(v264, false, 8)
		for v265, v266 in v_u_17 do
			local v267 = v_u_7.panel({
				["Name"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0.35,
				["Size"] = nil,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Name"] = v266.key,
				["BackgroundColor3"] = v_u_12.Bg,
				["Size"] = UDim2.new(1 / #v_u_17, -7, 1, 0),
				["LayoutOrder"] = v265,
				["Parent"] = v264
			})
			v_u_7.padding(v267, 10, 10, 6, 6)
			v_u_7.caption(v266.title, {
				["TextSize"] = 11,
				["Size"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 14),
				["Parent"] = v267
			})
			local v268 = {
				["v"] = v_u_7.label({
					["Text"] = "-",
					["Font"] = nil,
					["TextSize"] = 24,
					["Position"] = nil,
					["Size"] = nil,
					["Parent"] = nil,
					["Font"] = v_u_13.Bold,
					["Position"] = UDim2.fromOffset(0, 14),
					["Size"] = UDim2.new(1, 0, 0, 28),
					["Parent"] = v267
				}),
				["s"] = v_u_7.label({
					["Text"] = "",
					["TextSize"] = 11,
					["TextColor3"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["TextTruncate"] = nil,
					["Parent"] = nil,
					["TextColor3"] = v_u_12.TextDim,
					["Position"] = UDim2.fromOffset(0, 40),
					["Size"] = UDim2.new(1, 0, 0, 13),
					["TextTruncate"] = Enum.TextTruncate.AtEnd,
					["Parent"] = v267
				})
			}
			v_u_22[v266.key] = v268
		end
		local v269 = v264:FindFirstChild("ranked")
		if v269 and v_u_22.ranked then
			local function v270()
				-- upvalues: (ref) v_u_2
				return require((v_u_2:WaitForChild("Shared"):WaitForChild("Config"):WaitForChild("RankConfig")))
			end
			local v271, v272 = pcall(v270)
			local v273
			if v271 and type(v272) == "table" then
				local v274 = v272.Mode
				v273 = tostring(v274)
			else
				v273 = "?"
			end
			local v275
			if v273 == "AUTO" then
				local v276 = v272.mode
				v275 = type(v276) == "function"
			else
				v275 = false
			end
			if v275 then
				v273 = v272.mode(workspace:GetServerTimeNow())
			end
			v_u_22.ranked.v.Text = v273 .. (v275 and " (AUTO)" or "")
			local v277 = v_u_22.ranked.v
			local v278
			if v273 == "ON" then
				v278 = v_u_12.Green
			elseif v273 == "HIDDEN" then
				v278 = v_u_12.Accent
			else
				v278 = v_u_12.TextDim
			end
			v277.TextColor3 = v278
			v_u_22.ranked.s.Text = "Click: calibration stats"
			v_u_7.new("TextButton", {
				["Name"] = "Open",
				["Text"] = "",
				["AutoButtonColor"] = false,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["ZIndex"] = 5,
				["Parent"] = nil,
				["Size"] = UDim2.fromScale(1, 1),
				["Parent"] = v269
			}).Activated:Connect(function()
				local v279 = script:FindFirstChild("Ranked")
				if v279 then
					local v280 = require
					local v281, v282 = pcall(v280, v279)
					if v281 and (v282 and v282.open) then
						task.spawn(v282.open)
					end
				end
			end)
		end
		local v283 = v_u_7.frame({
			["Name"] = "Servers",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 118),
			["Size"] = UDim2.new(1, 0, 1, -450),
			["Parent"] = v239
		})
		local v284 = v_u_7.frame({
			["Name"] = "Head",
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, -6, 0, 20),
			["Parent"] = v283
		})
		local v285 = 0
		for _, v286 in v_u_16 do
			v_u_7.label({
				["Text"] = nil,
				["Font"] = nil,
				["TextSize"] = 11,
				["TextColor3"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Parent"] = nil,
				["Text"] = v286.title,
				["Font"] = v_u_13.Bold,
				["TextColor3"] = v_u_12.TextFaint,
				["Position"] = UDim2.new(v285, 8, 0, 0),
				["Size"] = UDim2.new(v286.w, -8, 1, 0),
				["Parent"] = v284
			})
			v285 = v285 + v286.w
		end
		v_u_7.divider({
			["Position"] = UDim2.fromOffset(0, 21),
			["Parent"] = v283
		})
		v_u_23 = v_u_7.scroll({
			["Name"] = "List",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 24),
			["Size"] = UDim2.new(1, 0, 1, -24),
			["Parent"] = v283
		}, 1)
		v_u_25 = v_u_7.label({
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Visible"] = false,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["Position"] = UDim2.fromOffset(8, 30),
			["Size"] = UDim2.new(1, -16, 0, 20),
			["Parent"] = v283
		})
		local v287 = v_u_7.frame({
			["Name"] = "Bottom",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Size"] = UDim2.new(1, 0, 0, 322),
			["Parent"] = v239
		})
		v_u_7.list(v287, false, 8)
		local v288, v289 = v_u_77(v287, 1, 0.37, -6, "Server details")
		v_u_26 = v289
		local v290 = v_u_7.frame({
			["Name"] = "Grid",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 20),
			["Size"] = UDim2.new(1, 0, 1, -20),
			["Parent"] = v288
		})
		local v291 = #v_u_237 / 2
		local v292 = math.ceil(v291)
		for v293, v294 in v_u_237 do
			local v295 = v293 <= v292 and 0 or 1
			local v296
			if v293 <= v292 then
				v296 = v293 - 1
			else
				v296 = v293 - v292 - 1
			end
			local v297 = v_u_7.frame({
				["Position"] = UDim2.new(v295 * 0.5, v295 * 6, 0, v296 * 25),
				["Size"] = UDim2.new(0.5, -6, 0, 25),
				["Parent"] = v290
			})
			v_u_7.label({
				["Text"] = nil,
				["Font"] = nil,
				["TextSize"] = 10,
				["TextColor3"] = nil,
				["Size"] = nil,
				["TextTruncate"] = nil,
				["Parent"] = nil,
				["Text"] = string.upper(v294[1]),
				["Font"] = v_u_13.Bold,
				["TextColor3"] = v_u_12.TextFaint,
				["Size"] = UDim2.new(1, 0, 0, 11),
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["Parent"] = v297
			})
			v_u_27[v293] = v_u_7.label({
				["Text"] = "-",
				["TextSize"] = 13,
				["Font"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["TextTruncate"] = nil,
				["Parent"] = nil,
				["Font"] = v_u_13.Medium,
				["Position"] = UDim2.fromOffset(0, 10),
				["Size"] = UDim2.new(1, 0, 0, 14),
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["Parent"] = v297
			})
		end
		local v298 = v_u_77(v287, 2, 0.27, -5, "Teleport / matchmaking fails \194\183 last hour")
		v_u_28 = v_u_7.label({
			["Text"] = "-",
			["Font"] = nil,
			["TextSize"] = 24,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Position"] = UDim2.fromOffset(0, 20),
			["Size"] = UDim2.new(1, 0, 0, 28),
			["Parent"] = v298
		})
		v_u_29 = v_u_7.label({
			["Text"] = "",
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["Position"] = UDim2.fromOffset(0, 48),
			["Size"] = UDim2.new(1, 0, 0, 13),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v298
		})
		v_u_30 = v_u_7.scroll({
			["Name"] = "Fails",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 66),
			["Size"] = UDim2.new(1, 0, 1, -66),
			["Parent"] = v298
		}, 2)
		local v299, v300 = v_u_77(v287, 3, 0.36, -5, "Errors")
		v_u_31 = v300
		v_u_32 = v_u_7.scroll({
			["Name"] = "Errors",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 20),
			["Size"] = UDim2.new(1, 0, 1, -20),
			["Parent"] = v299
		}, 4)
	end
end
local function v_u_308(p302, p303, p304, p305, p306, p307) -- name: line
	-- upvalues: (copy) v_u_7, (copy) v_u_12
	return v_u_7.label({
		["Text"] = p304,
		["TextSize"] = p306 or 12,
		["TextColor3"] = p305 or v_u_12.Text,
		["Size"] = UDim2.new(1, -6, 0, p307 or 16),
		["TextTruncate"] = Enum.TextTruncate.AtEnd,
		["LayoutOrder"] = p303,
		["Parent"] = p302
	})
end
local function v_u_342(p309, _) -- name: renderFails
	-- upvalues: (copy) v_u_70, (ref) v_u_30, (ref) v_u_28, (copy) v_u_12, (ref) v_u_29, (copy) v_u_308
	v_u_70(v_u_30)
	local v310
	if p309 then
		v310 = p309.n
	else
		v310 = p309
	end
	local v311 = tonumber(v310) or 0
	local v312 = v311 ~= v311 and 0 or v311
	v_u_28.Text = tostring(v312)
	local v313 = v_u_28
	local v314 = v312 >= 10 and 2 or (v312 > 0 and 1 or 0)
	local v315
	if v314 >= 2 then
		v315 = v_u_12.Red
	elseif v314 == 1 then
		v315 = v_u_12.Accent
	else
		v315 = v_u_12.Text
	end
	v313.TextColor3 = v315
	v_u_29.Text = p309 and p309.global and "all servers (shared store)" or "this server only (store unavailable)"
	local v316 = 0
	local v317 = p309 and (p309.reasons or {}) or {}
	if #v317 == 0 then
		v_u_308(v_u_30, 1, "No failures in the last hour.", v_u_12.Green)
	else
		for _, v318 in v317 do
			v316 = v316 + 1
			local v319 = v_u_308
			local v320 = v_u_30
			local v321 = string.format
			local v322 = v318.k
			local v323 = tostring(v322)
			local v324 = v318.c
			local v325 = tonumber(v324) or 0
			v319(v320, v316, v321("%s  \195\151%d", v323, v325 ~= v325 and 0 or v325), v_u_12.Accent)
		end
		local v326 = v316 + 1
		v_u_308(v_u_30, v326, "RECENT", v_u_12.TextFaint, 11, 18)
		for _, v327 in p309.last or {} do
			v326 = v326 + 1
			local v328 = v_u_308
			local v329 = v_u_30
			local v330 = string.format
			local v331 = v327.t
			local v332 = os.date
			local v333 = tonumber(v331) or 0
			local v334 = v333 ~= v333 and 0 or v333
			local v335 = math.floor(v334)
			local v336, v337 = pcall(v332, "%H:%M:%S", v335)
			local v338 = (not v336 or type(v337) ~= "string") and "--:--" or v337
			local v339 = v327.k
			local v340 = tostring(v339)
			local v341 = v327.r or "?"
			v328(v329, v326, v330("%s  %s  (%s)", v338, v340, (tostring(v341))), v_u_12.TextDim, 11)
		end
	end
end
local function v_u_364(p343, p344, p345, p346) -- name: errorEntry
	-- upvalues: (copy) v_u_7, (ref) v_u_32, (copy) v_u_12, (copy) v_u_57
	local v347 = v_u_7.frame({
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ClipsDescendants"] = true,
		["Parent"] = nil,
		["Size"] = UDim2.new(1, -6, 0, 44),
		["LayoutOrder"] = p343,
		["Parent"] = v_u_32
	})
	local v348 = v_u_7.label
	local v349 = {
		["Text"] = nil,
		["TextSize"] = 12,
		["TextColor3"] = nil,
		["TextWrapped"] = true,
		["TextYAlignment"] = nil,
		["Size"] = nil,
		["Parent"] = nil
	}
	local v350 = p344.m or "?"
	v349.Text = tostring(v350)
	local v351
	if p346 then
		v351 = v_u_12.Accent
	else
		v351 = v_u_12.Text
	end
	v349.TextColor3 = v351
	v349.TextYAlignment = Enum.TextYAlignment.Top
	v349.Size = UDim2.new(1, 0, 0, 28)
	v349.Parent = v347
	v348(v349)
	local v352 = string.format
	local v353 = p344.c
	local v354 = tonumber(v353) or 0
	local v355 = v354 ~= v354 and 0 or v354
	local v356 = p344.t
	local v357 = tonumber(v356) or 0
	local v358 = v357 ~= v357 and 0 or v357
	local v359 = v352("\195\151%d \194\183 %s", v355, v358 <= 0 and "-" or v_u_57(p345 - v358) .. " ago")
	if p344.s and p344.s ~= "" then
		local v360 = p344.s
		v359 = v359 .. " \194\183 " .. tostring(v360)
	end
	local v361 = v_u_7.label
	local v362 = {
		["Text"] = nil,
		["TextSize"] = 11,
		["TextColor3"] = nil,
		["TextTruncate"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Parent"] = nil,
		["Text"] = v359
	}
	local v363
	if p346 then
		v363 = v_u_12.TextFaint
	else
		v363 = v_u_12.Red
	end
	v362.TextColor3 = v363
	v362.TextTruncate = Enum.TextTruncate.AtEnd
	v362.Position = UDim2.fromOffset(0, 29)
	v362.Size = UDim2.new(1, 0, 0, 13)
	v362.Parent = v347
	v361(v362)
end
local function v_u_375(p365, p366) -- name: renderErrors
	-- upvalues: (copy) v_u_70, (ref) v_u_32, (copy) v_u_308, (copy) v_u_12, (copy) v_u_364
	v_u_70(v_u_32)
	local v367 = p365.e
	local v368 = type(v367) == "table" and (p365.e or {}) or {}
	local v369 = p365.w
	local v370 = type(v369) == "table" and (p365.w or {}) or {}
	local v371 = 0
	if #v368 == 0 then
		v371 = v371 + 1
		v_u_308(v_u_32, v371, "No script errors since start.", v_u_12.Green)
	else
		for _, v372 in v368 do
			v371 = v371 + 1
			v_u_364(v371, v372, p366, false)
		end
	end
	if #v370 > 0 then
		local v373 = v371 + 1
		v_u_308(v_u_32, v373, "WARNINGS", v_u_12.TextFaint, 11, 18)
		for _, v374 in v370 do
			v373 = v373 + 1
			v_u_364(v373, v374, p366, true)
		end
	end
end
v_u_41 = function(p376)
	-- upvalues: (ref) v_u_19, (ref) v_u_35, (copy) v_u_22, (copy) v_u_12, (copy) v_u_14, (ref) v_u_37, (copy) v_u_24, (copy) v_u_84, (copy) v_u_57, (ref) v_u_25, (ref) v_u_26, (ref) v_u_31, (copy) v_u_237, (copy) v_u_27, (copy) v_u_375, (copy) v_u_342
	if not v_u_19 then
		return
	end
	v_u_35 = p376
	local v377 = p376.at
	local v378 = tonumber(v377) or 0
	local v379 = v378 ~= v378 and 0 or v378
	local v380 = p376.servers
	local v381 = type(v380) == "table" and (p376.servers or {}) or {}
	local v382 = p376.totals
	local v383 = type(v382) == "table" and (p376.totals or {}) or {}
	local v384 = p376.fails
	local v385 = type(v384) == "table" and (p376.fails or {}) or {}
	local v386 = v383.lobbies
	local v387 = tonumber(v386) or 0
	local v388 = v387 ~= v387 and 0 or v387
	local v389 = string.format
	local v390 = v383.lobbyPlayers
	local v391 = tonumber(v390) or 0
	local v392, v393 = v389("%d players", v391 ~= v391 and 0 or v391)
	local v394 = v_u_22.lobbies
	if v394 then
		v394.v.Text = tostring(v388)
		local v395 = v394.v
		local v396 = v393 or 0
		local v397
		if v396 >= 2 then
			v397 = v_u_12.Red
		elseif v396 == 1 then
			v397 = v_u_12.Accent
		else
			v397 = v_u_12.Text
		end
		v395.TextColor3 = v397
		v394.s.Text = v392
	end
	local v398 = v383.matches
	local v399 = tonumber(v398) or 0
	local v400 = v399 ~= v399 and 0 or v399
	local v401 = string.format
	local v402 = v383.matchPlayers
	local v403 = tonumber(v402) or 0
	local v404 = v403 ~= v403 and 0 or v403
	local v405 = v383.bots
	local v406 = tonumber(v405) or 0
	local v407, v408 = v401("%d players \194\183 %d bots", v404, v406 ~= v406 and 0 or v406)
	local v409 = v_u_22.matches
	if v409 then
		v409.v.Text = tostring(v400)
		local v410 = v409.v
		local v411 = v408 or 0
		local v412
		if v411 >= 2 then
			v412 = v_u_12.Red
		elseif v411 == 1 then
			v412 = v_u_12.Accent
		else
			v412 = v_u_12.Text
		end
		v410.TextColor3 = v412
		v409.s.Text = v407
	end
	local v413 = v383.players
	local v414 = tonumber(v413) or 0
	local v415 = v414 ~= v414 and 0 or v414
	local v416 = string.format
	local v417 = v383.mobile
	local v418 = tonumber(v417) or 0
	local v419 = v418 ~= v418 and 0 or v418
	local v420 = v383.pc
	local v421 = tonumber(v420) or 0
	local v422 = v421 ~= v421 and 0 or v421
	local v423 = v383.searching
	local v424 = tonumber(v423) or 0
	local v425, v426 = v416("%d mobile \194\183 %d desktop \194\183 %d searching", v419, v422, v424 ~= v424 and 0 or v424)
	local v427 = v_u_22.players
	if v427 then
		v427.v.Text = tostring(v415)
		local v428 = v427.v
		local v429 = v426 or 0
		local v430
		if v429 >= 2 then
			v430 = v_u_12.Red
		elseif v429 == 1 then
			v430 = v_u_12.Accent
		else
			v430 = v_u_12.Text
		end
		v428.TextColor3 = v430
		v427.s.Text = v425
	end
	local v431 = p376.matches
	local v432 = type(v431) == "table" and (p376.matches or {}) or {}
	local v433 = v432.h24
	local v434 = type(v433) == "table" and (v432.h24 or {}) or {}
	local v435 = v432.h1
	local v436 = type(v435) == "table" and (v432.h1 or {}) or {}
	local v437 = v434.real
	local v438 = tonumber(v437) or 0
	local v439 = v438 ~= v438 and 0 or v438
	local v440
	if v439 > 0 then
		local v441 = string.format
		local v442 = v434.s1
		local v443 = tonumber(v442) or 0
		local v444 = (v443 ~= v443 and 0 or v443) / v439 * 100 + 0.5
		local v445 = math.floor(v444)
		local v446 = v434.s2
		local v447 = tonumber(v446) or 0
		local v448 = (v447 ~= v447 and 0 or v447) / v439 * 100 + 0.5
		local v449 = math.floor(v448)
		local v450 = v434.s4
		local v451 = tonumber(v450) or 0
		local v452 = (v451 ~= v451 and 0 or v451) / v439 * 100 + 0.5
		v440 = v441(" \194\183 S/D/Q %d/%d/%d%%", v445, v449, (math.floor(v452)))
	else
		v440 = ""
	end
	local v453 = v434.n
	local v454 = tonumber(v453) or 0
	local v455
	if (v454 ~= v454 and 0 or v454) > 0 then
		local v456 = string.format
		local v457 = "%.1f"
		local v458 = v434.n
		local v459 = tonumber(v458) or 0
		local v460
		if (v459 ~= v459 and 0 or v459) > 0 then
			local v461 = v434.real
			local v462 = tonumber(v461) or 0
			local v463 = v462 ~= v462 and 0 or v462
			local v464 = v434.n
			local v465 = tonumber(v464) or 0
			v460 = v463 / (v465 ~= v465 and 0 or v465)
		else
			v460 = 0
		end
		v455 = v456(v457, v460)
	else
		v455 = "\226\128\148"
	end
	local v466 = string.format
	local v467 = "1h: %.1f (%d) \194\183 24h: %d matches, max %d%s"
	local v468 = v436.n
	local v469 = tonumber(v468) or 0
	local v470
	if (v469 ~= v469 and 0 or v469) > 0 then
		local v471 = v436.real
		local v472 = tonumber(v471) or 0
		local v473 = v472 ~= v472 and 0 or v472
		local v474 = v436.n
		local v475 = tonumber(v474) or 0
		v470 = v473 / (v475 ~= v475 and 0 or v475)
	else
		v470 = 0
	end
	local v476 = v436.n
	local v477 = tonumber(v476) or 0
	local v478 = v477 ~= v477 and 0 or v477
	local v479 = v434.n
	local v480 = tonumber(v479) or 0
	local v481 = v480 ~= v480 and 0 or v480
	local v482 = v434.mx
	local v483 = tonumber(v482) or 0
	local v484, v485 = v466(v467, v470, v478, v481, v483 ~= v483 and 0 or v483, v440)
	local v486 = v_u_22.realavg
	if v486 then
		v486.v.Text = tostring(v455)
		local v487 = v486.v
		local v488 = v485 or 0
		local v489
		if v488 >= 2 then
			v489 = v_u_12.Red
		elseif v488 == 1 then
			v489 = v_u_12.Accent
		else
			v489 = v_u_12.Text
		end
		v487.TextColor3 = v489
		v486.s.Text = v484
	end
	local v490 = v385.reasons
	if v490 then
		v490 = v385.reasons[1]
	end
	local v491 = v385.n
	local v492 = tonumber(v491) or 0
	local v493 = v492 ~= v492 and 0 or v492
	local v494
	if v490 then
		local v495 = string.format
		local v496 = v490.k
		local v497 = tostring(v496)
		local v498 = v490.c
		local v499 = tonumber(v498) or 0
		v494 = v495("top: %s \195\151%d", v497, v499 ~= v499 and 0 or v499)
	else
		v494 = "none"
	end
	local v500 = v385.n
	local v501 = tonumber(v500) or 0
	local v502 = v501 ~= v501 and 0 or v501
	local v503 = v502 >= 10 and 2 or (v502 > 0 and 1 or 0)
	local v504 = v_u_22.fails
	if v504 then
		v504.v.Text = tostring(v493)
		local v505 = v504.v
		local v506 = v503 or 0
		local v507
		if v506 >= 2 then
			v507 = v_u_12.Red
		elseif v506 == 1 then
			v507 = v_u_12.Accent
		else
			v507 = v_u_12.Text
		end
		v505.TextColor3 = v507
		v504.s.Text = v494
	end
	local v508 = v383.errors
	local v509 = tonumber(v508) or 0
	local v510 = v509 ~= v509 and 0 or v509
	local v511 = string.format
	local v512 = v383.errServers
	local v513 = tonumber(v512) or 0
	local v514 = v511("on %d server(s)", v513 ~= v513 and 0 or v513)
	local v515 = v383.errors
	local v516 = tonumber(v515) or 0
	local v517 = v516 ~= v516 and 0 or v516
	local v518 = v517 >= 50 and 2 or (v517 > 0 and 1 or 0)
	local v519 = v_u_22.errors
	if v519 then
		v519.v.Text = tostring(v510)
		local v520 = v519.v
		local v521 = v518 or 0
		local v522
		if v521 >= 2 then
			v522 = v_u_12.Red
		elseif v521 == 1 then
			v522 = v_u_12.Accent
		else
			v522 = v_u_12.Text
		end
		v520.TextColor3 = v522
		v519.s.Text = v514
	end
	local v523 = v383.stale
	local v524 = tonumber(v523) or 0
	local v525 = v524 ~= v524 and 0 or v524
	local v526 = string.format("no heartbeat > %ds", v_u_14.StaleAfter or 65)
	local v527 = v383.stale
	local v528 = tonumber(v527) or 0
	local v529 = (v528 ~= v528 and 0 or v528) > 0 and 2 or 0
	local v530 = v_u_22.stale
	if v530 then
		v530.v.Text = tostring(v525)
		local v531 = v530.v
		local v532 = v529 or 0
		local v533
		if v532 >= 2 then
			v533 = v_u_12.Red
		elseif v532 == 1 then
			v533 = v_u_12.Accent
		else
			v533 = v_u_12.Text
		end
		v531.TextColor3 = v533
		v530.s.Text = v526
	end
	local v534 = nil
	local v535 = nil
	for _, v536 in v381 do
		if v536.me then
			v535 = v536
		end
		if not v_u_37 or v536.id ~= v_u_37 then
			continue
		end
		v534 = v536
	end
	local v537 = v534 or (v535 or v381[1])
	local v538
	if v537 then
		v538 = v537.id or nil
	else
		v538 = nil
	end
	v_u_37 = v538
	for v539, v540 in v381 do
		local v541 = v_u_24[v539]
		if not v541 then
			v541 = v_u_84(v539)
			v_u_24[v539] = v541
		end
		v541.id = v540.id
		v541.btn.Visible = true
		v541.btn.BackgroundTransparency = v540.id == v_u_37 and 0.55 or 1
		local v542 = v541.cells
		local v543 = v542.role
		local v544 = v540.r
		v543.Text = string.upper((tostring(v544 or "?")))
		local v545 = v542.role
		local v546 = v540.r
		local v547
		if v546 == "Lobby" then
			v547 = v_u_12.Blue
		elseif v546 == "Match" then
			v547 = v_u_12.Accent
		else
			v547 = v_u_12.Text
		end
		v545.TextColor3 = v547
		local v548 = v540.id or "?"
		local v549 = tostring(v548)
		local v550 = string.sub(v549, 1, 8)
		local v551 = v542.id
		if v540.me then
			v550 = "\194\187 " .. v550
		end
		v551.Text = v550
		local v552 = v542.id
		local v553
		if v540.me then
			v553 = v_u_12.White
		else
			v553 = v_u_12.TextDim
		end
		v552.TextColor3 = v553
		local v554 = v542.players
		local v555 = string.format
		local v556 = v540.n
		local v557 = tonumber(v556) or 0
		local v558 = v557 ~= v557 and 0 or v557
		local v559 = v540.mx
		local v560 = tonumber(v559) or 0
		v554.Text = v555("%d/%d", v558, v560 ~= v560 and 0 or v560)
		local v561 = v542.players
		local v562 = v540.mx
		local v563 = tonumber(v562) or 0
		local v564
		if (v563 ~= v563 and 0 or v563) > 0 then
			local v565 = v540.n
			local v566 = tonumber(v565) or 0
			local v567 = v566 ~= v566 and 0 or v566
			local v568 = v540.mx
			local v569 = tonumber(v568) or 0
			if (v569 ~= v569 and 0 or v569) <= v567 then
				v564 = v_u_12.Accent
			else
				v564 = v_u_12.Text
			end
		else
			v564 = v_u_12.Text
		end
		v561.TextColor3 = v564
		local v570 = v542.bots
		local v571 = v540.b
		local v572 = tonumber(v571) or 0
		local v573 = v572 ~= v572 and 0 or v572
		v570.Text = tostring(v573)
		v542.bots.TextColor3 = v_u_12.TextDim
		local v574 = v542.phase
		local v575
		if v540.ph and v540.ph ~= "" then
			local v576 = v540.ph
			v575 = tostring(v576)
		else
			v575 = "-"
		end
		v574.Text = v575
		v542.phase.TextColor3 = v_u_12.Text
		v542.up.Text = v_u_57(v540.up)
		v542.up.TextColor3 = v_u_12.TextDim
		local v577 = v540.fps
		local v578 = tonumber(v577) or 0
		local v579 = v578 ~= v578 and 0 or v578
		v542.fps.Text = v579 <= 0 and "-" or string.format("%.0f", v579)
		local v580 = v542.fps
		local v581 = v579 <= 0 and 0 or (v579 < 25 and 2 or (v579 < 45 and 1 or 0))
		local v582
		if v581 >= 2 then
			v582 = v_u_12.Red
		elseif v581 == 1 then
			v582 = v_u_12.Accent
		else
			v582 = v_u_12.Text
		end
		v580.TextColor3 = v582
		local v583 = v542.mem
		local v584 = string.format
		local v585 = v540.mem
		local v586 = tonumber(v585) or 0
		v583.Text = v584("%d MB", v586 ~= v586 and 0 or v586)
		local v587 = v542.mem
		local v588 = v540.mem
		local v589 = tonumber(v588) or 0
		local v590 = v589 ~= v589 and 0 or v589
		local v591 = v590 >= 5000 and 2 or (v590 >= 3000 and 1 or 0)
		local v592
		if v591 >= 2 then
			v592 = v_u_12.Red
		elseif v591 == 1 then
			v592 = v_u_12.Accent
		else
			v592 = v_u_12.Text
		end
		v587.TextColor3 = v592
		local v593 = v542.ping
		local v594 = v540.n
		local v595 = tonumber(v594) or 0
		local v596
		if (v595 ~= v595 and 0 or v595) > 0 then
			local v597 = string.format
			local v598 = v540.png
			local v599 = tonumber(v598) or 0
			v596 = v597("%d ms", v599 ~= v599 and 0 or v599)
		else
			v596 = "-"
		end
		v593.Text = v596
		local v600 = v542.ping
		local v601 = v540.png
		local v602 = tonumber(v601) or 0
		local v603 = v602 ~= v602 and 0 or v602
		local v604 = v603 >= 300 and 2 or (v603 >= 150 and 1 or 0)
		local v605
		if v604 >= 2 then
			v605 = v_u_12.Red
		elseif v604 == 1 then
			v605 = v_u_12.Accent
		else
			v605 = v_u_12.Text
		end
		v600.TextColor3 = v605
		if v540.me then
			v542.hb.Text = "live"
			v542.hb.TextColor3 = v_u_12.Green
		else
			local v606 = v540.age
			local v607 = tonumber(v606) or 0
			local v608 = v607 ~= v607 and 0 or v607
			local v609 = v542.hb
			local v610
			if (v_u_14.StaleAfter or 65) < v608 then
				v610 = "STALE " .. v_u_57(v608)
			else
				v610 = v_u_57(v608) .. " ago"
			end
			v609.Text = v610
			local v611 = v542.hb
			local v612 = (v_u_14.StaleAfter or 65) < v608 and 2 or (v608 > 45 and 1 or 0)
			local v613
			if v612 >= 2 then
				v613 = v_u_12.Red
			elseif v612 == 1 then
				v613 = v_u_12.Accent
			else
				v613 = v_u_12.Text
			end
			v611.TextColor3 = v613
		end
		local v614 = v542.err
		local v615 = v540.ec
		local v616 = tonumber(v615) or 0
		local v617 = v616 ~= v616 and 0 or v616
		v614.Text = tostring(v617)
		local v618 = v542.err
		local v619 = v540.ec
		local v620 = tonumber(v619) or 0
		local v621 = v620 ~= v620 and 0 or v620
		local v622 = v621 >= 50 and 2 or (v621 > 0 and 1 or 0)
		local v623
		if v622 >= 2 then
			v623 = v_u_12.Red
		elseif v622 == 1 then
			v623 = v_u_12.Accent
		else
			v623 = v_u_12.Text
		end
		v618.TextColor3 = v623
		local v624 = v540.tp
		local v625 = tonumber(v624) or 0
		local v626 = v625 ~= v625 and 0 or v625
		local v627 = v540.mm
		local v628 = tonumber(v627) or 0
		local v629 = v626 + (v628 ~= v628 and 0 or v628)
		v542.tp.Text = tostring(v629)
		local v630 = v542.tp
		local v631 = v629 >= 5 and 2 or (v629 > 0 and 1 or 0)
		local v632
		if v631 >= 2 then
			v632 = v_u_12.Red
		elseif v631 == 1 then
			v632 = v_u_12.Accent
		else
			v632 = v_u_12.Text
		end
		v630.TextColor3 = v632
	end
	for v633 = #v381 + 1, #v_u_24 do
		v_u_24[v633].btn.Visible = false
		v_u_24[v633].id = nil
	end
	v_u_25.Visible = #v381 == 0
	v_u_25.Text = "No servers reported yet."
	if v537 then
		local v634 = v537.id or "?"
		local v635 = tostring(v634)
		local v636 = string.sub(v635, 1, 8)
		v_u_26.Text = string.upper(v537.me and "Server details \194\183 this server (live)" or "Server details \194\183 " .. v636)
		v_u_31.Text = string.upper("Errors \194\183 " .. (v537.me and "this server" or v636))
		for v637, v638 in v_u_237 do
			local v639 = v638[2]
			local v640, v641, v642 = pcall(v639, v537, v379)
			local v643 = v_u_27[v637]
			if not v643 then
				continue
			end
			v643.Text = not v640 and "-" or tostring(v641)
			local v644 = v640 and (v642 or 0) or 0
			local v645
			if v644 >= 2 then
				v645 = v_u_12.Red
			elseif v644 == 1 then
				v645 = v_u_12.Accent
			else
				v645 = v_u_12.Text
			end
			v643.TextColor3 = v645
		end
		v_u_375(v537, v379)
	end
	v_u_342(v385, v379)
end
local function v_u_652() -- name: updateStatus
	-- upvalues: (ref) v_u_20, (ref) v_u_36, (copy) v_u_57, (copy) v_u_14, (ref) v_u_35
	if v_u_20 then
		local v646 = {}
		if v_u_36 >= 0 then
			local v647 = "Updated " .. v_u_57(os.clock() - v_u_36) .. " ago"
			table.insert(v646, v647)
		else
			table.insert(v646, "Loading...")
		end
		local v648 = string.format
		local v649 = v_u_14.AutoRefresh or 10
		table.insert(v646, v648("auto %ds", v649))
		if v_u_35 then
			if v_u_35.studio then
				table.insert(v646, "Studio: this server only")
			elseif v_u_35.ok ~= true then
				table.insert(v646, "MemoryStore unavailable: this server only")
			end
			if v_u_35.error then
				local v650 = v_u_35.error
				local v651 = tostring(v650)
				table.insert(v646, v651)
			end
		end
		v_u_20.Text = table.concat(v646, "  \194\183  ")
	end
end
local function v_u_657(p_u_653) -- name: query
	-- upvalues: (copy) v_u_9
	local v_u_654 = v_u_9.remote("AdminQuery")
	if v_u_654 and v_u_654:IsA("RemoteFunction") then
		local v655, v656 = pcall(function()
			-- upvalues: (copy) v_u_654, (copy) p_u_653
			return v_u_654:InvokeServer(p_u_653)
		end)
		if v655 then
			return v656
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_661() -- name: askAdmin
	-- upvalues: (ref) v_u_39, (ref) v_u_40, (copy) v_u_9, (copy) v_u_657
	if v_u_39 ~= nil then
		return v_u_39
	end
	if os.clock() - v_u_40 < 3 then
		return false
	end
	v_u_40 = os.clock()
	local v658 = v_u_9.remote("AdminQuery")
	if not (v658 and v658:IsA("RemoteFunction")) then
		return false
	end
	local v659 = v_u_657({
		["op"] = "hello"
	})
	local v660
	if type(v659) == "table" then
		v660 = v659.admin == true
	else
		v660 = false
	end
	v_u_39 = v660
	return v_u_39
end
function v_u_15.refresh() -- name: refresh
	-- upvalues: (ref) v_u_38, (ref) v_u_33, (ref) v_u_21, (copy) v_u_7, (copy) v_u_657, (ref) v_u_20, (ref) v_u_36, (ref) v_u_41, (copy) v_u_652
	if v_u_38 or not v_u_33 then
		return
	else
		v_u_38 = true
		if v_u_21 then
			v_u_7.setDisabled(v_u_21, true)
		end
		local v662 = v_u_657({
			["op"] = "snapshot"
		})
		v_u_38 = false
		if v_u_21 then
			task.delay(1.5, function()
				-- upvalues: (ref) v_u_7, (ref) v_u_21
				v_u_7.setDisabled(v_u_21, false)
			end)
		end
		if type(v662) == "table" then
			if v662.error == "rate" then
				return
			elseif v662.error and not v662.servers then
				if v_u_20 then
					local v663 = v_u_20
					local v664 = v662.error
					v663.Text = "Error: " .. tostring(v664)
				end
			else
				v_u_36 = os.clock()
				local v665 = v_u_41
				local v666, v667 = pcall(v665, v662)
				if not v666 then
					warn("[UI_Admin] render: " .. tostring(v667))
				end
				v_u_652()
			end
		else
			if v_u_20 then
				v_u_20.Text = "Request failed (not authorized or server busy)"
			end
			return
		end
	end
end
function v_u_15.open() -- name: open
	-- upvalues: (ref) v_u_33, (copy) v_u_301, (ref) v_u_18, (copy) v_u_9, (copy) v_u_67, (ref) v_u_34, (copy) v_u_15, (copy) v_u_14, (copy) v_u_652
	if not v_u_33 then
		v_u_301()
		v_u_33 = true
		v_u_18.gui.Enabled = true
		v_u_9.cursor("UI_Admin", true)
		v_u_67()
		v_u_34 = v_u_34 + 1
		local v_u_668 = v_u_34
		task.spawn(v_u_15.refresh)
		task.spawn(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_33, (ref) v_u_34, (copy) v_u_668, (ref) v_u_652, (ref) v_u_15
			local v669 = os.clock() + (v_u_14.AutoRefresh or 10)
			while v_u_33 and v_u_34 == v_u_668 do
				task.wait(1)
				if not v_u_33 or v_u_34 ~= v_u_668 then
					break
				end
				v_u_652()
				if v669 > os.clock() then
					continue
				end
				v669 = os.clock() + (v_u_14.AutoRefresh or 10)
				task.spawn(v_u_15.refresh)
			end
		end)
	end
end
function v_u_15.close() -- name: close
	-- upvalues: (ref) v_u_33, (ref) v_u_34, (ref) v_u_18, (copy) v_u_9
	if v_u_33 then
		v_u_33 = false
		local v670 = script:FindFirstChild("Devices")
		if v670 then
			local v671 = require
			local v672, v673 = pcall(v671, v670)
			if v672 and (v673 and v673.close) then
				local v674 = v673.close
				pcall(v674)
			end
		end
		v_u_34 = v_u_34 + 1
		if v_u_18 then
			v_u_18.gui.Enabled = false
		end
		v_u_9.cursor("UI_Admin", false)
	end
end
function v_u_15.isOpen() -- name: isOpen
	-- upvalues: (ref) v_u_33
	return v_u_33
end
function v_u_15.preview(p675) -- name: preview
	-- upvalues: (copy) v_u_301, (ref) v_u_33, (ref) v_u_18, (copy) v_u_67, (ref) v_u_36, (ref) v_u_41, (copy) v_u_652
	v_u_301()
	v_u_33 = true
	v_u_18.gui.Enabled = true
	v_u_67()
	v_u_36 = os.clock()
	v_u_41(p675)
	v_u_652()
	return v_u_18.gui
end
local function v_u_676() -- name: tryOpen
	-- upvalues: (ref) v_u_33, (copy) v_u_661, (copy) v_u_15
	if not v_u_33 then
		if v_u_661() then
			v_u_15.open()
		end
	end
end
local v_u_677 = {
	[Enum.KeyCode.LeftControl] = Enum.KeyCode.RightControl,
	[Enum.KeyCode.RightControl] = Enum.KeyCode.LeftControl,
	[Enum.KeyCode.LeftShift] = Enum.KeyCode.RightShift,
	[Enum.KeyCode.RightShift] = Enum.KeyCode.LeftShift,
	[Enum.KeyCode.LeftAlt] = Enum.KeyCode.RightAlt,
	[Enum.KeyCode.RightAlt] = Enum.KeyCode.LeftAlt
}
local function v_u_683() -- name: parseHotkey
	-- upvalues: (copy) v_u_14
	local v678 = v_u_14.Hotkey
	local v679 = {}
	for _, v_u_680 in type(v678) == "table" and v_u_14.Hotkey or { "LeftControl", "LeftShift", "F7" } do
		local v681, v682 = pcall(function()
			-- upvalues: (copy) v_u_680
			return Enum.KeyCode[v_u_680]
		end)
		if not (v681 and v682) then
			continue
		end
		table.insert(v679, v682)
	end
	return table.remove(v679), v679
end
function v_u_15.init() -- name: init end
function v_u_15.start() -- name: start
	-- upvalues: (copy) v_u_9, (copy) v_u_683, (copy) v_u_3, (copy) v_u_677, (ref) v_u_33, (copy) v_u_15, (copy) v_u_676, (ref) v_u_39, (copy) v_u_4, (copy) v_u_1
	if v_u_9.live then
		local v_u_684, v_u_685 = v_u_683()
		if v_u_684 then
			v_u_3.InputBegan:Connect(function(p686, p687)
				-- upvalues: (copy) v_u_684, (ref) v_u_3, (copy) v_u_685, (ref) v_u_677, (ref) v_u_33, (ref) v_u_15, (ref) v_u_676
				if p686.KeyCode == v_u_684 and not (p687 or v_u_3:GetFocusedTextBox()) then
					for _, v688 in v_u_685 do
						local v689 = v_u_677[v688]
						if v_u_3:IsKeyDown(v688) or v689 and v_u_3:IsKeyDown(v689) then
							continue
						end
						return
					end
					if v_u_33 then
						v_u_15.close()
					else
						task.spawn(v_u_676)
					end
				else
					return
				end
			end)
		end
		v_u_9.on("AdminOpen", function()
			-- upvalues: (ref) v_u_39, (ref) v_u_15
			v_u_39 = true
			v_u_15.open()
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_1, (ref) v_u_676
			local v690 = v_u_4:FindFirstChild("DZAdminCommand", true)
			local v691 = os.clock()
			while not v690 and os.clock() - v691 < 60 do
				task.wait(2)
				v690 = v_u_4:FindFirstChild("DZAdminCommand", true)
			end
			if v690 and v690:IsA("TextChatCommand") then
				v690.Triggered:Connect(function(p692)
					-- upvalues: (ref) v_u_1, (ref) v_u_676
					local v693 = v_u_1.LocalPlayer
					if v693 and (p692 and p692.UserId == v693.UserId) then
						task.spawn(v_u_676)
					end
				end)
			end
		end)
	end
end
return v_u_15