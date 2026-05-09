local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local workspace = game:GetService("Workspace")

-- 🔄 Tự động đưa về vùng 240
rootPart.CFrame = CFrame.new(-15715.0, 16.2, -384.2)

-- =============================================
-- 📌 DANH SÁCH 40 VÙNG MAP4 (240 → 279)
-- =============================================
local ZONES = {
    { Name = "240 | Fantasy Spawn",        Center = Vector3.new(-15715.0, 16.2, -384.2), Size = Vector3.new(155, 100, 160), TeleportPos = Vector3.new(-15555.6, 16.2, -384.4) },
    { Name = "241 | Flora Falls",          Center = Vector3.new(-15555.6, 16.2, -384.4), Size = Vector3.new(155, 100, 160), TeleportPos = Vector3.new(-15397.9, 16.2, -383.5) },
    { Name = "242 | Lantern Forest",       Center = Vector3.new(-15397.9, 16.2, -383.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15240.3, 16.4, -383.3) },
    { Name = "243 | Honeycomb Hollow",     Center = Vector3.new(-15240.3, 16.4, -383.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15082.0, 16.2, -384.2) },
    { Name = "244 | Fairy Glade",          Center = Vector3.new(-15082.0, 16.2, -384.2), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14924.1, 16.2, -383.9) },
    { Name = "245 | Windmill Point",       Center = Vector3.new(-14924.1, 16.2, -383.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14766.7, 16.2, -383.6) },
    { Name = "246 | Radiant Runestones",   Center = Vector3.new(-14766.7, 16.2, -383.6), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14607.7, 16.2, -383.3) },
    { Name = "247 | Fogbound Forest",      Center = Vector3.new(-14607.7, 16.2, -383.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14449.7, 16.2, -383.3) },
    { Name = "248 | Rune Graveyard",       Center = Vector3.new(-14449.7, 16.2, -383.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14290.7, 16.2, -359.3) },
    { Name = "249 | Halo Spires",          Center = Vector3.new(-14290.7, 16.2, -359.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14290.3, 16.2, -188.9) },
    { Name = "250 | Twilight Grove",       Center = Vector3.new(-14290.3, 16.2, -188.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14289.6, 16.2, -29.5)  },
    { Name = "251 | Moonlight Ridge",      Center = Vector3.new(-14289.6, 16.2, -29.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14289.8, 16.2, 127.2)  },
    { Name = "252 | Starroot Highlands",   Center = Vector3.new(-14289.8, 16.2, 127.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14290.2, 16.2, 285.2)  },
    { Name = "253 | Aether Archways",      Center = Vector3.new(-14290.2, 16.2, 285.2),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14290.5, 16.2, 455.4)  },
    { Name = "254 | Celestial Watchtower", Center = Vector3.new(-14290.5, 16.2, 455.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14450.1, 16.2, 481.7)  },
    { Name = "255 | Whispering Hills",     Center = Vector3.new(-14450.1, 16.2, 481.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14608.5, 16.2, 481.6)  },
    { Name = "256 | Runestone Bluff",      Center = Vector3.new(-14608.5, 16.2, 481.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14766.9, 16.2, 481.6)  },
    { Name = "257 | Totem Trail",          Center = Vector3.new(-14766.9, 16.2, 481.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14922.8, 16.2, 482.7)  },
    { Name = "258 | Wyrmwatch Ridge",      Center = Vector3.new(-14922.8, 16.2, 482.7),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15083.4, 16.2, 505.4)  },
    { Name = "259 | Highcliff Sanctuary",  Center = Vector3.new(-15083.4, 16.2, 505.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15081.8, 16.3, 676.5)  },
    { Name = "260 | Ember Cliffs",         Center = Vector3.new(-15081.8, 16.3, 676.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15082.8, 16.3, 834.9)  },
    { Name = "261 | Charred Canyon",       Center = Vector3.new(-15082.8, 16.3, 834.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15082.2, 16.3, 993.1)  },
    { Name = "262 | Ember Chasm",          Center = Vector3.new(-15082.2, 16.3, 993.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15082.2, 16.3, 1151.9) },
    { Name = "263 | Molten Nest",          Center = Vector3.new(-15082.2, 16.3, 1151.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15058.1, 16.2, 1313.3) },
    { Name = "264 | Obsidian Spire",       Center = Vector3.new(-15058.1, 16.2, 1313.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14885.6, 16.5, 1312.6) },
    { Name = "265 | Crystalfall Hollow",   Center = Vector3.new(-14885.6, 16.5, 1312.6), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14726.9, 16.7, 1311.9) },
    { Name = "266 | Glimmer Grottos",      Center = Vector3.new(-14726.9, 16.7, 1311.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14568.2, 16.7, 1312.5) },
    { Name = "267 | Mirror Tome Path",     Center = Vector3.new(-14568.2, 16.7, 1312.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14409.2, 16.7, 1311.5) },
    { Name = "268 | Scribes Terrace",      Center = Vector3.new(-14409.2, 16.7, 1311.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14252.0, 16.2, 1337.9) },
    { Name = "269 | Archivists Tower",     Center = Vector3.new(-14252.0, 16.2, 1337.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14250.4, 16.2, 1508.9) },
    { Name = "270 | Mystmire Bloom",       Center = Vector3.new(-14250.4, 16.2, 1508.9), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14250.6, 16.2, 1667.8) },
    { Name = "271 | Lotus Fenlight",       Center = Vector3.new(-14250.6, 16.2, 1667.8), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14250.4, 16.2, 1826.2) },
    { Name = "272 | Faerie Hex Glade",     Center = Vector3.new(-14250.4, 16.2, 1826.2), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14251.0, 16.2, 1983.7) },
    { Name = "273 | Bloomcourt Terrace",   Center = Vector3.new(-14251.0, 16.2, 1983.7), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14251.5, 16.2, 2154.5) },
    { Name = "274 | Toadstool Throne",     Center = Vector3.new(-14251.5, 16.2, 2154.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14411.1, 16.2, 2179.5) },
    { Name = "275 | Bloomfade Crossing",   Center = Vector3.new(-14411.1, 16.2, 2179.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14569.3, 16.2, 2179.1) },
    { Name = "276 | Duskwillow Path",      Center = Vector3.new(-14569.3, 16.2, 2179.1), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14726.6, 16.2, 2179.6) },
    { Name = "277 | Wraithcap Grove",      Center = Vector3.new(-14726.6, 16.2, 2179.6), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-14885.1, 16.2, 2178.2) },
    { Name = "278 | Veilroot Depths",      Center = Vector3.new(-14885.1, 16.2, 2178.2), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-15045.0, 16.2, 2202.4) },
    { Name = "279 | Hollow Veil Castle",   Center = Vector3.new(-15045.0, 16.2, 2202.4), Size = Vector3.new(157, 100, 160), TeleportPos = nil },
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
-- 🔁 VÒNG LẶP CHÍNH
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
                    local map = workspace:FindFirstChild("Map4") or workspace:FindFirstChild("Map")
                    if not map then return end

                    local zoneFolder = map:FindFirstChild(zone.Name)
                    if not zoneFolder then
                        uiData.QuestLabels[1].Text = "2. Lỗi: Không tìm thấy vùng"
                        uiData.QuestLabels[2].Text = "3. Không tìm thấy vùng"
                        return
                    end

                    -- ⚡ ÉP UI GỐC MỖI LẦN LẶP (0.5 giây)
                    forceQuestVisibility(zoneFolder)

                    -- Đọc object "2" và "3"
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

                    -- Teleport nếu đủ điều kiện
                    if bothDone and zone.TeleportPos and not teleportedFlags[zone.Name] then
                        teleportedFlags[zone.Name] = true
                        rootPart.CFrame = CFrame.new(zone.TeleportPos)
                        print("✅ [" .. zone.Name .. "] Cả 2 Done! Teleport →", zone.TeleportPos)
                        task.wait(0.5)
                    end

                    -- In log nếu có thay đổi
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
