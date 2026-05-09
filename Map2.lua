local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local workspace = game:GetService("Workspace")

-- 🔄 Tự động đưa về vùng 100 khi khởi động
rootPart.CFrame = CFrame.new(-9886.8, 16.2, -383.6)

-- =============================================
-- 📌 DANH SÁCH 40 VÙNG MAP2 (100 → 199)
-- =============================================
local ZONES = {
    { Name = "100 | Tech Spawn",             Center = Vector3.new(-9886.8, 16.2, -383.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9726.4, 16.2, -383.0) },
    { Name = "101 | Futuristic City",        Center = Vector3.new(-9726.4, 16.2, -383.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9568.9, 16.2, -383.4) },
    { Name = "102 | Hologram Forest",        Center = Vector3.new(-9568.9, 16.2, -383.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9410.3, 16.2, -383.0) },
    { Name = "103 | Robot Farm",             Center = Vector3.new(-9410.3, 16.2, -383.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9251.6, 16.2, -383.4) },
    { Name = "104 | Bit Stream",             Center = Vector3.new(-9251.6, 16.2, -383.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9094.9, 16.2, -383.9) },
    { Name = "105 | Neon Mine",              Center = Vector3.new(-9094.9, 16.2, -383.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8937.1, 16.2, -383.5) },
    { Name = "106 | Mushroom Lab",           Center = Vector3.new(-8937.1, 16.2, -383.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8779.0, 16.2, -383.6) },
    { Name = "107 | Virtual Garden",         Center = Vector3.new(-8779.0, 16.2, -383.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8621.1, 16.2, -383.8) },
    { Name = "108 | Data Tree Farm",         Center = Vector3.new(-8621.1, 16.2, -383.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8463.0, 16.2, -383.3) },
    { Name = "109 | Tech Jungle",            Center = Vector3.new(-8463.0, 16.2, -383.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8305.5, 16.2, -358.4) },
    { Name = "110 | Lava Jungle",            Center = Vector3.new(-8305.5, 16.2, -358.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8305.1, 16.2, -188.1) },
    { Name = "111 | Oasis Ruins",            Center = Vector3.new(-8305.1, 16.2, -188.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8305.2, 16.2, -31.0)  },
    { Name = "112 | Future Beach",           Center = Vector3.new(-8305.2, 16.2, -31.0),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8304.3, -30.2, 242.0) },
    { Name = "113 | Tech Reef",              Center = Vector3.new(-8304.3, -30.2, 242.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8575.3, 15.0, 266.7)  },
    { Name = "114 | Robo Pirates",           Center = Vector3.new(-8575.3, 15.0, 266.7),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8734.5, 15.0, 266.1)  },
    { Name = "115 | Cyber Cove",             Center = Vector3.new(-8734.5, 15.0, 266.1),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8893.1, 15.0, 266.4)  },
    { Name = "116 | Runic Desert",           Center = Vector3.new(-8893.1, 15.0, 266.4),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9053.4, 15.0, 267.0)  },
    { Name = "117 | Charged Pyramids",       Center = Vector3.new(-9053.4, 15.0, 267.0),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9211.7, 15.0, 266.3)  },
    { Name = "118 | Fallout Desert",         Center = Vector3.new(-9211.7, 15.0, 266.3),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9370.5, 15.0, 266.4)  },
    { Name = "119 | Tech Wild West",         Center = Vector3.new(-9370.5, 15.0, 266.4),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9528.3, 15.0, 266.8)  },
    { Name = "120 | Cuboid Canyon",          Center = Vector3.new(-9528.3, 15.0, 266.8),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9782.0, 58.0, 266.4)  },
    { Name = "121 | Frozen Mountains",       Center = Vector3.new(-9782.0, 58.0, 266.4),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9950.6, 58.0, 267.7)  },
    { Name = "122 | Frostbyte Forest",       Center = Vector3.new(-9950.6, 58.0, 267.7),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9974.6, 125.7, 577.9) },
    { Name = "123 | Forcefield Mine",        Center = Vector3.new(-9974.6, 125.7, 577.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9973.8, 125.7, 776.0) },
    { Name = "124 | Cyber Base Camp",        Center = Vector3.new(-9973.8, 125.7, 776.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9973.7, 125.7, 979.7) },
    { Name = "125 | Frosted City",           Center = Vector3.new(-9973.7, 125.7, 979.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9677.5, 58.0, 1001.8) },
    { Name = "126 | Cracked Iceberg",        Center = Vector3.new(-9677.5, 58.0, 1001.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9426.4, 15.0, 1002.8) },
    { Name = "127 | Melted River",           Center = Vector3.new(-9426.4, 15.0, 1002.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9266.6, 15.0, 1003.2) },
    { Name = "128 | Nexus",                  Center = Vector3.new(-9266.6, 15.0, 1003.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9108.5, 15.0, 1002.6) },
    { Name = "129 | Secure Coast",           Center = Vector3.new(-9108.5, 15.0, 1002.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8948.1, 15.0, 1002.5) },
    { Name = "130 | Nuclear Forest",         Center = Vector3.new(-8948.1, 15.0, 1002.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8777.9, 15.0, 1001.6) },
    { Name = "131 | Radiation Mine",         Center = Vector3.new(-8777.9, 15.0, 1001.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8754.5, 15.0, 1159.6) },
    { Name = "132 | Exploded Reactor",       Center = Vector3.new(-8754.5, 15.0, 1159.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8753.8, 15.0, 1320.6) },
    { Name = "133 | Spaceship Dock",         Center = Vector3.new(-8753.8, 15.0, 1320.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8753.0, 15.0, 1480.8) },
    { Name = "134 | Rocky Planet",           Center = Vector3.new(-8753.0, 15.0, 1480.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8753.3, 15.0, 1637.0) },
    { Name = "135 | Lunar Planet",           Center = Vector3.new(-8753.3, 15.0, 1637.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8754.2, 15.0, 1794.6) },
    { Name = "136 | Mars Planet",            Center = Vector3.new(-8754.2, 15.0, 1794.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8753.6, 15.0, 1955.5) },
    { Name = "137 | Saturn Planet",          Center = Vector3.new(-8753.6, 15.0, 1955.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8753.4, 15.0, 2114.3) },
    { Name = "138 | Comet Planet",           Center = Vector3.new(-8753.4, 15.0, 2114.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8777.9, 14.9, 2271.2) },
    { Name = "139 | Galaxy Port",            Center = Vector3.new(-8777.9, 14.9, 2271.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-8949.6, 15.0, 2267.8) },
    { Name = "140 | Electric Garden",        Center = Vector3.new(-8949.6, 15.0, 2267.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9108.4, 15.0, 2267.7) },
    { Name = "141 | Mutated Forest",         Center = Vector3.new(-9108.4, 15.0, 2267.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9267.2, 15.0, 2267.6) },
    { Name = "142 | Neon City",              Center = Vector3.new(-9267.2, 15.0, 2267.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9425.6, 15.0, 2268.3) },
    { Name = "143 | Arcade Town",            Center = Vector3.new(-9425.6, 15.0, 2268.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9585.1, 15.0, 2267.4) },
    { Name = "144 | Robot Factory",          Center = Vector3.new(-9585.1, 15.0, 2267.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9744.1, 15.0, 2267.2) },
    { Name = "145 | Egg Incubator",          Center = Vector3.new(-9744.1, 15.0, 2267.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9902.8, 15.0, 2270.1) },
    { Name = "146 | Hi-Tech Hive",           Center = Vector3.new(-9902.8, 15.0, 2270.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10064.9, 15.0, 2271.4)},
    { Name = "147 | Spore Garden",           Center = Vector3.new(-10064.9, 15.0, 2271.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10219.2, 15.0, 2266.3)},
    { Name = "148 | UFO Forest",             Center = Vector3.new(-10219.2, 15.0, 2266.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10379.8, 15.0, 2268.3)},
    { Name = "149 | Alien Lab",              Center = Vector3.new(-10379.8, 15.0, 2268.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10545.8, 14.9, 2270.2)},
    { Name = "150 | Alien Mothership",       Center = Vector3.new(-10545.8, 14.9, 2270.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10571.2, 15.0, 2427.9)},
    { Name = "151 | Space Forge",            Center = Vector3.new(-10571.2, 15.0, 2427.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10570.5, 15.0, 2588.5)},
    { Name = "152 | Space Factory",          Center = Vector3.new(-10570.5, 15.0, 2588.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10584.1, 14.9, 2759.1)},
    { Name = "153 | Space Junkyard",         Center = Vector3.new(-10584.1, 14.9, 2759.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10426.5, 15.0, 2777.0)},
    { Name = "154 | Steampunk Alley",        Center = Vector3.new(-10426.5, 15.0, 2777.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10269.4, 15.0, 2778.4)},
    { Name = "155 | Steampunk Town",         Center = Vector3.new(-10269.4, 15.0, 2778.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10112.4, 15.0, 2776.4)},
    { Name = "156 | Steampunk Clockwork",    Center = Vector3.new(-10112.4, 15.0, 2776.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9953.1, 15.0, 2777.9) },
    { Name = "157 | Steampunk Airship",      Center = Vector3.new(-9953.1, 15.0, 2777.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9794.6, 14.9, 2775.9) },
    { Name = "158 | Circuit Board",          Center = Vector3.new(-9794.6, 14.9, 2775.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9781.2, 15.0, 2952.0) },
    { Name = "159 | Mothership Circuit Board",Center = Vector3.new(-9781.2, 15.0, 2952.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9781.6, 15.0, 3109.3) },
    { Name = "160 | Wizard Ruins",           Center = Vector3.new(-9781.6, 15.0, 3109.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9776.1, 15.2, 3284.6) },
    { Name = "161 | Wizard Forest",          Center = Vector3.new(-9776.1, 15.2, 3284.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-9935.3, 15.0, 3282.6) },
    { Name = "162 | Wizard Tech Forest",     Center = Vector3.new(-9935.3, 15.0, 3282.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10098.3, 15.0, 3283.0)},
    { Name = "163 | Wizard Tech Tower",      Center = Vector3.new(-10098.3, 15.0, 3283.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10254.8, 15.0, 3284.0)},
    { Name = "164 | Wizard Dungeon",         Center = Vector3.new(-10254.8, 15.0, 3284.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10415.5, 15.0, 3282.0)},
    { Name = "165 | Cyberpunk Undercity",    Center = Vector3.new(-10415.5, 15.0, 3282.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10574.2, 15.0, 3280.2)},
    { Name = "166 | Cyberpunk Industrial",   Center = Vector3.new(-10574.2, 15.0, 3280.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10732.6, 15.0, 3282.9)},
    { Name = "167 | Cyberpunk City",         Center = Vector3.new(-10732.6, 15.0, 3282.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10889.6, 15.0, 3281.6)},
    { Name = "168 | Cyberpunk Road",         Center = Vector3.new(-10889.6, 15.0, 3281.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11049.1, 15.0, 3279.7)},
    { Name = "169 | Tech Ninja Kyoto",       Center = Vector3.new(-11049.1, 15.0, 3279.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11221.4, 14.9, 3266.3)},
    { Name = "170 | Tech Samurai",           Center = Vector3.new(-11221.4, 14.9, 3266.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11240.7, 15.0, 3428.6)},
    { Name = "171 | Tech Ninja Village",     Center = Vector3.new(-11240.7, 15.0, 3428.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11239.4, 15.0, 3583.7)},
    { Name = "172 | Tech Ninja City",        Center = Vector3.new(-11239.4, 15.0, 3583.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11237.5, 15.0, 3742.6)},
    { Name = "173 | Dominus Dungeon",        Center = Vector3.new(-11237.5, 15.0, 3742.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11238.6, 15.0, 3897.6)},
    { Name = "174 | Dominus Vault",          Center = Vector3.new(-11238.6, 15.0, 3897.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11238.5, 14.9, 4071.5)},
    { Name = "175 | Dominus Lair",           Center = Vector3.new(-11238.5, 14.9, 4071.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11076.9, 15.0, 4090.4)},
    { Name = "176 | Holographic Powerplant", Center = Vector3.new(-11076.9, 15.0, 4090.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10916.7, 15.0, 4090.6)},
    { Name = "177 | Holographic City",       Center = Vector3.new(-10916.7, 15.0, 4090.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10756.8, 15.0, 4089.0)},
    { Name = "178 | Holographic Forest",     Center = Vector3.new(-10756.8, 15.0, 4089.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10601.2, 15.0, 4091.4)},
    { Name = "179 | Holographic Mine",       Center = Vector3.new(-10601.2, 15.0, 4091.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10440.8, 15.0, 4088.2)},
    { Name = "180 | Dark Tech Cove",         Center = Vector3.new(-10440.8, 15.0, 4088.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10283.1, 15.0, 4088.4)},
    { Name = "181 | Dark Tech Ruins",        Center = Vector3.new(-10283.1, 15.0, 4088.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10106.6, 14.9, 4089.6)},
    { Name = "182 | Dark Tech Castle",       Center = Vector3.new(-10106.6, 14.9, 4089.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10085.3, 15.0, 4249.1)},
    { Name = "183 | Dark Tech Dungeon",      Center = Vector3.new(-10085.3, 15.0, 4249.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10083.9, 15.0, 4407.1)},
    { Name = "184 | Dark Tech Forest",       Center = Vector3.new(-10083.9, 15.0, 4407.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10085.0, 14.9, 4580.2)},
    { Name = "185 | Hacker Powerplant",      Center = Vector3.new(-10085.0, 14.9, 4580.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10245.4, 15.0, 4605.1)},
    { Name = "186 | Hacker Compound",        Center = Vector3.new(-10245.4, 15.0, 4605.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10404.6, 15.0, 4605.8)},
    { Name = "187 | Hacker Base",            Center = Vector3.new(-10404.6, 15.0, 4605.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10561.4, 15.0, 4603.5)},
    { Name = "188 | Hacker Error",           Center = Vector3.new(-10561.4, 15.0, 4603.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10721.5, 15.0, 4604.8)},
    { Name = "189 | Glitch Forest",          Center = Vector3.new(-10721.5, 15.0, 4604.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-10879.4, 15.0, 4604.4)},
    { Name = "190 | Glitch City",            Center = Vector3.new(-10879.4, 15.0, 4604.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11044.8, 14.9, 4606.0)},
    { Name = "191 | Glitch Skyscrapers",     Center = Vector3.new(-11044.8, 14.9, 4606.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11069.0, 15.0, 4763.5)},
    { Name = "192 | Glitch Town",            Center = Vector3.new(-11069.0, 15.0, 4763.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11067.6, 15.0, 4922.0)},
    { Name = "193 | Glitch Quantum",         Center = Vector3.new(-11067.6, 15.0, 4922.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11069.9, 15.0, 5078.8)},
    { Name = "194 | Quantum Forest",         Center = Vector3.new(-11069.9, 15.0, 5078.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11069.4, 15.0, 5237.1)},
    { Name = "195 | Quantum Space Base",     Center = Vector3.new(-11069.4, 15.0, 5237.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11070.2, 15.0, 5397.7)},
    { Name = "196 | Quantum Galaxy",         Center = Vector3.new(-11070.2, 15.0, 5397.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11069.9, 15.0, 5555.1)},
    { Name = "197 | Void Atomic",            Center = Vector3.new(-11069.9, 15.0, 5555.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11068.9, 15.0, 5714.7)},
    { Name = "198 | Void Fracture",          Center = Vector3.new(-11068.9, 15.0, 5714.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-11070.8, 15.0, 5871.7)},
    { Name = "199 | Void Spiral",            Center = Vector3.new(-11070.8, 15.0, 5871.7),  Size = Vector3.new(157, 100, 160), TeleportPos = nil }, -- Sẽ chuyển place
}

