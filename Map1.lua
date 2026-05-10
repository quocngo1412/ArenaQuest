local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local workspace = game:GetService("Workspace")

-- 🔄 Tự động đưa về vùng 1 khi khởi động
rootPart.CFrame = CFrame.new(219.8, 16.2, -205.8)

-- =============================================
-- 📌 DANH SÁCH 99 VÙNG (Map 1 → 99)
-- =============================================
local ZONES = {
    { Name = "1 | Spawn",                    Center = Vector3.new(219.8, 16.2, -205.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(371.2, 16.2, -205.1) },
    { Name = "2 | Colorful Forest",          Center = Vector3.new(371.2, 16.2, -205.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(530.3, 16.2, -204.1) },
    { Name = "3 | Castle",                   Center = Vector3.new(530.3, 16.2, -204.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(689.2, 16.2, -205.5) },
    { Name = "4 | Green Forest",             Center = Vector3.new(689.2, 16.2, -205.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(848.0, 16.2, -180.4) },
    { Name = "5 | Autumn",                   Center = Vector3.new(848.0, 16.2, -180.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(847.3, 16.2, 2.9)   },
    { Name = "6 | Cherry Blossom",           Center = Vector3.new(847.3, 16.2, 2.9),      Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(693.8, 16.2, 27.5)  },
    { Name = "7 | Farm",                     Center = Vector3.new(693.8, 16.2, 27.5),     Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(533.4, 16.2, 27.8)  },
    { Name = "8 | Backyard",                 Center = Vector3.new(533.4, 16.2, 27.8),     Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(375.0, 16.2, 28.7)  },
    { Name = "9 | Misty Falls",              Center = Vector3.new(375.0, 16.2, 28.7),     Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(216.0, 16.2, 54.9)  },
    { Name = "10 | Mine",                    Center = Vector3.new(216.0, 16.2, 54.9),     Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(215.7, 16.2, 236.8) },
    { Name = "11 | Crystal Caverns",         Center = Vector3.new(215.7, 16.2, 236.8),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(375.4, 16.2, 263.8) },
    { Name = "12 | Dead Forest",             Center = Vector3.new(375.4, 16.2, 263.8),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(532.8, 16.2, 264.0) },
    { Name = "13 | Dark Forest",             Center = Vector3.new(532.8, 16.2, 264.0),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(693.5, 16.2, 264.4) },
    { Name = "14 | Mushroom Field",          Center = Vector3.new(693.5, 16.2, 264.4),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(849.6, 16.2, 289.6) },
    { Name = "15 | Enchanted Forest",        Center = Vector3.new(849.6, 16.2, 289.6),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(850.1, 16.2, 473.4) },
    { Name = "16 | Crimson Forest",          Center = Vector3.new(850.1, 16.2, 473.4),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(694.4, 16.2, 498.1) },
    { Name = "17 | Jungle",                  Center = Vector3.new(694.4, 16.2, 498.1),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(534.9, 16.2, 498.5) },
    { Name = "18 | Jungle Temple",           Center = Vector3.new(534.9, 16.2, 498.5),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(373.7, 16.2, 498.3) },
    { Name = "19 | Oasis",                   Center = Vector3.new(373.7, 16.2, 498.3),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(213.7, 16.2, 498.1) },
    { Name = "20 | Beach",                   Center = Vector3.new(213.7, 16.2, 498.1),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(214.5, -29.6, 757.0) },
    { Name = "21 | Coral Reef",              Center = Vector3.new(214.5, -29.6, 757.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(372.7, -30.3, 783.8) },
    { Name = "22 | Shipwreck",               Center = Vector3.new(372.7, -30.3, 783.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(534.4, -29.6, 784.5) },
    { Name = "23 | Atlantis",                Center = Vector3.new(534.4, -29.6, 784.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(810.7, 16.2, 784.6) },
    { Name = "24 | Palm Beach",              Center = Vector3.new(810.7, 16.2, 784.6),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(971.1, 16.2, 809.5) },
    { Name = "25 | Tiki",                    Center = Vector3.new(971.1, 16.2, 809.5),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(971.0, 16.2, 992.7) },
    { Name = "26 | Pirate Cove",             Center = Vector3.new(971.0, 16.2, 992.7),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(824.6, 16.2, 1018.4)},
    { Name = "27 | Pirate Tavern",           Center = Vector3.new(824.6, 16.2, 1018.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(666.2, 16.2, 1019.0)},
    { Name = "28 | Shanty Town",             Center = Vector3.new(666.2, 16.2, 1019.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(512.7, 16.2, 1018.5)},
    { Name = "29 | Desert Village",          Center = Vector3.new(512.7, 16.2, 1018.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(360.9, 16.2, 1042.4)},
    { Name = "30 | Fossil Digsite",          Center = Vector3.new(360.9, 16.2, 1042.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(361.5, 16.2, 1231.0)},
    { Name = "31 | Desert Pyramids",         Center = Vector3.new(361.5, 16.2, 1231.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(512.9, 16.2, 1257.3)},
    { Name = "32 | Red Desert",              Center = Vector3.new(512.9, 16.2, 1257.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(662.5, 16.2, 1257.1)},
    { Name = "33 | Wild West",               Center = Vector3.new(662.5, 16.2, 1257.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(812.1, 16.2, 1256.8)},
    { Name = "34 | Grand Canyons",           Center = Vector3.new(812.1, 16.2, 1256.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(964.0, 16.2, 1257.0)},
    { Name = "35 | Safari",                  Center = Vector3.new(964.0, 16.2, 1257.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1121.7, 16.2, 1280.8)},
    { Name = "36 | Mountains",               Center = Vector3.new(1121.7, 16.2, 1280.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1121.6, 16.2, 1469.9)},
    { Name = "37 | Snow Village",            Center = Vector3.new(1121.6, 16.2, 1469.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(968.5, 16.2, 1493.1) },
    { Name = "38 | Icy Peaks",               Center = Vector3.new(968.5, 16.2, 1493.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(819.4, 15.6, 1493.9) },
    { Name = "39 | Ice Rink",                Center = Vector3.new(819.4, 15.6, 1493.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(663.1, 16.2, 1521.3) },
    { Name = "40 | Ski Town",                Center = Vector3.new(663.1, 16.2, 1521.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(662.4, 16.2, 1708.4) },
    { Name = "41 | Hot Springs",             Center = Vector3.new(662.4, 16.2, 1708.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(814.6, 16.2, 1734.9) },
    { Name = "42 | Fire and Ice",            Center = Vector3.new(814.6, 16.2, 1734.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(963.6, 16.2, 1733.4) },
    { Name = "43 | Volcano",                 Center = Vector3.new(963.6, 16.2, 1733.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1111.9, 16.2, 1732.9) },
    { Name = "44 | Obsidian Cave",           Center = Vector3.new(1111.9, 16.2, 1732.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1261.5, 16.2, 1733.6) },
    { Name = "45 | Lava Forest",             Center = Vector3.new(1261.5, 16.2, 1733.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1416.2, 16.2, 1758.1) },
    { Name = "46 | Underworld",              Center = Vector3.new(1416.2, 16.2, 1758.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1417.6, 16.2, 1928.5) },
    { Name = "47 | Underworld Bridge",       Center = Vector3.new(1417.6, 16.2, 1928.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1416.9, 16.2, 2094.3) },
    { Name = "48 | Underworld Castle",       Center = Vector3.new(1416.9, 16.2, 2094.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1257.9, 16.2, 2120.8) },
    { Name = "49 | Metal Dojo",              Center = Vector3.new(1257.9, 16.2, 2120.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1093.6, 16.2, 2118.1) },
    { Name = "50 | Fire Dojo",               Center = Vector3.new(1093.6, 16.2, 2118.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(736.1, 16.2, 2120.1) },
    { Name = "51 | Samurai Village",         Center = Vector3.new(736.1, 16.2, 2120.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(574.7, 16.2, 2120.7) },
    { Name = "52 | Bamboo Forest",           Center = Vector3.new(574.7, 16.2, 2120.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(416.4, 16.2, 2121.3) },
    { Name = "53 | Zen Garden",              Center = Vector3.new(416.4, 16.2, 2121.3),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(257.0, 16.2, 2145.0) },
    { Name = "54 | Flower Field",            Center = Vector3.new(257.0, 16.2, 2145.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(258.2, 16.2, 2312.2) },
    { Name = "55 | Fairytale Meadows",       Center = Vector3.new(258.2, 16.2, 2312.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(258.1, 16.2, 2469.9) },
    { Name = "56 | Fairytale Castle",        Center = Vector3.new(258.1, 16.2, 2469.9),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(257.2, 16.2, 2638.2) },
    { Name = "57 | Royal Kingdom",           Center = Vector3.new(257.2, 16.2, 2638.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(415.9, 16.2, 2663.7) },
    { Name = "58 | Fairy Castle",            Center = Vector3.new(415.9, 16.2, 2663.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(574.6, 16.2, 2664.8) },
    { Name = "59 | Cozy Village",            Center = Vector3.new(574.6, 16.2, 2664.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(733.7, 16.2, 2664.6) },
    { Name = "60 | Rainbow River",           Center = Vector3.new(733.7, 16.2, 2664.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(892.0, 16.2, 2664.8) },
    { Name = "61 | Colorful Mines",          Center = Vector3.new(892.0, 16.2, 2664.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1050.5, 16.2, 2664.9)},
    { Name = "62 | Colorful Mountains",      Center = Vector3.new(1050.5, 16.2, 2664.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1209.8, 16.2, 2688.6)},
    { Name = "63 | Frost Mountains",         Center = Vector3.new(1209.8, 16.2, 2688.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1210.0, 16.1, 2862.6)},
    { Name = "64 | Ice Sculptures",          Center = Vector3.new(1210.0, 16.1, 2862.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1209.4, 16.2, 3021.4)},
    { Name = "65 | Snowman Town",            Center = Vector3.new(1209.4, 16.2, 3021.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1209.6, 16.1, 3194.5)},
    { Name = "66 | Ice Castle",              Center = Vector3.new(1209.6, 16.1, 3194.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1050.4, 16.0, 3217.8)},
    { Name = "67 | Polar Express",           Center = Vector3.new(1050.4, 16.0, 3217.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(890.6, 16.2, 3217.8) },
    { Name = "68 | Firefly Cold Forest",     Center = Vector3.new(890.6, 16.2, 3217.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(732.2, 16.2, 3217.6) },
    { Name = "69 | Golden Road",             Center = Vector3.new(732.2, 16.2, 3217.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(573.8, 16.2, 3218.2) },
    { Name = "70 | No Path Forest",          Center = Vector3.new(573.8, 16.2, 3218.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(415.7, 16.2, 3218.1) },
    { Name = "71 | Ancient Ruins",           Center = Vector3.new(415.7, 16.2, 3218.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(258.1, 16.7, 3244.5) },
    { Name = "72 | Runic Altar",             Center = Vector3.new(258.1, 16.7, 3244.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(257.6, 16.2, 3410.4) },
    { Name = "73 | Wizard Tower",            Center = Vector3.new(257.6, 16.2, 3410.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(258.9, 16.2, 3566.4) },
    { Name = "74 | Witch Marsh",             Center = Vector3.new(258.9, 16.2, 3566.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(258.2, 16.2, 3729.7) },
    { Name = "75 | Haunted Forest",          Center = Vector3.new(258.2, 16.2, 3729.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(412.2, 16.2, 3738.7) },
    { Name = "76 | Haunted Graveyard",       Center = Vector3.new(412.2, 16.2, 3738.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(572.6, 16.2, 3738.6) },
    { Name = "77 | Haunted Mansion",         Center = Vector3.new(572.6, 16.2, 3738.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(909.0, -33.8, 3739.1)},
    { Name = "78 | Dungeon Entrance",        Center = Vector3.new(909.0, -33.8, 3739.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1069.6, -33.8, 3763.3)},
    { Name = "79 | Dungeon",                 Center = Vector3.new(1069.6, -33.8, 3763.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1069.5, -33.7, 3936.2)},
    { Name = "80 | Treasure Dungeon",        Center = Vector3.new(1069.5, -33.7, 3936.2), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1070.2, -33.7, 4094.4)},
    { Name = "81 | Empyrean Dungeon",        Center = Vector3.new(1070.2, -33.7, 4094.4), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1070.5, -33.8, 4267.9)},
    { Name = "82 | Mythic Dungeon",          Center = Vector3.new(1070.5, -33.8, 4267.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(738.0, 16.2, 4290.7) },
    { Name = "83 | Cotton Candy Forest",     Center = Vector3.new(738.0, 16.2, 4290.7),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(577.3, 16.2, 4290.5) },
    { Name = "84 | Gummy Forest",            Center = Vector3.new(577.3, 16.2, 4290.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(416.4, 16.2, 4290.5) },
    { Name = "85 | Chocolate Waterfall",     Center = Vector3.new(416.4, 16.2, 4290.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(254.9, 16.2, 4290.5) },
    { Name = "86 | Sweets",                  Center = Vector3.new(254.9, 16.2, 4290.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(96.2, 16.2, 4290.7)  },
    { Name = "87 | Toys and Blocks",         Center = Vector3.new(96.2, 16.2, 4290.7),    Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-64.6, 16.2, 4315.4) },
    { Name = "88 | Carnival",                Center = Vector3.new(-64.6, 16.2, 4315.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.2, 16.2, 4487.8) },
    { Name = "89 | Theme Park",              Center = Vector3.new(-65.2, 16.2, 4487.8),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-64.3, 116.2, 4849.5)},
    { Name = "90 | Clouds",                  Center = Vector3.new(-64.3, 116.2, 4849.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.0, 116.2, 5007.2)},
    { Name = "91 | Cloud Garden",            Center = Vector3.new(-65.0, 116.2, 5007.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.5, 116.2, 5166.4)},
    { Name = "92 | Cloud Forest",            Center = Vector3.new(-65.5, 116.2, 5166.4),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.1, 116.2, 5326.5)},
    { Name = "93 | Cloud Houses",            Center = Vector3.new(-65.1, 116.2, 5326.5),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-64.7, 116.2, 5487.2)},
    { Name = "94 | Cloud Palace",            Center = Vector3.new(-64.7, 116.2, 5487.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.0, 116.2, 5648.0)},
    { Name = "95 | Heaven Gates",            Center = Vector3.new(-65.0, 116.2, 5648.0),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-64.7, 116.2, 5804.6)},
    { Name = "96 | Heaven",                  Center = Vector3.new(-64.7, 116.2, 5804.6),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-64.7, 116.2, 5962.1)},
    { Name = "97 | Heaven Golden Castle",    Center = Vector3.new(-64.7, 116.2, 5962.1),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.0, 116.2, 6119.2)},
    { Name = "98 | Colorful Clouds",         Center = Vector3.new(-65.0, 116.2, 6119.2),   Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-65.1, 159.5, 6431.8)},
    { Name = "99 | Rainbow Road",            Center = Vector3.new(-65.1, 159.5, 6431.8),   Size = Vector3.new(157, 100, 160), TeleportPos = nil }, -- Sẽ chuyển place
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
                    child.Visible = false   -- Ẩn dòng Finished
                else
                    child.Visible = true    -- Hiện các dòng khác (quest 1,2,3...)
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
-- 🔁 VÒNG LẶP CHÍNH (DÙNG MAP)
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
                    -- ⚡ DÙNG "Map" (không phải Map1, Map2...)
                    local map = workspace:FindFirstChild("Map")
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

                    -- 🚀 Xử lý teleport (đặc biệt vùng 99 chuyển place)
                    if bothDone and not teleportedFlags[zone.Name] then
                        teleportedFlags[zone.Name] = true

                        if zone.Name == "99 | Rainbow Road" then
                            print("✅ [99] Hoàn thành! Đang chuyển server...")
                            TeleportService:Teleport(16498369169, player)
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
