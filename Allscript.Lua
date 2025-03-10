local-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء الإطار الرئيسي
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 210, 0, 270) -- زيادة الارتفاع لاستيعاب الزر الجديد
frame.Position = UDim2.new(0.7, -160, 0.9, -135)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

-- جعل الإطار بشكل Squircle (زوايا مستديرة)
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 20)
frameCorner.Parent = frame

-- إضافة خاصية السحب والتحريك
local dragging = false
local dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- إنشاء زر الإغلاق (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -50, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
closeButton.Parent = frame

-- جعل زر الإغلاق بشكل Squircle (زوايا مستديرة)
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 15)
buttonCorner.Parent = closeButton

-- وظيفة إغلاق القائمة عند النقر على X
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- إنشاء ScrollingFrame لجعل القائمة قابلة للتمرير
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -50) -- حجم ScrollingFrame
scrollFrame.Position = UDim2.new(0, 5, 0, 40) -- موضعه داخل الإطار الرئيسي
scrollFrame.BackgroundTransparency = 1 -- شفاف
scrollFrame.ScrollBarThickness = 5 -- سمك شريط التمرير
scrollFrame.Parent = frame

-- إنشاء قائمة داخل ScrollingFrame
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10) -- المسافة بين الأزرار
listLayout.Parent = scrollFrame

-- إنشاء زر Fly
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 140, 0, 40)
flyButton.Text = "Fly"
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.BackgroundColor3 = Color3.new(1, 0.5, 0) -- لون برتقالي
flyButton.Parent = scrollFrame

-- جعل زر Fly بشكل Squircle (زوايا مستديرة)
local flyButtonCorner = Instance.new("UICorner")
flyButtonCorner.CornerRadius = UDim.new(0, 10)
flyButtonCorner.Parent = flyButton

-- وظيفة تشغيل سكربت Fly عند النقر على زر Fly
flyButton.MouseButton1Click:Connect(function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

-- إنشاء زر REDZ BLOX
local redzButton = Instance.new("TextButton")
redzButton.Size = UDim2.new(0, 140, 0, 40)
redzButton.Text = "REDZ BLOX Fruit "
redzButton.TextColor3 = Color3.new(1, 1, 1)
redzButton.BackgroundColor3 = Color3.new(0.7, 0, 0) -- لون أحمر
redzButton.Parent = scrollFrame

-- جعل زر REDZ BLOX بشكل Squircle (زوايا مستديرة)
local redzButtonCorner = Instance.new("UICorner")
redzButtonCorner.CornerRadius = UDim.new(0, 10)
redzButtonCorner.Parent = redzButton

-- وظيفة تشغيل سكربت REDZ BLOX عند النقر على الزر
redzButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
end)

-- إنشاء زر Jump
local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0, 140, 0, 40)
jumpButton.Text = "Auto Jump"
jumpButton.TextColor3 = Color3.new(1, 1, 1)
jumpButton.BackgroundColor3 = Color3.new(0, 0, 0.7) -- لون أزرق
jumpButton.Parent = scrollFrame

-- جعل زر Jump بشكل Squircle (زوايا مستديرة)
local jumpButtonCorner = Instance.new("UICorner")
jumpButtonCorner.CornerRadius = UDim.new(0, 10)
jumpButtonCorner.Parent = jumpButton

-- وظيفة تشغيل سكربت Jump عند النقر على الزر
jumpButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-jump-30457"))()
end)

-- إنشاء زر Muscle Legend
local muscleButton = Instance.new("TextButton")
muscleButton.Size = UDim2.new(0, 140, 0, 40)
muscleButton.Text = "map Muscle Legend 💪🏻"
muscleButton.TextColor3 = Color3.new(1, 1, 1)
muscleButton.BackgroundColor3 = Color3.new(1, 0.3, 0) -- لون برتقالي
muscleButton.Parent = scrollFrame

