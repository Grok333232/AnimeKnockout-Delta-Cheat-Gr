local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "Anime Knockout | Delta Cheat",
    LoadingTitle = "Grok сделал для тебя",
    LoadingSubtitle = "Большое преимущество",
    ConfigurationSaving = {Enabled = true, FolderName = "GrokAK", FileName = "Config"}
})

-- ==================== MOVEMENT ====================
local MovementTab = Window:CreateTab("Movement", 4483362458)

MovementTab:CreateSlider({
    Name = "Speed Hack",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 100,
    Flag = "Speed",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

MovementTab:CreateToggle({
    Name = "Fly (Space + Ctrl)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        end
    end
})

MovementTab:CreateButton({
    Name = "Noclip",
    Callback = function()
        local noclip = true
        game:GetService("RunService").Stepped:Connect(function()
            if noclip and game.Players.LocalPlayer.Character then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end
})

-- ==================== FARM ====================
local FarmTab = Window:CreateTab("Farm", 4483362458)

FarmTab:CreateToggle({
    Name = "Auto Farm Money (Обби Фарм + сбор)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value and game.Players.LocalPlayer.Character do
                    -- Телепорт в конец оббы (ИЗМЕНИ КООРДИНАТЫ ПОД СЕБЯ!)
                    local endPos = Vector3.new(150, 50, 300)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(endPos + Vector3.new(0,5,0))
                    wait(2)

                    -- Сбор денег/орбов
                    for _,v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (v.Name:lower():find("cash") or v.Name:lower():find("orb") or v.Name:lower():find("money")) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                        end
                    end

                    wait(28)

                    -- Возврат на спавн
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
                    wait(1)
                end
            end)
        end
    end
})

-- ==================== MISC ====================
local MiscTab = Window:CreateTab("Misc", 4483362458)

MiscTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        spawn(function()
            while true do
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(60)
            end
        end)
    end
})

Rayfield:LoadConfiguration()
