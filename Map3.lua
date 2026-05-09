local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local workspace = game:GetService("Workspace")

-- 🔄 Tự động đưa về vùng 200 khi khởi động
rootPart.CFrame = CFrame.new(-2795.0, 16.4, -8503.9)

-- =============================================
-- 📌 DANH SÁCH 40 VÙNG MAP3 (200 → 239)
-- =============================================
local ZONES = {
    { Name = "200 | Void Spawn",           Center = Vector3.new(-2795.0, 16.4, -8503.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2631.1, 16.4, -8503.8) },
    { Name = "201 | Prison Block",         Center = Vector3.new(-2631.1, 16.4, -8503.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2468.1, 16.4, -8504.4) },
    { Name = "202 | Prison Cafeteria",     Center = Vector3.new(-2468.1, 16.4, -8504.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2305.2, 17.1, -8506.1) },
    { Name = "203 | Prison Yard",          Center = Vector3.new(-2305.2, 17.1, -8506.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2142.4, 17.1, -8506.8) },
    { Name = "204 | Prison HQ",            Center = Vector3.new(-2142.4, 17.1, -8506.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2683.8, 233.8, -12964.8) },
    { Name = "205 | Beach Island",         Center = Vector3.new(-2683.8, 233.8, -12964.8), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-3303.7, 293.8, -12966.8) },
    { Name = "206 | Ocean Island",         Center = Vector3.new(-3303.7, 293.8, -12966.8), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-3894.2, 412.9, -12968.8) },
    { Name = "207 | Tiki Island",          Center = Vector3.new(-3894.2, 412.9, -12968.8), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-4295.2, 594.8, -12942.4) },
    { Name = "208 | Jungle Island",        Center = Vector3.new(-4295.2, 594.8, -12942.4), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-4757.8, 705.6, -12956.0) },
    { Name = "209 | Volcano Island",       Center = Vector3.new(-4757.8, 705.6, -12956.0), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2684.9, 224.1, -22099.6) },
    { Name = "210 | Hacker Matrix",        Center = Vector3.new(-2684.9, 224.1, -22099.6), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2308.6, 200.3, -22096.3) },
    { Name = "211 | Hacker Fortress",      Center = Vector3.new(-2308.6, 200.3, -22096.3), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2689.4, 199.8, -21727.2) },
    { Name = "212 | Hacker Cave",          Center = Vector3.new(-2689.4, 199.8, -21727.2), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-3062.2, 198.2, -22094.0) },
    { Name = "213 | Hacker Lab",           Center = Vector3.new(-3062.2, 198.2, -22094.0), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(-2685.7, 197.6, -22473.1) },
    { Name = "214 | Hacker Mainframe",     Center = Vector3.new(-2685.7, 197.6, -22473.1), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(779.6, 16.4, -14306.3) },
    { Name = "215 | Dirt Village",         Center = Vector3.new(779.6, 16.4, -14306.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(941.0, 16.4, -14306.0) },
    { Name = "216 | Stone Forts",          Center = Vector3.new(941.0, 16.4, -14306.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1104.2, 16.4, -14305.9) },
    { Name = "217 | Silver City",          Center = Vector3.new(1104.2, 16.4, -14305.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1265.3, 16.4, -14305.6) },
    { Name = "218 | Golden Metropolis",    Center = Vector3.new(1265.3, 16.4, -14305.6),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1428.2, 16.4, -14305.4) },
    { Name = "219 | Diamond Mega City",    Center = Vector3.new(1428.2, 16.4, -14305.4),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(779.2, 16.4, -36305.9) },
    { Name = "220 | Kawaii Tokyo",         Center = Vector3.new(779.2, 16.4, -36305.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(941.1, 16.4, -36306.0) },
    { Name = "221 | Kawaii Village",       Center = Vector3.new(941.1, 16.4, -36306.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1103.4, 16.4, -36306.0) },
    { Name = "222 | Kawaii Grove",         Center = Vector3.new(1103.4, 16.4, -36306.0),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1265.0, 16.4, -36306.3) },
    { Name = "223 | Kawaii Dreamland",     Center = Vector3.new(1265.0, 16.4, -36306.3),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1427.1, 16.4, -36306.1) },
    { Name = "224 | Kawaii Temple",        Center = Vector3.new(1427.1, 16.4, -36306.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(779.8, 16.4, -24948.5) },
    { Name = "225 | Grassy Plains",        Center = Vector3.new(779.8, 16.4, -24948.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(942.0, 16.4, -24948.9) },
    { Name = "226 | Rocky Ridge",          Center = Vector3.new(942.0, 16.4, -24948.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1104.1, 16.5, -24948.8) },
    { Name = "227 | Crystal Lake",         Center = Vector3.new(1104.1, 16.5, -24948.8),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1265.7, 16.5, -24948.9) },
    { Name = "228 | Electro Forge",        Center = Vector3.new(1265.7, 16.5, -24948.9),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(1427.3, 16.4, -24949.1) },
    { Name = "229 | Elemental Realm",      Center = Vector3.new(1427.3, 16.4, -24949.1),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(5456.9, 16.4, -20568.5) },
    { Name = "230 | Elysium Fields",       Center = Vector3.new(5456.9, 16.4, -20568.5),  Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(5805.5, 101.6, -20568.7) },
    { Name = "231 | Ocean Paradise",       Center = Vector3.new(5805.5, 101.6, -20568.7), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(6155.7, 197.6, -20568.6) },
    { Name = "232 | Lost Library",         Center = Vector3.new(6155.7, 197.6, -20568.6), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(6604.5, 316.4, -20569.8) },
    { Name = "233 | Nebula Forest",        Center = Vector3.new(6604.5, 316.4, -20569.8), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(6986.3, 416.4, -20569.4) },
    { Name = "234 | Aether Colosseum",     Center = Vector3.new(6986.3, 416.4, -20569.4), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(8683.5, 211.4, -11319.0) },
    { Name = "235 | Doodle Meadow",        Center = Vector3.new(8683.5, 211.4, -11319.0), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(8854.3, 211.4, -11319.1) },
    { Name = "236 | Doodle Safari",        Center = Vector3.new(8854.3, 211.4, -11319.1), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(9023.0, 211.4, -11318.5) },
    { Name = "237 | Doodle Fairyland",     Center = Vector3.new(9023.0, 211.4, -11318.5), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(9182.9, 211.4, -11319.4) },
    { Name = "238 | Doodle Cave",          Center = Vector3.new(9182.9, 211.4, -11319.4), Size = Vector3.new(157, 100, 160), TeleportPos = Vector3.new(9344.7, 211.4, -11318.6) },
    { Name = "239 | Doodle Oasis",         Center = Vector3.new(9344.7, 211.4, -11318.6), Size = Vector3.new(157, 100, 160), TeleportPos = nil }, -- Sẽ dùng place ID
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
-- 🔁 VÒNG LẶP CHÍNH (DÙNG MAP3)
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
                    local map = workspace:FindFirstChild("Map3")
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

                    -- 🚀 Xử lý teleport (đặc biệt vùng 239 chuyển place)
                    if bothDone and not teleportedFlags[zone.Name] then
                        teleportedFlags[zone.Name] = true

                        if zone.Name == "239 | Doodle Oasis" then
                            -- Chuyển đến place ID mới
                            print("✅ [239] Hoàn thành! Đang chuyển server...")
                            TeleportService:Teleport(140403681187145, player)
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