-- =============================================
-- 🛠️ HÀM TẠO GIAO DIỆN (MỖI VÙNG 2 LABEL)
-- =============================================
local function createZoneUI(zoneConfig)
    local guiName = "MissionTracker_" .. zoneConfig.Name:gsub("[%s|]", "_")
    local screenGui = Instance.new("ScreenGui", player.PlayerGui)
    screenGui.Name = guiName
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 250, 0, 100)
    mainFrame.Position = UDim2.new(1, -260, 0.5, -60)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BackgroundTransparency = 0.3
    mainFrame.Visible = false
    Instance.new("UICorner", mainFrame)

    local titleLabel = Instance.new("TextLabel", mainFrame)
    titleLabel.Text = "📌 " .. zoneConfig.Name
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold

    local questLabels = {}
    for idx = 1, 2 do
        local lbl = Instance.new("TextLabel", mainFrame)
        lbl.Size = UDim2.new(1, -20, 0, 25)
        lbl.Position = UDim2.new(0, 10, 0, 30 + (idx-1)*25)
        lbl.Text = "Đang đợi dữ liệu..."
        lbl.TextColor3 = Color3.new(1, 1, 1)
        lbl.BackgroundTransparency = 1
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Font = Enum.Font.Gotham
        lbl.TextScaled = true
        questLabels[idx] = lbl
    end

    return {
        ScreenGui = screenGui,
        MainFrame = mainFrame,
        QuestLabels = questLabels,
        Config = zoneConfig,
    }
