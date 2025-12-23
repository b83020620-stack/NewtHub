--[[
    █▄░█ █▀▀ █░█░█ ▀█▀ █░█ █░█ █▄░█ █▀▄
    █░▀█ ██▄ ▀▄▀▄▀ ░█░ █▀█ █▄█ █░▀█ █▄▀
    MADE BY KILLER_VOIDS FOR NEWTHUB
    STATUS: AKTIVE 😈🔥
]]

-- 1. LOAD LYNX BASE (ASLI)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/4LynxX/Lynx/refs/heads/main/LynxxMain.lua"))()
end)

local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

-- 2. POTATO GRAPHICS (BURIK LEVEL DEWA)
local function ActivatePotato()
    settings().Rendering.QualityLevel = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") then
            v.Enabled = false
        end
    end
    if game.Workspace:FindFirstChildOfClass("Terrain") then
        local t = game.Workspace:FindFirstChildOfClass("Terrain")
        t.WaterWaveSize, t.WaterWaveSpeed, t.WaterReflectance = 0, 0, 0
    end
end
ActivatePotato()

-- 3. CORE ENGINE: SPEED X50, GHOSTFIN, NO ANIMATION
task.spawn(function()
    while task.wait() do
        pcall(function()
            local char = Player.Character
            if char then
                local tool = char:FindFirstChildOfClass("Tool")
                
                -- GHOSTFIN SPOOFER
                if tool and tool.Name ~= "Ghostfin Rod" then
                    tool.Name = "Ghostfin Rod"
                end

                -- NO ANIMATION
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    for _, track in pairs(hum:GetPlayingAnimationTracks()) do track:Stop() end
                    if char:FindFirstChild("Animate") then char.Animate.Enabled = false end
                end

                -- SPEED X50 FISHING SPAM
                if tool then
                    for i = 1, 50 do
                        local event = RS:FindFirstChild("Events") and (RS.Events:FindFirstChild("FishingEvent") or RS.Events:FindFirstChild("RemoteEvent") or RS.Events:FindFirstChild("Cast"))
                        if event then event:FireServer() end
                    end
                end
            end
        end)
    end
end)

-- 4. RARITY FILTER (LEGENDARY, MYTHIC, SECRET)
Player.Backpack.ChildAdded:Connect(function(child)
    task.wait(0.2)
    pcall(function()
        local r = child:FindFirstChild("Rarity")
        local name = child.Name:lower()
        local isKeep = string.find(name, "legendary") or string.find(name, "mythic") or string.find(name, "secret") or (r and (r.Value == "Legendary" or r.Value == "Mythic" or r.Value == "Secret"))
        
        if not isKeep then
            child:Destroy()
            local d = RS:FindFirstChild("Events") and (RS.Events:FindFirstChild("Discard") or RS.Events:FindFirstChild("DropItem"))
            if d then d:FireServer(child) end
        end
    end)
end)

print("NEWTHUB: SYSTEM INJECTED SUCCESSFULLY! 😈🔥")
