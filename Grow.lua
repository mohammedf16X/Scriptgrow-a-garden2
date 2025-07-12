-- Pet Interface Script for Roblox
-- Pet Interface with Common Egg Buy Button and Settings

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Define the RemoteEvent (ensure it exists in ReplicatedStorage on the server)
local BuyPetEggEvent = ReplicatedStorage:WaitForChild("BuyPetEgg", 10) -- Add timeout for robustness

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PetInterface"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Open Icon
local openIcon = Instance.new("ImageButton")
openIcon.Name = "OpenIcon"
openIcon.Parent = screenGui
openIcon.Size = UDim2.new(0, 60, 0, 60)
openIcon.Position = UDim2.new(0, 20, 0, 20)
openIcon.BackgroundColor3 = Color3.fromRGB(255, 107, 107)
openIcon.BorderSizePixel = 0
openIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png" -- Placeholder image
openIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
openIcon.ZIndex = 1000
openIcon.BackgroundTransparency = 0.2 -- Make it slightly transparent

local openIconCorner = Instance.new("UICorner")
openIconCorner.CornerRadius = UDim.new(0.5, 0)
openIconCorner.Parent = openIcon

local openIconStroke = Instance.new("UIStroke")
openIconStroke.Color = Color3.fromRGB(0, 0, 0)
openIconStroke.Transparency = 0.7
openIconStroke.Thickness = 2
openIconStroke.Parent = openIcon

-- Main Interface Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainInterface"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.ZIndex = 999

local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 15)
mainFrameCorner.Parent = mainFrame

local mainFrameStroke = Instance.new("UIStroke")
mainFrameStroke.Color = Color3.fromRGB(0, 0, 0)
mainFrameStroke.Transparency = 0.8
mainFrameStroke.Thickness = 3
mainFrameStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(79, 172, 254)
titleBar.BorderSizePixel = 0

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 15)
titleBarCorner.Parent = titleBar

local titleBarBottom = Instance.new("Frame")
titleBarBottom.Parent = titleBar
titleBarBottom.Size = UDim2.new(1, 0, 0, 15)
titleBarBottom.Position = UDim2.new(0, 0, 1, -15)
titleBarBottom.BackgroundColor3 = Color3.fromRGB(79, 172, 254)
titleBarBottom.BorderSizePixel = 0

-- Interface Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Pet Interface"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0.5, -15)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundTransparency = 0.8
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0.5, 0)
closeButtonCorner.Parent = closeButton

-- Settings Button
local settingsButton = Instance.new("TextButton")
settingsButton.Name = "SettingsButton"
settingsButton.Parent = titleBar
settingsButton.Size = UDim2.new(0, 30, 0, 30)
settingsButton.Position = UDim2.new(1, -75, 0.5, -15) -- Position next to close button
settingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingsButton.BackgroundTransparency = 0.8
settingsButton.BorderSizePixel = 0
settingsButton.Text = "⚙️" -- Gear icon
settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsButton.TextScaled = true
settingsButton.Font = Enum.Font.GothamBold

local settingsButtonCorner = Instance.new("UICorner")
settingsButtonCorner.CornerRadius = UDim.new(0.5, 0)
settingsButtonCorner.Parent = settingsButton

-- Interface Content (holds different sections)
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, 0, 1, -100)
contentFrame.Position = UDim2.new(0, 0, 0, 50)
contentFrame.BackgroundTransparency = 1

-- Pet Section
local petSection = Instance.new("Frame")
petSection.Name = "PetSection"
petSection.Parent = contentFrame
petSection.Size = UDim2.new(1, 0, 1, 0)
petSection.Position = UDim2.new(0, 0, 0, 0)
petSection.BackgroundTransparency = 1
petSection.Visible = true

local petTitle = Instance.new("TextLabel")
petTitle.Name = "PetTitle"
petTitle.Parent = petSection
petTitle.Size = UDim2.new(1, 0, 0, 40)
petTitle.Position = UDim2.new(0, 0, 0, 20)
petTitle.BackgroundTransparency = 1
petTitle.Text = "Pet"
petTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
petTitle.TextScaled = true
petTitle.Font = Enum.Font.GothamBold
petTitle.TextXAlignment = Enum.TextXAlignment.Center