end

-- =============================================
-- 📐 KIỂM TRA VÙNG
-- =============================================
local function isInsideZone(pos, zone)
    local center = zone.Center
    local size = zone.Size
    return (math.abs(pos.X - center.X) <= size.X/2) and
           (math.abs(pos.Y - center.Y) <= size.Y/2) and
           (math.abs(pos.Z - center.Z) <= size.Z/2)
end

-- =============================================
-- 🧱 KHỞI TẠO UI CHO TỪNG VÙNG
-- =============================================
local zoneUIs = {}
for _, zone in ipairs(ZONES) do
    zoneUIs[zone.Name] = createZoneUI(zone)
end

-- =============================================
-- 🎯 HÀM ÉP UI GỐC (ẨN FINISHED, HIỆN QUEST 2,3) – GỌI LIÊN TỤC
-- =============================================
local function forceQuestVisibility(zoneFolder)
    local billboard = zoneFolder.INTERACT.ZoneQuest.UI.BillboardGui
    if not billboard then return end

    local function scanAndFix(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("TextLabel") then
                local text = child.Text or ""
                if string.find(text:lower(), "finished") then
                    child.Visible = false
                else
                    child.Visible = true
                end
            end
            if child:IsA("Frame") or child:IsA("GuiObject") then
                scanAndFix(child)
            end
        end
    end

    scanAndFix(billboard)
end

-- =============================================
-- 🔁 VÒNG LẶP CHÍNH (DÙNG MAP2)
-- =============================================
local lastTexts = {}
local teleportedFlags = {}

task.spawn(function()
    while true do
        local pos = rootPart.Position
        local currentZone = nil
        for _, zone in ipairs(ZONES) do
            if isInsideZone(pos, zone) then
                currentZone = zone
                break
            end
        end

        for _, zone in ipairs(ZONES) do
            local uiData = zoneUIs[zone.Name]
            local active = (currentZone == zone)

            uiData.MainFrame.Visible = active
            if not active then
                lastTexts[zone.Name] = nil
                teleportedFlags[zone.Name] = nil
            else
                pcall(function()
                    -- ⚡ DÙNG MAP2
                    local map = workspace:FindFirstChild("Map2")
                    if not map then return end

                    local zoneFolder = map:FindFirstChild(zone.Name)
                    if not zoneFolder then
                        uiData.QuestLabels[1].Text = "2. Lỗi: Không tìm thấy vùng"
                        uiData.QuestLabels[2].Text = "3. Không tìm thấy vùng"
                        return
                    end

                    forceQuestVisibility(zoneFolder)

                    local questsFolder = zoneFolder.INTERACT.ZoneQuest.UI.BillboardGui.Frame.Quests
                    local currentAll = ""
                    local bothDone = true

                    for i = 2, 3 do
                        local q = questsFolder:FindFirstChild(tostring(i))
                        local idx = i - 1
                        if q then
                            local t = q.Title.Text
                            local p = q.Progress.Text
                            local full = t .. " [" .. p .. "]"
                            uiData.QuestLabels[idx].Text = i .. ". " .. full
                            currentAll = currentAll .. full
                            if not string.find(p:lower(), "done") then
                                bothDone = false
                            end
                        else
                            uiData.QuestLabels[idx].Text = i .. ". Không có dữ liệu"
                            bothDone = false
                        end
                    end

                    -- 🚀 Xử lý teleport (đặc biệt vùng 199 chuyển place)
                    if bothDone and not teleportedFlags[zone.Name] then
                        teleportedFlags[zone.Name] = true

                        if zone.Name == "199 | Void Spiral" then
                            print("✅ [199] Hoàn thành! Đang chuyển server...")
                            TeleportService:Teleport(17503543197, player)
                        elseif zone.TeleportPos then
                            rootPart.CFrame = CFrame.new(zone.TeleportPos)
                            print("✅ [" .. zone.Name .. "] Cả 2 Done! Teleport →", zone.TeleportPos)
                            task.wait(0.5)
                        end
                    end

                    if currentAll ~= lastTexts[zone.Name] then
                        lastTexts[zone.Name] = currentAll
                        print("--- [" .. zone.Name .. "] Cập nhật: " .. os.date("%H:%M:%S"))
                    end
                end)
            end
        end

        task.wait(0.5)
    end
end)
