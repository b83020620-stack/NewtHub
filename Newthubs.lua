--[[
    █▄░█ █▀▀ █░█░█ ▀█▀ █░█ █░█ █▄░█ █▀▄
    █░▀█ ██▄ ▀▄▀▄▀ ░█░ █▀█ █▄█ █░▀█ █▄▀
    PURE EDITION - NO LYNX BASE
    STATUS: AKTIVE 😈🔥
]]

local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

-- 1. POTATO GRAPHICS (BURIK MAX NO ERROR)
-- Ngilangin semua beban visual biar x50 speed lancar
task.spawn(function()
    settings().Rendering.QualityLevel = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then 
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then 
            v.Enabled = false
        end
    end
end)

-- 2. GHOSTFIN ROD SPOOFER
-- Paksa sistem nganggep semua rod adalah Ghostfin
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local tool = Player.Character:FindFirstChildOfClass("Tool") or Player.Backpack:FindFirstChildOfClass("Tool")
            if tool then tool.Name = "Ghostfin Rod" end
        end)
    end
end)

-- 3. SPEED X50 & NO ANIMATION (JANTUNG NEWTHUB)
-- Tarikan kilat tanpa animasi ngayun
task.spawn(function()
    while task.wait() do
        pcall(function()
            local char = Player.Character
            if char then
                -- MATIKAN ANIMASI
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    for _, track in pairs(hum:GetPlayingAnimationTracks()) do track:Stop() end
                end
                if char:FindFirstChild("Animate") then char.Animate.Enabled = false end

                -- SPAM SPEED X50
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    for i = 1, 50 do
                        local event = RS:FindFirstChild("Events") and (RS.Events:FindFirstChild("FishingEvent") or RS.Events:FindFirstChild("RemoteEvent"))
                        if event then event:FireServer() end
                    end
                end
            end
        end)
    end
end)

-- 4. AUTO-RARITY FILTER (LEGENDARY, MYTHIC, SECRET)
-- Cuma simpan yang mewah, sisanya hancurkan
Player.Backpack.ChildAdded:Connect(function(child)
    task.wait(0.1)
    pcall(function()
        local n = child.Name:lower()
        if not (n:find("legendary") or n:find("mythic") or n:find("secret")) then
            child:Destroy()
        end
    end)
end)

print("NEWTHUB: PURE VERSION LOADED! 😈🔥")
