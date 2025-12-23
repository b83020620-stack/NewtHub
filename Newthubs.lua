local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "NewtHub V3 😈🔥",
   LoadingTitle = "ULTRA AUTOMATION LOADED",
   LoadingSubtitle = "by KILLER_VOIDS",
   ConfigurationSaving = {Enabled = true, FolderName = "NewtHubConfig", FileName = "MainConfig"}
})

-- VARIABLES (LANGSUNG TRUE BIAR GAK USAH KLIK AUTO LAGI)
getgenv().AutoFish = true 
getgenv().AutoEquip = true
getgenv().FishDelay = 0

-- 1. LOGIC AUTO EQUIP ROD (AUTO USE)
task.spawn(function()
    while task.wait(1) do
        if getgenv().AutoEquip then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local backpack = game.Players.LocalPlayer.Backpack
                -- Cari rod apa saja di backpack dan pakai
                if not char:FindFirstChildOfClass("Tool") then
                    local tool = backpack:FindFirstChildOfClass("Tool")
                    if tool then
                        char.Humanoid:EquipTool(tool)
                    end
                end
            end)
        end
    end
end)

-- 2. LOGIC BRUTAL FISHING (BYPASS CLICK FAST 0s)
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFish then
            pcall(function()
                local RS = game:GetService("ReplicatedStorage")
                -- Nembak RemoteEvent game biar langsung dapet ikan
                local event = RS:FindFirstChild("Events") and (RS.Events:FindFirstChild("FishingEvent") or RS.Events:FindFirstChild("RemoteEvent"))
                
                if event then
                    for i = 1, 250 do 
                        event:FireServer()
                    end
                    task.wait(getgenv().FishDelay)
                end
            end)
        end
    end
end)

-- UI TABS
local MainTab = Window:CreateTab("Main Features", 4483345998)

MainTab:CreateToggle({
   Name = "Auto Fishing (Instant)",
   CurrentValue = true,
   Callback = function(Value) getgenv().AutoFish = Value end,
})

MainTab:CreateToggle({
   Name = "Auto Use/Equip Rod",
   CurrentValue = true,
   Callback = function(Value) getgenv().AutoEquip = Value end,
})

MainTab:CreateSlider({
   Name = "Fishing Speed",
   Info = "0 = Paling Brutal",
   Min = 0,
   Max = 1,
   Increment = 0.1,
   Suffix = "s",
   CurrentValue = 0,
   Callback = function(Value) getgenv().FishDelay = Value end,
})

Rayfield:LoadConfiguration()
