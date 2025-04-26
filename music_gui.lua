
-- Создаем GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "MusicPlayerGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Draggable = true
frame.Active = true

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 10)

local musicIdBox = Instance.new("TextBox", frame)
musicIdBox.Size = UDim2.new(0.8, 0, 0.25, 0)
musicIdBox.Position = UDim2.new(0.1, 0, 0.15, 0)
musicIdBox.PlaceholderText = "Enter Music ID"
musicIdBox.Text = ""
musicIdBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
musicIdBox.TextColor3 = Color3.new(1, 1, 1)
musicIdBox.BorderSizePixel = 0
local uiCornerBox = Instance.new("UICorner", musicIdBox)
uiCornerBox.CornerRadius = UDim.new(0, 8)

local playButton = Instance.new("TextButton", frame)
playButton.Size = UDim2.new(0.4, -5, 0.25, 0)
playButton.Position = UDim2.new(0.05, 0, 0.6, 0)
playButton.Text = "Play"
playButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
playButton.TextColor3 = Color3.new(1, 1, 1)
playButton.BorderSizePixel = 0
local uiCornerPlay = Instance.new("UICorner", playButton)
uiCornerPlay.CornerRadius = UDim.new(0, 8)

local stopButton = Instance.new("TextButton", frame)
stopButton.Size = UDim2.new(0.4, -5, 0.25, 0)
stopButton.Position = UDim2.new(0.55, 0, 0.6, 0)
stopButton.Text = "Stop"
stopButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
stopButton.TextColor3 = Color3.new(1, 1, 1)
stopButton.BorderSizePixel = 0
local uiCornerStop = Instance.new("UICorner", stopButton)
uiCornerStop.CornerRadius = UDim.new(0, 8)

-- Создаем Sound в Workspace
local sound = Instance.new("Sound", workspace)
sound.Looped = true
sound.Volume = 5

-- Play кнопка
playButton.MouseButton1Click:Connect(function()
    local musicId = tonumber(musicIdBox.Text)
    if musicId then
        sound.SoundId = "rbxassetid://" .. musicId
        sound:Play()
    end
end)

-- Stop кнопка
stopButton.MouseButton1Click:Connect(function()
    sound:Stop()
end)
