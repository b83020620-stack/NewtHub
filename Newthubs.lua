--[[
    █▄░█ █▀▀ █░█░█ ▀█▀ █░█ █░█ █▄░█ █▀▄
    █░▀█ ██▄ ▀▄▀▄▀ ░█░ █▀█ █▄█ █░▀█ █▄▀
    V3 - GUI EDITION & INSTANT CATCH
    STATUS: ULTRA AKTIVE 😈🔥
]]

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "NewtHub V3 😈🔥", HidePremium = false, SaveConfig = true, ConfigFolder = "NewtHub"})

-- VARIABLES
getgenv().AutoFish = false
getgenv().InstantCatch = false
getgenv().PotatoMode = false

-- 1. POTATO GRAPHICS FUNCTION
local function DoPotato()
    settings().Rendering.QualityLevel = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then 
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then 
            v.Enabled = not getgenv().PotatoMode
        end
    end
end

-- 2. INSTANT CATCH & GHOSTFIN LOGIC
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFish then
            pcall(function()
                local Player = game.Players.LocalPlayer
                local char = Player.Character
                local tool = char:FindFirstChildOfClass("Tool")
                
                if tool then
                    tool.Name = "Ghostfinn Rod" -- Sesuai SS lu "Ghostfinn" (double n)
                    
                    -- BYPASS CLICK FAST (Nembak langsung ke 0-1 detik)
                    local RS = game:GetService("ReplicatedStorage")
                    local events = RS:FindFirstChild("Events") or RS
                    
                    for i = 1, 100 do -- Naikin ke 100x biar 0 detik!
                        local fishEvent = events:FindFirstChild("FishingEvent") or events:FindFirstChild("RemoteEvent")
                        if fishEvent then 
                            fishEvent:FireServer() 
                        end
                    end
                end
            end)
        end
    end
end)

-- TAB: MAIN FEATURES
local MainTab = Window:MakeTab({Name = "Fishing", Icon = "rbxassetid://4483345998", PremiumOnly = false})

MainTab:AddToggle({
	Name = "Auto Fishing (Instant 0-1s)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFish = Value
        if Value then
            OrionLib:MakeNotification({Name = "NewtHub", Content = "Auto Fish Aktif! Click Fast -> 0s", Time = 3})
        end
	end    
})

MainTab:AddToggle({
	Name = "Potato Graphics (FPS Boost)",
	Default = false,
	Callback = function(Value)
		getgenv().PotatoMode = Value
        DoPotato()
	end    
})

-- TAB: SETTINGS
local SettingTab = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})

SettingTab:AddButton({
	Name = "Destroy GUI",
	Callback = function()
        OrionLib:Destroy()
	end    
})

OrionLib:Init()
print("NEWTHUB V3: GUI & INSTANT CATCH READY! 😈💥")
