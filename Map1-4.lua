local placeId = game.PlaceId

-- Hàm hỗ trợ tải và chạy script, có pcall để tránh lỗi crash
local function run(scriptUrl, mapName)
	local success, err = pcall(function()
		loadstring(game:HttpGet(scriptUrl))()
	end)
	if success then
		print("[Map Loader] Đã chạy script " .. mapName)
	else
		warn("[Map Loader] Lỗi " .. mapName .. ": " .. tostring(err))
	end
end

-- Kiểm tra từng map
if placeId == 8737899170 then
	run("https://raw.githubusercontent.com/quocngo1412/ArenaQuest/refs/heads/main/Map1.lua", "Map1")
elseif placeId == 16498369169 then
	run("https://raw.githubusercontent.com/quocngo1412/ArenaQuest/refs/heads/main/Map2.lua", "Map2")
elseif placeId == 17503543197 then
	run("https://raw.githubusercontent.com/quocngo1412/ArenaQuest/refs/heads/main/Map3.lua", "Map3")
elseif placeId == 140403681187145 then
	run("https://raw.githubusercontent.com/quocngo1412/ArenaQuest/refs/heads/main/Map4.lua", "Map4")
else
	print("[Map Loader] PlaceId " .. placeId .. " không thuộc map nào. Bỏ qua.")
end
