-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Config.VehicleConfig

local v_u_1 = {
	["MassScale"] = 0.1575,
	["ModelScale"] = 1.2,
	["SpawnPhases"] = {
		["Plane"] = true,
		["Match"] = true
	},
	["DespawnPhases"] = {
		["Lobby"] = true,
		["Staging"] = true
	},
	["SpawnBatch"] = 6,
	["EnterDistance"] = 3,
	["EnterMaxSpeed"] = 25,
	["ExitSafeSpeed"] = 40,
	["ExitDamagePerKmh"] = 1,
	["SeatSwitchCooldown"] = 0.5,
	["ActionCooldown"] = 0.25,
	["HornCooldown"] = 0.5,
	["Recline"] = 8,
	["Ride"] = {
		["CarLegs"] = 90,
		["BikeLegs"] = 14,
		["BikeLegsPassenger"] = 34,
		["BikeSplay"] = 14,
		["PassengerArms"] = nil,
		["BikePassengerArms"] = nil,
		["GripTurnMax"] = 100,
		["GripSlideBack"] = 0.4,
		["GripSlideOut"] = 0.3,
		["PassengerArms"] = { 38, 10 },
		["BikePassengerArms"] = { 28, -8 }
	}
}
local v2 = {
	["DriverCanShoot"] = false,
	["PitchMin"] = -35,
	["PitchMax"] = 65,
	["SoftClamp"] = 12,
	["SoftOver"] = 10,
	["ArcTolerance"] = 14,
	["LeanRate"] = 5,
	["LeanOut"] = 2,
	["LeanUp"] = 0.9,
	["LeanRoll"] = 32,
	["LeanOutKind"] = nil,
	["LeanUpKind"] = nil,
	["TwistMax"] = 175,
	["AdsFov"] = 50,
	["CamDistance"] = 0.6,
	["Seats"] = nil,
	["Cabin"] = nil,
	["Windows"] = nil,
	["LeanOutKind"] = {
		["Dacia"] = 2.4,
		["Buggy"] = 1.2
	},
	["LeanUpKind"] = {
		["Dacia"] = 1.4
	}
}
local v3 = {
	["UAZ"] = {
		[2] = {
			["Yaw"] = 90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = 1
		},
		[3] = {
			["Yaw"] = -90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = -1
		},
		[4] = {
			["Yaw"] = 90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = 1
		}
	},
	["Dacia"] = {
		[2] = {
			["Yaw"] = 90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = 1
		},
		[3] = {
			["Yaw"] = -90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = -1
		},
		[4] = {
			["Yaw"] = 90,
			["Half"] = 95,
			["Lean"] = 1,
			["Side"] = 1
		}
	},
	["Buggy"] = {
		[2] = {
			["Yaw"] = 100,
			["Half"] = 115,
			["Lean"] = 0.35,
			["Side"] = 1
		}
	},
	["Motorcycle"] = {
		[2] = {
			["Yaw"] = 180,
			["Half"] = 160,
			["Lean"] = 0,
			["Side"] = 0
		}
	},
	["Boat"] = {
		[2] = {
			["Yaw"] = 90,
			["Half"] = 105,
			["Lean"] = 0,
			["Side"] = 1
		},
		[3] = {
			["Yaw"] = -90,
			["Half"] = 105,
			["Lean"] = 0,
			["Side"] = -1
		},
		[4] = {
			["Yaw"] = 90,
			["Half"] = 105,
			["Lean"] = 0,
			["Side"] = 1
		},
		[5] = {
			["Yaw"] = 0,
			["Half"] = 120,
			["Lean"] = 0,
			["Side"] = 0
		}
	}
}
v2.Seats = v3
v2.Cabin = {
	["UAZ"] = { Vector3.new(0, 1.7, 2.85), Vector3.new(4.5, 2.9, 4.55) },
	["Dacia"] = { Vector3.new(0, 1.5, 1.4), Vector3.new(5, 2.45, 4.2) },
	["Buggy"] = { Vector3.new(0, 0.1, 2.35), Vector3.new(3.6, 0.9, 4.95) },
	["Boat"] = { Vector3.new(0, -0.25, -1.35), Vector3.new(5.4, 1.85, 9.15) }
}
v2.Windows = {
	["Dacia"] = {
		{ Vector3.new(0, 2.525, 0.55), Vector3.new(5.4, 0.975, 5.05) }
	},
	["UAZ"] = {
		{ Vector3.new(0, 3.125, 1.4), Vector3.new(5.4, 1.175, 6.4) }
	},
	["Boat"] = {
		{ Vector3.new(0, 2.1, -3.35), Vector3.new(5.6, 0.7, 1.15) }
	},
	["Buggy"] = {
		{ Vector3.new(0, 2.7, -0.2), Vector3.new(3.9, 1.7, 2.7) }
	}
}
v_u_1.Fire = v2
v_u_1.Exit = {
	["Radius"] = 0.45,
	["Clearance"] = 0.15,
	["MaxDrop"] = 1.6,
	["Lift"] = 0.25,
	["Delay"] = 0.08,
	["InheritSpeed"] = 8,
	["GhostMax"] = 3,
	["RunOverGrace"] = 3,
	["GhostNear"] = 4,
	["GhostMoveKmh"] = 8,
	["GhostMoveMax"] = 2.5,
	["ParkKmh"] = 20
}
v_u_1.FuelMax = 100
v_u_1.StartFuelMin = 35
v_u_1.StartFuelMax = 85
v_u_1.BoostFuelMul = 2
v_u_1.IdleFuelPerMin = 0.15
v_u_1.GasCanFuel = 40
v_u_1.RefuelTime = 5
v_u_1.RefuelMaxSpeed = 2
v_u_1.RefuelDistance = 4
v_u_1.BulletDamageMul = 1
v_u_1.TyreHP = 60
v_u_1.FlatGripMul = 0.55
v_u_1.FlatRadiusMul = 0.78
v_u_1.FlatDragDecel = 0.8
v_u_1.BurnTime = 5
v_u_1.BurnDps = 0
v_u_1.ExplosionRadius = 8
v_u_1.ExplosionDamage = 150
v_u_1.ExplosionOccupantDamage = 250
v_u_1.WreckLifetime = 0
v_u_1.ExplosionFx = {
	["Scale"] = 1.8,
	["Shake"] = 1.4,
	["ShakeRadius"] = 45,
	["ServerSound"] = false
}
v_u_1.ExplosionLOS = true
v_u_1.Ram = {
	["MinSpeed"] = 12
}
v_u_1.RunOver = {
	["MinKmh"] = 15,
	["Curve"] = nil,
	["Cooldown"] = 1,
	["TeamDamage"] = false,
	["History"] = 0.25,
	["Lookahead"] = 0.06,
	["Pad"] = 0.35,
	["VictimAway"] = 4,
	["SelfDamagePerKmh"] = 0.1,
	["Fling"] = 0.45,
	["FlingMax"] = 12,
	["FlingUp"] = 7,
	["ReportSlack"] = 3.5,
	["ReportLag"] = 0.2,
	["ReportRate"] = 10,
	["Curve"] = {
		{ 15, 0 },
		{ 25, 20 },
		{ 40, 65 },
		{ 60, 115 },
		{ 90, 170 }
	}
}
v_u_1.Crash = {
	["MinDeltaV"] = 28,
	["DamagePerKmh"] = 9,
	["OccupantShare"] = 0,
	["SoundMin"] = 18,
	["VerticalMin"] = 70
}
v_u_1.SubmergeDepth = 1
v_u_1.AntiCheat = {
	["Interval"] = 0.5,
	["SpeedTolerance"] = 1.45,
	["SpeedSlack"] = 15,
	["MaxRise"] = 30,
	["Teleport"] = 60,
	["Strikes"] = 3
}
v_u_1.Physics = {
	["MaxDt"] = 0.05,
	["SubstepDt"] = 0.016666666666666666,
	["GripRate"] = 34,
	["LowSpeedHold"] = 0.8,
	["RollDecel"] = 0.35,
	["AirDragDecel"] = 0.5,
	["EngineBrake"] = 1.5,
	["BrakeInitial"] = 0.6,
	["BrakeRamp"] = 0.25,
	["BrakeStop"] = 2,
	["ReverseDelay"] = 0.25,
	["DirSpeed"] = 0.5,
	["YawAssist"] = 8,
	["YawMargin"] = 0.12,
	["HandbrakeYaw"] = 0.35,
	["RollAssist"] = 7,
	["RollAssistStart"] = 16,
	["RollAssistDamp"] = 2.5,
	["AirLevel"] = 2.5,
	["MaxForceG"] = 8,
	["MaxAngAccel"] = 40,
	["PitchRollInertia"] = 6,
	["AirAngDamp"] = 1.2,
	["BumpStop"] = 4,
	["ContactRays"] = 5,
	["ServerContactRays"] = 1,
	["ContactSpread"] = 1,
	["ContactTol"] = 0.6,
	["RayLift"] = 0.5,
	["NormalSmooth"] = 0.05,
	["NormalMix"] = 0.2,
	["NormalMixAngle"] = { 10, 25 },
	["DampFilter"] = 0.015,
	["DampKnee"] = 0.5,
	["DampKneeSlope"] = 0.25,
	["DampMaxLoad"] = 1.6,
	["DampMaxRate"] = 0.8,
	["DampPitchDiv"] = 2,
	["DampRollDiv"] = 3,
	["MaxLoad"] = 5,
	["AntiRollFullDt"] = 0.03333333333333333,
	["BumpZone"] = 0.12,
	["GripLoadTau"] = 0.12,
	["GripLoadMin"] = 0.6,
	["GripLoadMax"] = 2,
	["FlipDelay"] = 3,
	["MountUprightTilt"] = 35,
	["SteerAssist"] = 0.78,
	["SteerAssistTop"] = 0.85,
	["SteerRateMin"] = 0.15,
	["SteerReturn"] = 2.4,
	["HandbrakeSteer"] = 1.8,
	["VisualDroop"] = 0.2,
	["SettleSpeed"] = 0.6,
	["SettleTime"] = 1.5,
	["SurfaceGrip"] = {
		["Sand"] = 0.75,
		["Mud"] = 0.7,
		["Snow"] = 0.6,
		["Ice"] = 0.35,
		["Glacier"] = 0.4,
		["Grass"] = 0.92,
		["LeafyGrass"] = 0.92,
		["Ground"] = 0.94,
		["Salt"] = 0.8,
		["Pebble"] = 0.85,
		["Asphalt"] = 1.05,
		["Concrete"] = 1,
		["Pavement"] = 1,
		["WoodPlanks"] = 0.95,
		["Wood"] = 0.95
	}
}
v_u_1.HandoverMax = 1.5
v_u_1.ParkHold = 1.5
v_u_1.Camera = {
	["Sensitivity"] = 0.0035,
	["PitchMin"] = -50,
	["PitchMax"] = 35,
	["AutoCenterDelay"] = 1.6,
	["AutoCenterSpeed"] = 2.2,
	["AutoCenterMinSpeed"] = 15,
	["Fov"] = 72,
	["FovBoost"] = 78,
	["CollisionPad"] = 0.6,
	["FppYawLimit"] = 120,
	["FppPassengerLift"] = 0.6,
	["FppDriverPitch"] = -10,
	["FppDriverBack"] = 0.25
}
v_u_1.Sounds = {
	["Horn"] = "Horn",
	["Crash"] = "Crash",
	["Explosion"] = "Explosion",
	["Fire"] = "Fire",
	["EngineRange"] = 830,
	["OthersGain"] = nil,
	["OthersRpmFloor"] = 0.8,
	["OthersGain"] = {
		["EngineCar"] = 4.3,
		["EngineMoto"] = 2,
		["EngineBoat"] = 3
	}
}
local v4 = {
	["UAZ"] = {
		["DisplayName"] = "UAZ",
		["Seats"] = 4,
		["HP"] = 2000,
		["Mass"] = 1650,
		["TopSpeed"] = 103,
		["BoostSpeed"] = 116,
		["ReverseSpeed"] = 30,
		["Scale"] = Vector3.new(1.9, 1.3, 1.35),
		["Accel"] = 4.6,
		["BoostAccel"] = 1.25,
		["Brake"] = 12.5,
		["Handbrake"] = 8,
		["Drive"] = "AWD",
		["Grip"] = 1,
		["LatGrip"] = 1.8,
		["HandbrakeGrip"] = 0.55,
		["SteerAngle"] = 41,
		["SteerHighSpeed"] = 0.32,
		["SteerRate"] = 2.6,
		["SpringHz"] = 1.9,
		["Damping"] = 0.4,
		["DampingRebound"] = 0.9,
		["TravelUp"] = 0.4,
		["AntiRoll"] = 0.5,
		["RollCenter"] = 0.72,
		["Downforce"] = 0.2,
		["FuelPerKm"] = 7,
		["RamMul"] = 1,
		["SpawnChance"] = 0.6,
		["AirPitch"] = 0.5,
		["AirRoll"] = 0.3,
		["EngineSound"] = "EngineCar",
		["EnginePitch"] = 0.78,
		["EngineVolume"] = 0.9,
		["Gears"] = 4,
		["Camera"] = {
			["Distance"] = 9.2,
			["Height"] = 3,
			["Fov"] = 72
		}
	},
	["Dacia"] = {
		["DisplayName"] = "Dacia 1300",
		["Seats"] = 4,
		["HP"] = 1800,
		["Mass"] = 950,
		["TopSpeed"] = 132,
		["BoostSpeed"] = 139,
		["ReverseSpeed"] = 32,
		["Scale"] = Vector3.new(2.15, 1.35, 1.5),
		["Accel"] = 5.2,
		["BoostAccel"] = 1.2,
		["Brake"] = 13,
		["Handbrake"] = 8.5,
		["Drive"] = "FWD",
		["Grip"] = 0.95,
		["LatGrip"] = 1.85,
		["HandbrakeGrip"] = 0.5,
		["SteerAngle"] = 43,
		["SteerHighSpeed"] = 0.28,
		["SteerRate"] = 2.8,
		["SpringHz"] = 2,
		["Damping"] = 0.4,
		["DampingRebound"] = 0.9,
		["TravelUp"] = 0.32,
		["AntiRoll"] = 0.55,
		["RollCenter"] = 0.73,
		["Downforce"] = 0.25,
		["FuelPerKm"] = 6,
		["RamMul"] = 0.95,
		["SpawnChance"] = 0.6,
		["AirPitch"] = 0.5,
		["AirRoll"] = 0.3,
		["EngineSound"] = "EngineCar",
		["EnginePitch"] = 1,
		["EngineVolume"] = 0.8,
		["Gears"] = 4,
		["Camera"] = {
			["Distance"] = 9.2,
			["Height"] = 2.8,
			["Fov"] = 72
		},
		["Colors"] = {
			Color3.fromRGB(236, 232, 218),
			Color3.fromRGB(214, 196, 150),
			Color3.fromRGB(150, 172, 190),
			Color3.fromRGB(156, 40, 34),
			Color3.fromRGB(205, 110, 40),
			Color3.fromRGB(78, 104, 70),
			Color3.fromRGB(222, 190, 70),
			Color3.fromRGB(58, 74, 110),
			Color3.fromRGB(120, 120, 118)
		}
	},
	["Buggy"] = {
		["DisplayName"] = "Buggy",
		["Seats"] = 2,
		["HP"] = 1540,
		["Mass"] = 750,
		["TopSpeed"] = 92,
		["BoostSpeed"] = 108,
		["ReverseSpeed"] = 30,
		["Scale"] = Vector3.new(2, 1.3, 1.3),
		["Accel"] = 6.2,
		["BoostAccel"] = 1.25,
		["Brake"] = 13,
		["Handbrake"] = 8.5,
		["Drive"] = "RWD",
		["Grip"] = 0.95,
		["LatGrip"] = 2,
		["HandbrakeGrip"] = 0.5,
		["SteerAngle"] = 42,
		["SteerHighSpeed"] = 0.35,
		["SteerRate"] = 3.2,
		["SpringHz"] = 1.9,
		["Damping"] = 0.38,
		["DampingRebound"] = 0.85,
		["TravelUp"] = 0.4,
		["AntiRoll"] = 0.45,
		["RollCenter"] = 0.78,
		["Downforce"] = 0.2,
		["FuelPerKm"] = 8,
		["RamMul"] = 0.9,
		["SpawnChance"] = 0.5,
		["AirPitch"] = 0.7,
		["AirRoll"] = 0.4,
		["EngineSound"] = "EngineCar",
		["EnginePitch"] = 1.15,
		["EngineVolume"] = 0.9,
		["Gears"] = 4,
		["Camera"] = {
			["Distance"] = 8.2,
			["Height"] = 2.7,
			["Fov"] = 74
		},
		["Colors"] = {
			Color3.fromRGB(180, 40, 30),
			Color3.fromRGB(40, 70, 130),
			Color3.fromRGB(205, 160, 50),
			Color3.fromRGB(60, 62, 60)
		}
	},
	["Motorcycle"] = {
		["DisplayName"] = "Motorcycle",
		["Seats"] = 2,
		["HP"] = 1000,
		["Mass"] = 180,
		["TopSpeed"] = 140,
		["BoostSpeed"] = 152,
		["ReverseSpeed"] = 12,
		["Scale"] = Vector3.new(1.3, 1.25, 1.5),
		["Accel"] = 7,
		["BoostAccel"] = 1.2,
		["Brake"] = 12,
		["Handbrake"] = 8,
		["Drive"] = "RWD",
		["Grip"] = 1.05,
		["LatGrip"] = 2.4,
		["HandbrakeGrip"] = 0.85,
		["SteerAngle"] = 39,
		["SteerHighSpeed"] = 0.18,
		["SteerRate"] = 2.4,
		["SpringHz"] = 2.2,
		["Damping"] = 0.45,
		["DampingRebound"] = 0.95,
		["TravelUp"] = 0.3,
		["AntiRoll"] = 0,
		["RollCenter"] = 1,
		["Downforce"] = 0.08,
		["PitchRollInertia"] = 6,
		["SteerAssist"] = 0.55,
		["SteerAssistTop"] = 0.6,
		["SteerRateMin"] = 0.1,
		["SteerReturn"] = 2.6,
		["GripRate"] = 40,
		["YawAssist"] = 10,
		["HandbrakeYaw"] = 1,
		["HandbrakeSteer"] = 1,
		["LeanSmooth"] = 0.15,
		["DampPitchDiv"] = 3.5,
		["LeanRate"] = 1.6,
		["AirControlDelay"] = 0.25,
		["FlipRoll"] = 55,
		["FlipSpeed"] = 3,
		["FlipDelay"] = 1,
		["FuelPerKm"] = 4,
		["RamMul"] = 0.85,
		["SpawnChance"] = 0.5,
		["AirPitch"] = 4.5,
		["AirRoll"] = 0,
		["Bike"] = true,
		["MaxLean"] = 30,
		["BalanceHz"] = 1.4,
		["BalanceDamping"] = 0.85,
		["BalanceUpMix"] = 0.85,
		["EngineSound"] = "EngineMoto",
		["EnginePitch"] = 1,
		["EngineVolume"] = 0.8,
		["Gears"] = 5,
		["Camera"] = {
			["Distance"] = 6.8,
			["Height"] = 2.3,
			["Fov"] = 76,
			["FppBack"] = 1.15,
			["FppPitch"] = -16
		},
		["Colors"] = {
			Color3.fromRGB(200, 60, 25),
			Color3.fromRGB(40, 90, 160),
			Color3.fromRGB(230, 200, 40),
			Color3.fromRGB(70, 140, 60)
		}
	},
	["Boat"] = {
		["DisplayName"] = "PG-117",
		["Seats"] = 5,
		["HP"] = 1500,
		["Mass"] = 700,
		["TopSpeed"] = 88,
		["BoostSpeed"] = 95,
		["ReverseSpeed"] = 15,
		["Scale"] = Vector3.new(2.05, 1.3, 1.3),
		["Accel"] = 4.7,
		["BoostAccel"] = 1.2,
		["Brake"] = 4.5,
		["Handbrake"] = 3,
		["Drive"] = "Prop",
		["Grip"] = 0.5,
		["LatGrip"] = 0.5,
		["HandbrakeGrip"] = 0.5,
		["SteerAngle"] = 30,
		["SteerHighSpeed"] = 0.6,
		["SteerRate"] = 2.5,
		["Boat"] = true,
		["Draft"] = 0.43,
		["BuoyDamping"] = 0.55,
		["TurnAccel"] = 1.5,
		["YawDamp"] = 2.4,
		["KeelRate"] = 2.8,
		["AngDamp"] = 3,
		["LandThrust"] = 0.1,
		["WaterDrag"] = 0.015,
		["WaterDragTop"] = 0.55,
		["SpringHz"] = 3,
		["Damping"] = 0.6,
		["TravelUp"] = 0.06,
		["AntiRoll"] = 0,
		["RollCenter"] = 0.5,
		["Downforce"] = 0,
		["FuelPerKm"] = 9,
		["RamMul"] = 0.85,
		["SpawnChance"] = 0.7,
		["AirPitch"] = 0.5,
		["AirRoll"] = 0.3,
		["EngineSound"] = "EngineBoat",
		["EnginePitch"] = 1,
		["EngineVolume"] = 0.9,
		["Gears"] = 1,
		["Camera"] = {
			["Distance"] = 10.4,
			["Height"] = 3.4,
			["Fov"] = 72
		}
	}
}
v_u_1.Kinds = v4
v_u_1.TorqueCurve = {
	{ 0, 1 },
	{ 0.12, 1 },
	{ 0.45, 0.94 },
	{ 0.75, 0.76 },
	{ 0.92, 0.46 },
	{ 1, 0 }
}
function v_u_1.get(p5) -- name: get
	-- upvalues: (copy) v_u_1
	return p5 and v_u_1.Kinds[p5] or nil
end
return v_u_1