-- جعل زر Muscle Legend بشكل Squircle (زوايا مستديرة)
local muscleButtonCorner = Instance.new("UICorner")
muscleButtonCorner.CornerRadius = UDim.new(0, 10)
muscleButtonCorner.Parent = muscleButton

-- وظيفة تشغيل سكربت Muscle Legend عند النقر على الزر
muscleButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Speed-Hub-X-29365"))()
end)

-- إنشاء زر Battle Ground
local battleButton = Instance.new("TextButton")
battleButton.Size = UDim2.new(0, 140, 0, 40)
battleButton.Text = "map Strongth Battle Ground KJ"
battleButton.TextColor3 = Color3.new(1, 1, 1)
battleButton.BackgroundColor3 = Color3.new(0.3, 0.4, 0.2) -- لون بني
battleButton.Parent = scrollFrame

-- جعل زر Battle Ground بشكل Squircle (زوايا مستديرة)
local battleButtonCorner = Instance.new("UICorner")
battleButtonCorner.CornerRadius = UDim.new(0, 10)
battleButtonCorner.Parent = battleButton

-- وظيفة تشغيل سكربت Battle Ground عند النقر على الزر
battleButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-KJ-Moveset-By-Tombul-Oranda-so-its-me-30853"))()
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "map Legend of Speed"
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0.4, 0.8, 1) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيل سكربت Legend of Speed عند النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bonk-Hub-Cracked-29165"))()
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "سكربت عربي AMOLUFF"
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0, 0, 0) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيamo luff  النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/amoluff/Amoluffy/refs/heads/main/Amoluff.Lua"))();
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "map brookhaven"
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0.4, 0.8, 1) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيamo luff  النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/sXPiterXs1111/SanderXV2.5/main/SanderXV2.5.lua')))()
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "Aimbot all maps "
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0, 0, 0) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيamo luff  النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubGunfightArena"))()
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "legend of speed 2"
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0, 0, 0) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيamo luff  النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
end)
-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "3 legend of speed  "
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0, 0.6, 0) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيamo luff  النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
end) Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- زر الدائرة الخضراء
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 60, 0, 60)
openButton.Position = UDim2.new(0.9, 0, 0.5, 0)
openButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- اللون الأبيض
openButton.Text = "AMOLUFF"
openButton.Parent = screenGui

-- إضافة حواف دائرية
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.5, 0) -- حواف دائرية
buttonCorner.Parent = openButton

-- تدرج اللون
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), -- الأسود
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), -- الأبيض
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) -- الأسود
}
gradient.Rotation = 45 -- تدوير التدرج
gradient.Parent = openButton

-- وظيفة لتغيير تدرج اللون بشكل متكرر
local colorOffset = 0
RunService.RenderStepped:Connect(function(deltaTime)
    colorOffset = (colorOffset + deltaTime * 0.5) % 1 -- سرعة التدرج
    gradient.Offset = Vector2.new(-colorOffset, -colorOffset) -- تطبيق الإزاحة على التدرج
end)

-- جعل الزر قابلاً للسحب
local dragging = false
local dragStart = nil
local startPos = nil

openButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = openButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

openButton.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        openButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- القائمة الرئيسية
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 280, 0, 350) -- حجم القائمة
menuFrame.Position = UDim2.new(0.5, -125, 0.5, -175) -- موقع القائمة
menuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60) -- لون الخلفية
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- جعل القائمة الرئيسية قابلة للسحب
local menuDragging = false
local menuDragStart = nil
local menuStartPos = nil

menuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        menuDragging = true
        menuDragStart = input.Position
        menuStartPos = menuFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                menuDragging = false
            end
        end)
    end
end)

menuFrame.InputChanged:Connect(function(input)
    if menuDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - menuDragStart
        menuFrame.Position = UDim2.new(menuStartPos.X.Scale, menuStartPos.X.Offset + delta.X, menuStartPos.Y.Scale, menuStartPos.Y.Offset + delta.Y)
    end
end)