local buyEggButton = Instance.new("TextButton")
buyEggButton.Name = "BuyEggButton"
buyEggButton.Parent = petSection
buyEggButton.Size = UDim2.new(0, 200, 0, 80)
buyEggButton.Position = UDim2.new(0.5, -100, 0.5, -20)
buyEggButton.BackgroundColor3 = Color3.fromRGB(255, 234, 167)
buyEggButton.BorderSizePixel = 0
buyEggButton.Text = "🥚\nBuy Common Egg\n50,000 💰"
buyEggButton.TextColor3 = Color3.fromRGB(45, 52, 54)
buyEggButton.TextScaled = true
buyEggButton.Font = Enum.Font.Gotham
buyEggButton.TextWrapped = true

local buyEggButtonCorner = Instance.new("UICorner")
buyEggButtonCorner.CornerRadius = UDim.new(0, 12)
buyEggButtonCorner.Parent = buyEggButton

local buyEggButtonStroke = Instance.new("UIStroke")
buyEggButtonStroke.Color = Color3.fromRGB(0, 0, 0)
buyEggButtonStroke.Transparency = 0.9
buyEggButtonStroke.Thickness = 2
buyEggButtonStroke.Parent = buyEggButton

-- Settings Section
local settingsSection = Instance.new("Frame")
settingsSection.Name = "SettingsSection"
settingsSection.Parent = contentFrame
settingsSection.Size = UDim2.new(1, 0, 1, 0)
settingsSection.Position = UDim2.new(0, 0, 0, 0)
settingsSection.BackgroundTransparency = 1
settingsSection.Visible = false

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Name = "SettingsTitle"
settingsTitle.Parent = settingsSection
settingsTitle.Size = UDim2.new(1, 0, 0, 40)
settingsTitle.Position = UDim2.new(0, 0, 0, 20)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
settingsTitle.TextScaled = true
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextXAlignment = Enum.TextXAlignment.Center

-- Theme Changer
local themeLabel = Instance.new("TextLabel")
themeLabel.Name = "ThemeLabel"
themeLabel.Parent = settingsSection
themeLabel.Size = UDim2.new(0, 150, 0, 30)
themeLabel.Position = UDim2.new(0.5, -170, 0.5, -50)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "Select Theme:"
themeLabel.TextColor3 = Color3.fromRGB(51, 51, 51)
themeLabel.TextScaled = true
themeLabel.Font = Enum.Font.Gotham
themeLabel.TextXAlignment = Enum.TextXAlignment.Left

local themeDropdown = Instance.new("TextButton")
themeDropdown.Name = "ThemeDropdown"
themeDropdown.Parent = settingsSection
themeDropdown.Size = UDim2.new(0, 150, 0, 30)
themeDropdown.Position = UDim2.new(0.5, 20, 0.5, -50)
themeDropdown.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
themeDropdown.BorderSizePixel = 1
themeDropdown.BorderColor3 = Color3.fromRGB(180, 180, 180)
themeDropdown.Text = "Default Theme"
themeDropdown.TextColor3 = Color3.fromRGB(51, 51, 51)
themeDropdown.TextScaled = true
themeDropdown.Font = Enum.Font.Gotham

local themeDropdownCorner = Instance.new("UICorner")
themeDropdownCorner.CornerRadius = UDim.new(0, 5)
themeDropdownCorner.Parent = themeDropdown

local themeOptionsFrame = Instance.new("Frame")
themeOptionsFrame.Name = "ThemeOptionsFrame"
themeOptionsFrame.Parent = settingsSection
themeOptionsFrame.Size = UDim2.new(0, 150, 0, 90) -- 3 options * 30 height
themeOptionsFrame.Position = UDim2.new(0.5, 20, 0.5, -20)
themeOptionsFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
themeOptionsFrame.BorderSizePixel = 1
themeOptionsFrame.BorderColor3 = Color3.fromRGB(180, 180, 180)
themeOptionsFrame.Visible = false

local themeOptionsFrameCorner = Instance.new("UICorner")
themeOptionsFrameCorner.CornerRadius = UDim.new(0, 5)
themeOptionsFrameCorner.Parent = themeOptionsFrame

local defaultThemeBtn = Instance.new("TextButton")
defaultThemeBtn.Name = "DefaultTheme"
defaultThemeBtn.Parent = themeOptionsFrame
defaultThemeBtn.Size = UDim2.new(1, 0, 0, 30)
defaultThemeBtn.Position = UDim2.new(0, 0, 0, 0)
defaultThemeBtn.BackgroundTransparency = 1
defaultThemeBtn.Text = "Default Theme"
defaultThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
defaultThemeBtn.TextScaled = true
defaultThemeBtn.Font = Enum.Font.Gotham
defaultThemeBtn.TextXAlignment = Enum.TextXAlignment.Left
defaultThemeBtn.TextPadding = UDim.new(0, 5)

