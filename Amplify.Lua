local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- زر فتح القائمة (النقطة الخضراء)
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0.9, 0, 0.5, 0)
openButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openButton.Text = ""
openButton.Parent = screenGui

-- حواف مستديرة لزر الفتح
local openButtonCorner = Instance.new("UICorner")
openButtonCorner.CornerRadius = UDim.new(1, 0) -- دائري بالكامل
openButtonCorner.Parent = openButton

-- جعل النقطة الخضراء قابلة للسحب
local dragging = false
local dragStart = nil
local startPos = nil

-- دالة لبدء السحب
local function startDrag(input, frame)
    dragging = true
    dragStart = input.Position
    startPos = frame.Position
end

-- دالة لإنهاء السحب
local function endDrag()
    dragging = false
end

-- دالة لتحديث موضع الإطار أثناء السحب
local function updateDrag(input, frame)
    if dragging then
        local delta = input.Position - dragStart
        local newX = startPos.X.Offset + delta.X
        local newY = startPos.Y.Offset + delta.Y

        -- تحديث موضع الإطار
        frame.Position = UDim2.new(startPos.X.Scale, newX, startPos.Y.Scale, newY)
    end
end

-- جعل النقطة الخضراء قابلة للسحب
openButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input, openButton)
    end
end)

openButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input, openButton)
    end
end)

openButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

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

-- جعل القائمة الرئيسية قابلة للسحب
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input, mainFrame)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input, mainFrame)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

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
innerFrame.Size = UDim2.new(0, 180, 0, 250) -- زيادة الارتفاع لاستيعاب الأزرار الجديدة
innerFrame.Position = UDim2.new(0.5, -90, 0.5, -125)
innerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
innerFrame.Visible = false
innerFrame.Parent = screenGui

-- حواف مستديرة للقائمة الداخلية
local innerFrameCorner = Instance.new("UICorner")
innerFrameCorner.CornerRadius = UDim.new(0.1, 0)
innerFrameCorner.Parent = innerFrame

-- جعل القائمة الداخلية قابلة للسحب
innerFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input, innerFrame)
    end
end)

innerFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input, innerFrame)
    end
end)

innerFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

-- زر "السلام عليكم"
local salamButton = Instance.new("TextButton")
salamButton.Size = UDim2.new(0, 120, 0, 30)
salamButton.Position = UDim2.new(0.5, -60, 0, 10)
salamButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
salamButton.Text = "السلام عليكم"
salamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
salamButton.Parent = innerFrame

-- حواف مستديرة لزر "السلام عليكم"
local salamButtonCorner = Instance.new("UICorner")
salamButtonCorner.CornerRadius = UDim.new(0.3, 0)
salamButtonCorner.Parent = salamButton

-- زر "💀💀💀"
local skullButton = Instance.new("TextButton")
skullButton.Size = UDim2.new(0, 120, 0, 30)
skullButton.Position = UDim2.new(0.5, -60, 0, 50)
skullButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
skullButton.Text = "💀💀💀"
skullButton.TextColor3 = Color3.fromRGB(255, 255, 255)
skullButton.Parent = innerFrame

-- حواف مستديرة لزر "💀💀💀"
local skullButtonCorner = Instance.new("UICorner")
skullButtonCorner.CornerRadius = UDim.new(0.3, 0)
skullButtonCorner.Parent = skullButton

-- زر "سبحان الله"
local subhanAllahButton = Instance.new("TextButton")
subhanAllahButton.Size = UDim2.new(0, 120, 0, 30)
subhanAllahButton.Position = UDim2.new(0.5, -60, 0, 90)
subhanAllahButton.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
subhanAllahButton.Text = "سبحان الله"
subhanAllahButton.TextColor3 = Color3.fromRGB(255, 255, 255)
subhanAllahButton.Parent = innerFrame

-- حواف مستديرة لزر "سبحان الله"
local subhanAllahButtonCorner = Instance.new("UICorner")
subhanAllahButtonCorner.CornerRadius = UDim.new(0.3, 0)
subhanAllahButtonCorner.Parent = subhanAllahButton

-- زر "الله أكبر"
local allahuAkbarButton = Instance.new("TextButton")
allahuAkbarButton.Size = UDim2.new(0, 120, 0, 30)
allahuAkbarButton.Position = UDim2.new(0.5, -60, 0, 130)
allahuAkbarButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
allahuAkbarButton.Text = "الله أكبر"
allahuAkbarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
allahuAkbarButton.Parent = innerFrame

-- حواف مستديرة لزر "الله أكبر"
local allahuAkbarButtonCorner = Instance.new("UICorner")
allahuAkbarButtonCorner.CornerRadius = UDim.new(0.3, 0)
allahuAkbarButtonCorner.Parent = allahuAkbarButton

-- زر "الحمدلله"
local alhamdulillahButton = Instance.new("TextButton")
alhamdulillahButton.Size = UDim2.new(0, 120, 0, 30)
alhamdulillahButton.Position = UDim2.new(0.5, -60, 0, 170)
alhamdulillahButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
alhamdulillahButton.Text = "الحمدلله"
alhamdulillahButton.TextColor3 = Color3.fromRGB(255, 255, 255)
alhamdulillahButton.Parent = innerFrame

-- حواف مستديرة لزر "الحمدلله"
local alhamdulillahButtonCorner = Instance.new("UICorner")
alhamdulillahButtonCorner.CornerRadius = UDim.new(0.3, 0)
alhamdulillahButtonCorner.Parent = alhamdulillahButton

-- زر "😮✨🔥🌹"
local emojiButton = Instance.new("TextButton")
emojiButton.Size = UDim2.new(0, 120, 0, 30)
emojiButton.Position = UDim2.new(0.5, -60, 0, 210)
emojiButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
emojiButton.Text = "😮✨🔥🌹"
emojiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
emojiButton.Parent = innerFrame

-- حواف مستديرة لزر "😮✨🔥🌹"
local emojiButtonCorner = Instance.new("UICorner")
emojiButtonCorner.CornerRadius = UDim.new(0.3, 0)
emojiButtonCorner.Parent = emojiButton

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

-- نقطة حمراء في أعلى اليمين
local redDot = Instance.new("Frame")
redDot.Size = UDim2.new(0, 10, 0, 10)
redDot.Position = UDim2.new(1, -15, 0, 5)
redDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
redDot.Parent = mainFrame

-- حواف مستديرة للنقطة الحمراء
local redDotCorner = Instance.new("UICorner")
redDotCorner.CornerRadius = UDim.new(1, 0) -- دائري بالكامل
redDotCorner.Parent = redDot

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

-- عند الضغط على زر "💀💀💀"
skullButton.MouseButton1Click:Connect(function()
    sendMessage("💀💀💀")
end)

-- عند الضغط على زر "سبحان الله"
subhanAllahButton.MouseButton1Click:Connect(function()
    sendMessage("سبحان الله")
end)

-- عند الضغط على زر "الله أكبر"
allahuAkbarButton.MouseButton1Click:Connect(function()
    sendMessage("الله أكبر")
end)

-- عند الضغط على زر "الحمدلله"
alhamdulillahButton.MouseButton1Click:Connect(function()
    sendMessage("الحمدلله")
end)

-- عند الضغط على زر "😮✨🔥🌹"
emojiButton.MouseButton1Click:Connect(function()
    sendMessage("😮✨🔥🌹")
end)
