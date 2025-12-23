--[[
    █▄░█ █▀▀ █░█░█ ▀█▀ █░█ █░█ █▄░█ █▀▄
    █░▀█ ██▄ ▀▄▀▄▀ ░█░ █▀█ █▄█ █░▀█ █▄▀
    V3 RAYFIELD - ULTRA STABLE
    STATUS: AKTIVE 😈🔥
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "NewtHub V3 😈🔥",
   LoadingTitle = "Injecting NewtHub...",
   LoadingSubtitle = "by KILLER_VOIDS",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "NewtHubConfig",
      FileName = "MainConfig"
   }
})

-- VARIABLES
getgenv().AutoFish = false

-- 1. INSTANT CATCH & SPEED LOGIC
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFish then
            pcall(function()
                local Player = game.Players.LocalPlayer
                local char = Player.Character
                local tool = char:FindFirstChildOfClass("Tool")
                
                if tool then
                    tool.Name = "Ghostfinn Rod"
                    local RS = game:GetService("ReplicatedStorage")
                    local events = RS:FindFirstChild("Events") or RS
                    
                    -- BYPASS SPEED (0-1s)
                    for i = 1, 100 do
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

-- TAB: MAIN
local MainTab = Window:CreateTab("Main Features", 4483345998)

MainTab:CreateToggle({
   Name = "Auto Fishing (Instant 0-1s)",
   CurrentValue = false,
   Flag = "AutoFishToggle",
   Callback = function(Value)
      getgenv().AutoFish = Value
      if Value then
         Rayfield:Notify({
            Title = "NewtHub",
            Content = "Auto Fish Aktif! Click Fast -> 0s",
            Duration = 3,
            Image = 4483345998,
         })
      end
   end,
})

MainTab:CreateButton({
   Name = "Potato Graphics (Boost FPS)",
   Callback = function()
      settings().Rendering.QualityLevel = 1
      for _, v in pairs(game:GetDescendants()) do
          if v:IsA("Part") or v:IsA("MeshPart") then 
              v.Material = Enum.Material.Plastic
              v.Reflectance = 0
          elseif v:IsA("Decal") or v:IsA("Texture") then 
              v.Enabled = false
          end
      end
      Rayfield:Notify({Title = "NewtHub", Content = "Potato Mode Aktif!", Duration = 2})
   end,
})

Rayfield:LoadConfiguration()