local darkThemeBtn = Instance.new("TextButton")
darkThemeBtn.Name = "DarkTheme"
darkThemeBtn.Parent = themeOptionsFrame
darkThemeBtn.Size = UDim2.new(1, 0, 0, 30)
darkThemeBtn.Position = UDim2.new(0, 0, 0, 30)
darkThemeBtn.BackgroundTransparency = 1
darkThemeBtn.Text = "Dark Theme"
darkThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
darkThemeBtn.TextScaled = true
darkThemeBtn.Font = Enum.Font.Gotham
darkThemeBtn.TextXAlignment = Enum.TextXAlignment.Left
darkThemeBtn.TextPadding = UDim.new(0, 5)

local lightThemeBtn = Instance.new("TextButton")
lightThemeBtn.Name = "LightTheme"
lightThemeBtn.Parent = themeOptionsFrame
lightThemeBtn.Size = UDim2.new(1, 0, 0, 30)
lightThemeBtn.Position = UDim2.new(0, 0, 0, 60)
lightThemeBtn.BackgroundTransparency = 1
lightThemeBtn.Text = "Light Theme"
lightThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
lightThemeBtn.TextScaled = true
lightThemeBtn.Font = Enum.Font.Gotham
lightThemeBtn.TextXAlignment = Enum.TextXAlignment.Left
lightThemeBtn.TextPadding = UDim.new(0, 5)

-- Status Bar
local statusBar = Instance.new("Frame")
statusBar.Name = "StatusBar"
statusBar.Parent = mainFrame
statusBar.Size = UDim2.new(1, 0, 0, 50)
statusBar.Position = UDim2.new(0, 0, 1, -50)
statusBar.BackgroundColor3 = Color3.fromRGB(248, 249, 250)
statusBar.BorderSizePixel = 0

local statusBarLine = Instance.new("Frame")
statusBarLine.Parent = statusBar
statusBarLine.Size = UDim2.new(1, 0, 0, 1)
statusBarLine.Position = UDim2.new(0, 0, 0, 0)
statusBarLine.BackgroundColor3 = Color3.fromRGB(233, 236, 239)
statusBarLine.BorderSizePixel = 0

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Parent = statusBar
statusLabel.Size = UDim2.new(1, -20, 1, 0)
statusLabel.Position = UDim2.new(0, 10, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Ready to purchase"
statusLabel.TextColor3 = Color3.fromRGB(108, 117, 125)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Confirmation Modal
local confirmFrame = Instance.new("Frame")
confirmFrame.Name = "ConfirmFrame"
confirmFrame.Parent = screenGui
confirmFrame.Size = UDim2.new(1, 0, 1, 0)
confirmFrame.Position = UDim2.new(0, 0, 0, 0)
confirmFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
confirmFrame.BackgroundTransparency = 0.5
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
confirmFrame.ZIndex = 1001

local confirmContent = Instance.new("Frame")
confirmContent.Name = "ConfirmContent"
confirmContent.Parent = confirmFrame
confirmContent.Size = UDim2.new(0, 300, 0, 200)
confirmContent.Position = UDim2.new(0.5, -150, 0.5, -100)
confirmContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
confirmContent.BorderSizePixel = 0

local confirmContentCorner = Instance.new("UICorner")
confirmContentCorner.CornerRadius = UDim.new(0, 15)
confirmContentCorner.Parent = confirmContent

local confirmTitle = Instance.new("TextLabel")
confirmTitle.Name = "ConfirmTitle"
confirmTitle.Parent = confirmContent
confirmTitle.Size = UDim2.new(1, -20, 0, 40)
confirmTitle.Position = UDim2.new(0, 10, 0, 20)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "Confirm Purchase"
confirmTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
confirmTitle.TextScaled = true
confirmTitle.Font = Enum.Font.GothamBold

local confirmText = Instance.new("TextLabel")
confirmText.Name = "ConfirmText"
confirmText.Parent = confirmContent
confirmText.Size = UDim2.new(1, -20, 0, 60)
confirmText.Position = UDim2.new(0, 10, 0, 70)
confirmText.BackgroundTransparency = 1
confirmText.Text = "Do you want to buy a Common Egg for 50,000 Sheckles?"
confirmText.TextColor3 = Color3.fromRGB(102, 102, 102)
confirmText.TextScaled = true
confirmText.Font = Enum.Font.Gotham
confirmText.TextWrapped = true

local confirmButton = Instance.new("TextButton")
confirmButton.Name = "ConfirmButton"
confirmButton.Parent = confirmContent
confirmButton.Size = UDim2.new(0, 80, 0, 30)
confirmButton.Position = UDim2.new(0.5, -90, 1, -50)
confirmButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148)
confirmButton.BorderSizePixel = 0
confirmButton.Text = "Confirm"
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.TextScaled = true
confirmButton.Font = Enum.Font.GothamBold

