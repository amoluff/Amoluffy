local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- زر فتح القائمة
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0.9, 0, 0.5, 0)
openButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openButton.Text = "فتح"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.Parent = screenGui

-- حواف مستديرة لزر الفتح
local openButtonCorner = Instance.new("UICorner")
openButtonCorner.CornerRadius = UDim.new(0.3, 0)
openButtonCorner.Parent = openButton

-- القائمة الرئيسية
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 250)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- حواف مستديرة للقائمة الرئيسية
local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0.1, 0)
mainFrameCorner.Parent = mainFrame

-- زر الإغلاق (أحمر)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = mainFrame

-- حواف مستديرة لزر الإغلاق
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0.3, 0)
closeButtonCorner.Parent = closeButton

-- زر لفتح القائمة الداخلية
local innerMenuButton = Instance.new("TextButton")
innerMenuButton.Size = UDim2.new(0, 150, 0, 40)
innerMenuButton.Position = UDim2.new(0.5, -75, 0.5, -50)
innerMenuButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
innerMenuButton.Text = "فتح القائمة الداخلية"
innerMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
innerMenuButton.Parent = mainFrame

-- حواف مستديرة لزر القائمة الداخلية
local innerMenuButtonCorner = Instance.new("UICorner")
innerMenuButtonCorner.CornerRadius = UDim.new(0.3, 0)
innerMenuButtonCorner.Parent = innerMenuButton

-- القائمة الداخلية
local innerFrame = Instance.new("Frame")
innerFrame.Size = UDim2.new(0, 180, 0, 150)
innerFrame.Position = UDim2.new(0.5, -90, 0.5, -75)
innerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
innerFrame.Visible = false
innerFrame.Parent = screenGui

-- حواف مستديرة للقائمة الداخلية
local innerFrameCorner = Instance.new("UICorner")
innerFrameCorner.CornerRadius = UDim.new(0.1, 0)
innerFrameCorner.Parent = innerFrame

-- زر "السلام عليكم"
local salamButton = Instance.new("TextButton")
salamButton.Size = UDim2.new(0, 120, 0, 40)
salamButton.Position = UDim2.new(0.5, -60, 0.5, -20)
salamButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
salamButton.Text = "السلام عليكم"
salamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
salamButton.Parent = innerFrame

-- حواف مستديرة لزر "السلام عليكم"
local salamButtonCorner = Instance.new("UICorner")
salamButtonCorner.CornerRadius = UDim.new(0.3, 0)
salamButtonCorner.Parent = salamButton

-- زر إغلاق القائمة الداخلية
local innerCloseButton = Instance.new("TextButton")
innerCloseButton.Size = UDim2.new(0, 30, 0, 30)
innerCloseButton.Position = UDim2.new(1, -35, 0, 5)
innerCloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
innerCloseButton.Text = "X"
innerCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
innerCloseButton.Parent = innerFrame

-- حواف مستديرة لزر إغلاق القائمة الداخلية
local innerCloseButtonCorner = Instance.new("UICorner")
innerCloseButtonCorner.CornerRadius = UDim.new(0.3, 0)
innerCloseButtonCorner.Parent = innerCloseButton

-- وظيفة إرسال رسالة في الشات
local function sendMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- التحكم في فتح وإغلاق القائمة الرئيسية
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- التحكم في فتح وإغلاق القائمة الداخلية
innerMenuButton.MouseButton1Click:Connect(function()
    innerFrame.Visible = true
end)

innerCloseButton.MouseButton1Click:Connect(function()
    innerFrame.Visible = false
end)

-- عند الضغط على زر "السلام عليكم"
salamButton.MouseButton1Click:Connect(function()
    sendMessage("السلام عليكم")
end)