-- زر الإغلاق (Back)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 30)
closeButton.Position = UDim2.new(1, -60, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(250, 0, 0)
closeButton.Text = "X"
closeButton.Parent = menuFrame

-- زر السكربتات
local scriptsButton = Instance.new("TextButton")
scriptsButton.Size = UDim2.new(0, 100, 0, 30)
scriptsButton.Position = UDim2.new(1, -170, 0, 10)
scriptsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
scriptsButton.Text = "Script 📜"
scriptsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsButton.Parent = menuFrame

-- زر الدعم الفني
local supportButton = Instance.new("TextButton")
supportButton.Size = UDim2.new(0, 100, 0, 30)
supportButton.Position = UDim2.new(1, -280, 0, 10) -- بجانب زر السكربتات
supportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
supportButton.Text = "support 🎟"
supportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
supportButton.Parent = menuFrame

-- قائمة الدعم الفني
local supportFrame = Instance.new("Frame")
supportFrame.Size = UDim2.new(0, 250, 0, 150)
supportFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
supportFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
supportFrame.Visible = false
supportFrame.Parent = screenGui

-- نص "الدعم الفني هنا"
local supportText = Instance.new("TextLabel")
supportText.Size = UDim2.new(1, 0, 0, 25)
supportText.Position = UDim2.new(0, 0, 0, 10)
supportText.BackgroundTransparency = 1
supportText.Text = "Support 👨🏻‍🔧"
supportText.TextColor3 = Color3.fromRGB(255, 255, 255)
supportText.TextScaled = true
supportText.Parent = supportFrame

-- رابط الدعم الفني
local supportLink = Instance.new("TextLabel")
supportLink.Size = UDim2.new(1, 0, 0, 50)
supportLink.Position = UDim2.new(0, 0, 0, 50)
supportLink.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
supportLink.Text = "https://discord.com/invite/nEaUHGkpX2"
supportLink.TextColor3 = Color3.fromRGB(255, 255, 255)
supportLink.TextScaled = true
supportLink.Parent = supportFrame

-- زر نسخ الرابط
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 100, 0, 30)
copyButton.Position = UDim2.new(0.5, -50, 1, -40)
copyButton.BackgroundColor3 = Color3.fromRGB(0 ,0 ,200)
copyButton.Text = "COPY LINK "
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Parent = supportFrame

-- زر Back في قائمة الدعم الفني
local supportBackButton = Instance.new("TextButton")
supportBackButton.Size = UDim2.new(0, 50, 0, 30)
supportBackButton.Position = UDim2.new(1, -50, 0, 10)
supportBackButton.BackgroundColor3 = Color3.fromRGB(240, 0, 0)
supportBackButton.Text = "X"
supportBackButton.Parent = supportFrame

-- قائمة أسماء اللاعبين
local playerList = Instance.new("ScrollingFrame")
playerList.Size = UDim2.new(1, 0, 1, -40) -- تأكد من أن القائمة تأخذ المساحة المتبقية
playerList.Position = UDim2.new(0, 0, 0, 40)
playerList.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
playerList.Parent = menuFrame

local playerListLayout = Instance.new("UIListLayout")
playerListLayout.Padding = UDim.new(0, 10) -- المسافة بين الأزرار
playerListLayout.Parent = playerList

-- زر الرجوع (لإعادة الكاميرا إلى اللاعب الأصلي)
local returnButton = Instance.new("TextButton")
returnButton.Size = UDim2.new(0, 120, 0, 40) -- حجم أكبر
returnButton.Position = UDim2.new(0.5, -60, 1, -50) -- موقع جديد
returnButton.BackgroundColor3 = Color3.fromRGB(240, 0, 0) -- لون أحمر
returnButton.Text = "Back" -- نص الزر
returnButton.TextScaled = true -- تكبير النص
returnButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- لون النص أبيض
returnButton.Visible = false -- غير مرئي في البداية
returnButton.Parent = screenGui

-- حواف حادة لزر الرجوع
local returnButtonCorner = Instance.new("UICorner")
returnButtonCorner.CornerRadius = UDim.new(0, 0) -- حواف حادة
returnButtonCorner.Parent = returnButton