local confirmButtonCorner = Instance.new("UICorner")
confirmButtonCorner.CornerRadius = UDim.new(0, 8)
confirmButtonCorner.Parent = confirmButton

local cancelButton = Instance.new("TextButton")
cancelButton.Name = "CancelButton"
cancelButton.Parent = confirmContent
cancelButton.Size = UDim2.new(0, 80, 0, 30)
cancelButton.Position = UDim2.new(0.5, 10, 1, -50)
cancelButton.BackgroundColor3 = Color3.fromRGB(221, 221, 221)
cancelButton.BorderSizePixel = 0
cancelButton.Text = "Cancel"
cancelButton.TextColor3 = Color3.fromRGB(51, 51, 51)
cancelButton.TextScaled = true
cancelButton.Font = Enum.Font.GothamBold

local cancelButtonCorner = Instance.new("UICorner")
cancelButtonCorner.CornerRadius = UDim.new(0, 8)
cancelButtonCorner.Parent = cancelButton

-- Drag variables
local dragging = false
local dragStart = nil
local startPos = nil

-- Drag functions
local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    mainFrame.Position = position
end

-- Interface control functions
local function showInterface()
    mainFrame.Visible = true
    openIcon.Visible = false
    
    -- Show animation
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local showTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150)
    })
    showTween:Play()
end

local function hideInterface()
    local hideTween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    
    hideTween:Play()
    hideTween.Completed:Connect(function()
        mainFrame.Visible = false
        openIcon.Visible = true
    end)
end

local function showConfirm()
    confirmFrame.Visible = true
    confirmContent.Size = UDim2.new(0, 0, 0, 0)
    confirmContent.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local showTween = TweenService:Create(confirmContent, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 200),
        Position = UDim2.new(0.5, -150, 0.5, -100)
    })
    showTween:Play()
end

local function hideConfirm()
    local hideTween = TweenService:Create(confirmContent, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    
    hideTween:Play()
    hideTween.Completed:Connect(function()
        confirmFrame.Visible = false
    end)
end

-- Function to switch sections
local function showSection(sectionName)
    petSection.Visible = (sectionName == "Pet")
    settingsSection.Visible = (sectionName == "Settings")
end

-- Theme application function
local function applyTheme(themeName)
    if themeName == "Default Theme" then
        mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        titleBar.BackgroundColor3 = Color3.fromRGB(79, 172, 254)
        titleBarBottom.BackgroundColor3 = Color3.fromRGB(79, 172, 254)
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        settingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        petTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
        buyEggButton.BackgroundColor3 = Color3.fromRGB(255, 234, 167)
        buyEggButton.TextColor3 = Color3.fromRGB(45, 52, 54)
        statusBar.BackgroundColor3 = Color3.fromRGB(248, 249, 250)
        statusLabel.TextColor3 = Color3.fromRGB(108, 117, 125)
        settingsTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
        themeLabel.TextColor3 = Color3.fromRGB(51, 51, 51)
        themeDropdown.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        themeDropdown.BorderColor3 = Color3.fromRGB(180, 180, 180)
        themeDropdown.TextColor3 = Color3.fromRGB(51, 51, 51)
        themeOptionsFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        themeOptionsFrame.BorderColor3 = Color3.fromRGB(180, 180, 180)
        defaultThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
        darkThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
        lightThemeBtn.TextColor3 = Color3.fromRGB(51, 51, 51)
    elseif themeName == "Dark Theme" then
        mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        titleBarBottom.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        settingsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        petTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
        buyEggButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        buyEggButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        statusBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        settingsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
        themeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        themeDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        themeDropdown.BorderColor3 = Color3.fromRGB(100, 100, 100)
        themeDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
        themeOptionsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        themeOptionsFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
        defaultThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        darkThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        lightThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    elseif themeName == "Light Theme" then
        mainFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        titleBar.BackgroundColor3 = Color3.fromRGB(100, 180, 250)
        titleBarBottom.BackgroundColor3 = Color3.fromRGB(100, 180, 250)
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        closeButton.TextColor3 = Color3.fromRGB(50, 50, 50)
        settingsButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        settingsButton.TextColor3 = Color3.fromRGB(50, 50, 50)
        petTitle.TextColor3 = Color3.fromRGB(30, 30, 30)
        buyEggButton.BackgroundColor3 = Color3.fromRGB(250, 250, 200)
        buyEggButton.TextColor3 = Color3.fromRGB(30, 30, 30)
        statusBar.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        statusLabel.TextColor3 = Color3.fromRGB(80, 80, 80)
        settingsTitle.TextColor3 = Color3.fromRGB(30, 30, 30)
        themeLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
        themeDropdown.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        themeDropdown.BorderColor3 = Color3.fromRGB(150, 150, 150)
        themeDropdown.TextColor3 = Color3.fromRGB(30, 30, 30)
        themeOptionsFrame.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        themeOptionsFrame.BorderColor3 = Color3.fromRGB(150, 150, 150)
        defaultThemeBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
        darkThemeBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
        lightThemeBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
    end
    themeDropdown.Text = themeName
    themeOptionsFrame.Visible = false
end

-- Egg purchase function (fires RemoteEvent)
local function buyCommonEgg()
    statusLabel.Text = "Attempting purchase..."
    
    -- Fire the RemoteEvent to the server
    -- Assuming the server-side script handles the actual purchase logic (e.g., checking money, giving egg)
    if BuyPetEggEvent then
        BuyPetEggEvent:FireServer("CommonEgg", 50000) -- Pass egg type and price
        statusLabel.Text = "Purchase request sent! Waiting for server..."
    else
        statusLabel.Text = "Error: BuyPetEgg RemoteEvent not found!"
    end
    
    -- You might want to listen for a response from the server to update the statusLabel
    -- For now, we'll simulate a success message after a short delay for visual feedback
    
    wait(1) -- Simulate network delay
    
    -- Success effect (client-side visual feedback)
    buyEggButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148)
    local successTween = TweenService:Create(buyEggButton, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 220, 0, 90)
    })
    successTween:Play()
    
    wait(2)
    
    -- Reset button
    local resetTween = TweenService:Create(buyEggButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 200, 0, 80),
        BackgroundColor3 = Color3.fromRGB(255, 234, 167)
    })
    resetTween:Play()
    
    statusLabel.Text = "Ready to purchase"
