-- Создание элементов интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedButton = Instance.new("TextButton")
local JumpButton = Instance.new("TextButton")
local EspButton = Instance.new("TextButton")

-- Привязка к интерфейсу игрока
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Настройка главного окна панели
MainFrame.Name = "ControlPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 260)
MainFrame.Active = true
MainFrame.Draggable = true

-- Заголовок панели
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "POTASSIUM MENU"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

-- Функция для стилизации кнопок
local function styleButton(btn, text, positionY)
    btn.Parent = MainFrame
    btn.Position = UDim2.new(0.05, 0, positionY, 0)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSans
end

styleButton(SpeedButton, "Скорость: ВЫКЛ", 0.22)
styleButton(JumpButton, "Прыжок: ВЫКЛ", 0.45)
styleButton(EspButton, "Подсветка ESP: ВЫКЛ", 0.68)

-- Переменные состояний
local speedActive = false
local jumpActive = false
local espActive = false

-- Логика кнопки скорости
SpeedButton.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    local char = game:GetService("Players").LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if speedActive then
            char.Humanoid.WalkSpeed = 100
            SpeedButton.Text = "Скорость: ВКЛ"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            char.Humanoid.WalkSpeed = 16
            SpeedButton.Text = "Скорость: ВЫКЛ"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end
end)

-- Логика кнопки прыжка
JumpButton.MouseButton1Click:Connect(function()
    jumpActive = not jumpActive
    local char = game:GetService("Players").LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if jumpActive then
            char.Humanoid.JumpPower = 150
            JumpButton.Text = "Прыжок: ВКЛ"
            JumpButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            char.Humanoid.JumpPower = 50
            JumpButton.Text = "Прыжок: ВЫКЛ"
            JumpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end
end)

-- Логика кнопки ESP (Подсветки)
EspButton.MouseButton1Click:Connect(function()
    espActive = not espActive
    if espActive then
        EspButton.Text = "Подсветка ESP: ВКЛ"
        EspButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        -- Включение подсветки
        for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
            if p ~= game:GetService("Players").LocalPlayer and p.Character then
                local hl = Instance.new("Highlight")
                hl.Name = "MenuESP"
                hl.Parent = p.Character
                hl.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    else
        EspButton.Text = "Подсветка ESP: ВЫКЛ"
        EspButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        -- Удаление подсветки
        for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("MenuESP") then
                p.Character.MenuESP:Destroy()
            end
        end
    end
end)