-- حفظ الكاميرا الأصلية
local originalCamera = workspace.CurrentCamera.CFrame
local currentView = 1 -- 1: المنظور الأصلي، 2: المنظور الثاني
local cameraConnection = nil -- لتتبع اتصال الكاميرا
local zoomLevel = 10 -- مستوى التكبير/التصغير الافتراضي

-- وظيفة نقل الكاميرا إلى لاعب معين
local function spyOnPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        currentView = 2 -- الانتقال إلى المنظور الثاني
        returnButton.Visible = true -- إظهار زر الرجوع

        -- إيقاف الاتصال السابق إذا كان موجودًا
        if cameraConnection then
            cameraConnection:Disconnect()
        end

        -- جعل الكاميرا تتبع اللاعب
        cameraConnection = RunService.RenderStepped:Connect(function()
            if currentView == 2 and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local offset = Vector3.new(0, 5, -zoomLevel)
                workspace.CurrentCamera.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset, targetPlayer.Character.HumanoidRootPart.Position)
            end
        end)
    end
end

-- وظيفة إعادة الكاميرا إلى اللاعب الأصلي
local function returnToOriginalCamera()
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    currentView = 1 -- العودة إلى المنظور الأصلي
    returnButton.Visible = false -- إخفاء زر الرجوع

    -- إيقاف اتصال الكاميرا
    if cameraConnection then
        cameraConnection:Disconnect()
        cameraConnection = nil
    end
end

-- التحكم في التكبير/التصغير
UserInputService.InputChanged:Connect(function(input)
    if currentView == 2 and input.UserInputType == Enum.UserInputType.MouseWheel then
        zoomLevel = math.clamp(zoomLevel - input.Position.Z, 5, 20) -- الحد الأدنى 5 والحد الأقصى 20
    end
end)

-- تحديث قائمة اللاعبين
local function updatePlayerList()
    for _, child in ipairs(playerList:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for _, p in ipairs(Players:GetPlayers()) do
        local playerFrame = Instance.new("Frame")
        playerFrame.Size = UDim2.new(1, 0, 0, 30)
        playerFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        playerFrame.Parent = playerList

        local playerLabel = Instance.new("TextLabel")
        playerLabel.Size = UDim2.new(0.7, 0, 1, 0)
        playerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        playerLabel.Text = p.Name
        playerLabel.Parent = playerFrame

        local spyButton = Instance.new("TextButton")
        spyButton.Size = UDim2.new(0.3, 0.2, 1, 0.5)
        spyButton.Position = UDim2.new(0.7, 0, 0, 0)
        spyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        spyButton.Text = "👁"
        spyButton.Parent = playerFrame

        -- حواف حادة لزر التجسس
        local spyButtonCorner = Instance.new("UICorner")
        spyButtonCorner.CornerRadius = UDim.new(0, 0) -- حواف حادة
        spyButtonCorner.Parent = spyButton

        -- عند النقر على زر التجسس
        spyButton.MouseButton1Click:Connect(function()
            spyOnPlayer(p)
        end)
    end
end

-- التحكم في الظهور والإخفاء
openButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    updatePlayerList() -- تحديث قائمة اللاعبين عند فتح القائمة
end)

closeButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
end)

-- زر السكربتات
scriptsButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/amoluff/Amoluffy/refs/heads/main/Allscript.Lua"))()
end)

-- زر الدعم الفني
supportButton.MouseButton1Click:Connect(function()
    supportFrame.Visible = true
end)

-- زر نسخ الرابط
copyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/nEaUHGkpX2")
end)

-- زر Back في قائمة الدعم الفني
supportBackButton.MouseButton1Click:Connect(function()
    supportFrame.Visible = false
end)

-- زر الرجوع
returnButton.MouseButton1Click:Connect(function()
    returnToOriginalCamera()
end)

-- تحديث قائمة اللاعبين عند انضمام أو مغادرة لاعب
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
