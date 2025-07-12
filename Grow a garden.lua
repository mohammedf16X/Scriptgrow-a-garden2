-- Pet Interface Script for Roblox
-- Pet Interface with Common Egg Buy Button

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Define the RemoteEvent
local BuyPetEggEvent = ReplicatedStorage:WaitForChild("BuyPetEgg")

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
openIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
openIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
openIcon.ZIndex = 1000

-- Icon Corner
local openIconCorner = Instance.new("UICorner")
openIconCorner.CornerRadius = UDim.new(0.5, 0)
openIconCorner.Parent = openIcon

-- Icon Shadow
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

-- Interface Corner
local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 15)
mainFrameCorner.Parent = mainFrame

-- Interface Shadow
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

-- Title Bar Corner
local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 15)
titleBarCorner.Parent = titleBar

-- Hide bottom part of corner
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

-- Close Button Corner
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0.5, 0)
closeButtonCorner.Parent = closeButton

-- Interface Content
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, 0, 1, -100)
contentFrame.Position = UDim2.new(0, 0, 0, 50)
contentFrame.BackgroundTransparency = 1

-- Pet Section Title
local petTitle = Instance.new("TextLabel")
petTitle.Name = "PetTitle"
petTitle.Parent = contentFrame
petTitle.Size = UDim2.new(1, 0, 0, 40)
petTitle.Position = UDim2.new(0, 0, 0, 20)
petTitle.BackgroundTransparency = 1
petTitle.Text = "Pet"
petTitle.TextColor3 = Color3.fromRGB(51, 51, 51)
petTitle.TextScaled = true
petTitle.Font = Enum.Font.GothamBold

-- Buy Common Egg Button
local buyEggButton = Instance.new("TextButton")
buyEggButton.Name = "BuyEggButton"
buyEggButton.Parent = contentFrame
buyEggButton.Size = UDim2.new(0, 200, 0, 80)
buyEggButton.Position = UDim2.new(0.5, -100, 0.5, -20)
buyEggButton.BackgroundColor3 = Color3.fromRGB(255, 234, 167)
buyEggButton.BorderSizePixel = 0
buyEggButton.Text = "🥚\nBuy Common Egg\n50,000 💰"
buyEggButton.TextColor3 = Color3.fromRGB(45, 52, 54)
buyEggButton.TextScaled = true
buyEggButton.Font = Enum.Font.Gotham

-- Buy Button Corner
local buyEggButtonCorner = Instance.new("UICorner")
buyEggButtonCorner.CornerRadius = UDim.new(0, 12)
buyEggButtonCorner.Parent = buyEggButton

-- Buy Button Shadow
local buyEggButtonStroke = Instance.new("UIStroke")
buyEggButtonStroke.Color = Color3.fromRGB(0, 0, 0)
buyEggButtonStroke.Transparency = 0.9
buyEggButtonStroke.Thickness = 2
buyEggButtonStroke.Parent = buyEggButton

-- Status Bar
local statusBar = Instance.new("Frame")
statusBar.Name = "StatusBar"
statusBar.Parent = mainFrame
statusBar.Size = UDim2.new(1, 0, 0, 50)
statusBar.Position = UDim2.new(0, 0, 1, -50)
statusBar.BackgroundColor3 = Color3.fromRGB(248, 249, 250)
statusBar.BorderSizePixel = 0

-- Status Bar Line
local statusBarLine = Instance.new("Frame")
statusBarLine.Parent = statusBar
statusBarLine.Size = UDim2.new(1, 0, 0, 1)
statusBarLine.Position = UDim2.new(0, 0, 0, 0)
statusBarLine.BackgroundColor3 = Color3.fromRGB(233, 236, 239)
statusBarLine.BorderSizePixel = 0

-- Status Text
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

-- Confirmation Content
local confirmContent = Instance.new("Frame")
confirmContent.Name = "ConfirmContent"
confirmContent.Parent = confirmFrame
confirmContent.Size = UDim2.new(0, 300, 0, 200)
confirmContent.Position = UDim2.new(0.5, -150, 0.5, -100)
confirmContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
confirmContent.BorderSizePixel = 0

-- Confirmation Corner
local confirmContentCorner = Instance.new("UICorner")
confirmContentCorner.CornerRadius = UDim.new(0, 15)
confirmContentCorner.Parent = confirmContent

-- Confirmation Title
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

-- Confirmation Text
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

-- Confirmation Buttons
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

-- Egg purchase function (fires RemoteEvent)
local function buyCommonEgg()
    statusLabel.Text = "Attempting purchase..."
    
    -- Fire the RemoteEvent to the server
    -- Assuming the server-side script handles the actual purchase logic (e.g., checking money, giving egg)
    BuyPetEggEvent:FireServer("CommonEgg", 50000) -- Pass egg type and price
    
    -- You might want to listen for a response from the server to update the statusLabel
    -- For now, we'll simulate a success message after a short delay
    
    wait(1) -- Simulate network delay
    
    -- Success effect (client-side visual feedback)
    buyEggButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148)
    local successTween = TweenService:Create(buyEggButton, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 220, 0, 90)
    })
    successTween:Play()
    
    statusLabel.Text = "Purchase request sent! Waiting for server..."
    
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

-- Drag events
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        updateInput(input)
    end
end)

-- Drag open icon
local iconDragging = false
local iconDragStart = nil
local iconStartPos = nil

local function updateIconInput(input)
    local delta = input.Position - iconDragStart
    local position = UDim2.new(iconStartPos.X.Scale, iconStartPos.X.Offset + delta.X, iconStartPos.Y.Scale, iconStartPos.Y.Offset + delta.Y)
    openIcon.Position = position
end

openIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        iconDragging = true
        iconDragStart = input.Position
        iconStartPos = openIcon.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputType.End then
                iconDragging = false
            end
        end)
    end
end)

openIcon.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and iconDragging then
        updateIconInput(input)
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