end

-- Event connections
openIcon.MouseButton1Click:Connect(showInterface)
closeButton.MouseButton1Click:Connect(hideInterface)
settingsButton.MouseButton1Click:Connect(function()
    showSection("Settings")
end)

buyEggButton.MouseButton1Click:Connect(function()
    showConfirm()
end)

confirmButton.MouseButton1Click:Connect(function()
    hideConfirm()
    buyCommonEgg()
end)

cancelButton.MouseButton1Click:Connect(function()
    hideConfirm()
end)

themeDropdown.MouseButton1Click:Connect(function()
    themeOptionsFrame.Visible = not themeOptionsFrame.Visible
end)

defaultThemeBtn.MouseButton1Click:Connect(function()
    applyTheme("Default Theme")
end)
darkThemeBtn.MouseButton1Click:Connect(function()
    applyTheme("Dark Theme")
end)
lightThemeBtn.MouseButton1Click:Connect(function()
    applyTheme("Light Theme")
end)

-- Drag events for mainFrame
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        local connection
        connection = UserInputService.InputChanged:Connect(function(inputChanged)
            if inputChanged.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateInput(inputChanged)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(inputEnded)
            if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                if connection then connection:Disconnect() end
            end
        end)
    end
end)

-- Drag events for openIcon
local iconDragging = false
local iconDragStart = nil
local iconStartPos = nil

openIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        iconDragging = true
        iconDragStart = input.Position
        iconStartPos = openIcon.Position
        
        local connection
        connection = UserInputService.InputChanged:Connect(function(inputChanged)
            if inputChanged.UserInputType == Enum.UserInputType.MouseMovement and iconDragging then
                updateIconInput(inputChanged)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(inputEnded)
            if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 then
                iconDragging = false
                if connection then connection:Disconnect() end
            end
        end)
    end
end)

-- Interaction effects
openIcon.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(openIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 70, 0, 70)
    })
    hoverTween:Play()
end)

openIcon.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(openIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 60, 0, 60)
    })
    leaveTween:Play()
end)

buyEggButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(buyEggButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(253, 203, 110)
    })
    hoverTween:Play()
end)

buyEggButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(buyEggButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(255, 234, 167)
    })
    leaveTween:Play()
end)

print("Pet Interface loaded successfully!")
