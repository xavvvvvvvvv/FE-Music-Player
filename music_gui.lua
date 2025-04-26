local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Создаем Sound
local sound = Instance.new("Sound", workspace)
sound.Name = "GlobalMusic"
sound.Looped = true
sound.Volume = 3

-- Создаем GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MusicGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0, 100, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
textBox.Position = UDim2.new(0.1, 0, 0.1, 0)
textBox.PlaceholderText = "Enter Music ID"
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textBox.Parent = frame

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0.4, 0, 0.25, 0)
playButton.Position = UDim2.new(0.05, 0, 0.55, 0)
playButton.Text = "Play"
playButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
playButton.TextColor3 = Color3.new(1, 1, 1)
playButton.Parent = frame

local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0.4, 0, 0.25, 0)
stopButton.Position = UDim2.new(0.55, 0, 0.55, 0)
stopButton.Text = "Stop"
stopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
stopButton.TextColor3 = Color3.new(1, 1, 1)
stopButton.Parent = frame

-- Логика кнопок
playButton.MouseButton1Click:Connect(function()
    local musicId = tonumber(textBox.Text)
    if musicId then
        sound.SoundId = "rbxassetid://" .. musicId
        sound:Play()
    end
end)

stopButton.MouseButton1Click:Connect(function()
    sound:Stop()
end)
