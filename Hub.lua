-- [[ 1. HỆ THỐNG KEY DYNAMIC & SUB4UNLOCK ]]
local function GetCurrentKey()
    local StartDate = os.time({year = 2026, month = 4, day = 4})
    local CurrentDate = os.time()
    local DayCount = math.floor((CurrentDate - StartDate) / 86400) + 1
    
    local Prefixes = {"", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p"}
    local Prefix = Prefixes[DayCount] or "z"
    return Prefix .. string.format("%05d", DayCount)
end

local OwnerID = 10528045140
local IsOwner = (game.Players.LocalPlayer.UserId == OwnerID)
local MyLink = "https://sub4unlock.com/S/61rdm"

-- [[ 2. KHỞI TẠO INTERFACE ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "QuangAnh Hub | CAYVICHE V24 FUSION",
    LoadingTitle = IsOwner and "CHỦ TỊCH QUANG ANH IS BACK!" or "Vượt Sub4Unlock để lấy Key...",
    KeySystem = not IsOwner,
    KeySettings = { 
        Title = "Xác Thực Key Ngày", 
        Key = {GetCurrentKey()},
        Info = "Link lấy Key: " .. MyLink 
    }
})

-- --- TAB 1: MAIN (TÍCH HỢP SCRIPT TỔNG HỢP) ---
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateSection("--- 🌟 SỨC MẠNH LÕI TỔNG HỢP 🌟 ---")
MainTab:CreateButton({
    Name = "🔥 KHỞI ĐỘNG SCRIPT TỔNG HỢP (Luongdaynetroi) 🔥",
    Callback = function()
        pcall(function()
            Rayfield:Notify({Title = "Đang Tải", Content = "Đang nạp script nền từ Github...", Duration = 3})
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Luongdaynetroi/ScriptTongHop/refs/heads/main/.lua"))()
        end)
    end
})

MainTab:CreateSection("--- Bảo Vệ Hệ Thống ---")
MainTab:CreateToggle({Name = "Auto Rejoin", CurrentValue = true, Callback = function(v) _G.AutoRejoin = v end})
MainTab:CreateToggle({Name = "Safe Mode (Né Ban)", CurrentValue = false, Callback = function(v) _G.SafeMode = v end})
MainTab:CreateSlider({Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end})

-- --- TAB 2: KAITUN (Đồ Trấn Phái) ---
local KaitunTab = Window:CreateTab("Kaitun", 4483362458)
KaitunTab:CreateToggle({Name = "Auto Farm Level", CurrentValue = false, Callback = function(v) _G.AutoFarm = v end})
KaitunTab:CreateToggle({Name = "Bring Mob", CurrentValue = true, Callback = function(v) _G.BringMob = v end})
KaitunTab:CreateButton({Name = "🎸 Auto Soul Guitar", Callback = function() end})
KaitunTab:CreateButton({Name = "👊 Auto Godhuman", Callback = function() end})

-- --- TAB 3: TROLL (Bộ Sưu Tập Đòi Nợ) ---
local TrollTab = Window:CreateTab("Troll Duy", 4483362458)
TrollTab:CreateInput({Name = "Tên Mục Tiêu", PlaceholderText = "Duy...", Callback = function(t) _G.Target = t end})
TrollTab:CreateButton({
    Name = "📢 Ép Duy Vượt Link Sub4Unlock",
    Callback = function()
        local msg = "Duy! Muốn dùng QuangAnh Hub thì vào đây Sub kênh tao rồi lấy Key: " .. MyLink
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
})
TrollTab:CreateButton({
    Name = "📢 Đòi Nợ 45k & Portal VV",
    Callback = function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Duy nợ 45k và acc Portal VV định bùng à? Trả ngay!", "All")
    end
})

-- --- TAB 4: HUB NGOẠI LAI ---
local TongHopTab = Window:CreateTab("Tổng Hợp", 4483362458)
TongHopTab:CreateButton({Name = "🚀 W-Azure (Fixed)", Callback = function() pcall(function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))() end) end})

-- [[ 3. HỆ THỐNG BACKGROUND ]]
spawn(function()
    while task.wait() do
        -- Chống văng
        pcall(function()
            if _G.AutoRejoin and game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            end
        end)
    end
end)
