-- Локальный скрипт в StarterPack
local tool = Instance.new("Tool")
tool.Name = "PlayerGrabber"
tool.RequiresHandle = false
tool.CanBeDropped = false

local mouse
local targetHumanoidRootPart
local connection

tool.Activated:Connect(function()
    if not mouse then
        mouse = game.Players.LocalPlayer:GetMouse()
    end

    local target = mouse.Target
    if target and target.Parent then
        local targetCharacter = target:FindFirstAncestorWhichIsA("Model")
        if targetCharacter and targetCharacter:FindFirstChild("Humanoid") and targetCharacter:FindFirstChild("HumanoidRootPart") then
            targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
            
            if connection then connection:Disconnect() end
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if targetHumanoidRootPart and mouse then
                    local unitRay = mouse.UnitRay
                    local newPos = unitRay.Origin + unitRay.Direction * 10
                    targetHumanoidRootPart.CFrame = CFrame.new(newPos)
                end
            end)
        end
    end
end)

tool.Deactivated:Connect(function()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    targetHumanoidRootPart = nil
end)

tool.Parent = game.Players.LocalPlayer.Backpack
