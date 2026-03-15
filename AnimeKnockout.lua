local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Anime Knockout | Delta Cheat",
    LoadingTitle = "Loading",
    LoadingSubtitle = "Big Advantage",
    ConfigurationSaving = {Enabled = false}
})

local FarmTab = Window:CreateTab("Farm", 4483362458)

FarmTab:CreateToggle({
    Name = "Auto Farm Money (Obby)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = CFrame.new(150, 50, 300)
                        wait(2)
                        for _,v in pairs(workspace:GetDescendants()) do
                            if v:IsA("BasePart") and (v.Name:lower():find("cash") or v.Name:lower():find("orb") or v.Name:lower():find("money") or v.Name:lower():find("coin")) then
                                firetouchinterest(root, v, 0)
                                firetouchinterest(root, v, 1)
                            end
                        end
                    end
                    wait(28)
                    if root then root.CFrame = CFrame.new(0, 10, 0) end
                    wait(1)
                end
            end)
        end
    end
})

local MoveTab = Window:CreateTab("Movement", 4483362458)

MoveTab:CreateSlider({
    Name = "Speed Hack",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 100,
    Callback = function(v)
        local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

MoveTab:CreateButton({
    Name = "Noclip",
    Callback = function()
        local n = true
        game:GetService("RunService").Stepped:Connect(function()
            if n and game.Players.LocalPlayer.Character then
                for _,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end
})

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

Rayfield:Notify("Script Loaded", "Enable Auto Farm and change coordinates")
