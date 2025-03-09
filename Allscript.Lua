-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء الإطار الرئيسي
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 220) -- حجم الإطار الرئيسي
frame.Position = UDim2.new(0.5, -160, 0.5, -110)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
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
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
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
redzButton.Text = "REDZ BLOX"
redzButton.TextColor3 = Color3.new(1, 1, 1)
redzButton.BackgroundColor3 = Color3.new(1, 0, 0) -- لون أحمر
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
jumpButton.Text = "Jump"
jumpButton.TextColor3 = Color3.new(1, 1, 1)
jumpButton.BackgroundColor3 = Color3.new(0, 0, 1) -- لون أزرق
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
muscleButton.Text = "Muscle Legend"
muscleButton.TextColor3 = Color3.new(1, 1, 1)
muscleButton.BackgroundColor3 = Color3.new(1, 0.5, 0) -- لون برتقالي
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
battleButton.Text = "Battle Ground"
battleButton.TextColor3 = Color3.new(1, 1, 1)
battleButton.BackgroundColor3 = Color3.new(0.6, 0.4, 0.2) -- لون بني
battleButton.Parent = scrollFrame

-- جعل زر Battle Ground بشكل Squircle (زوايا مستديرة)
local battleButtonCorner = Instance.new("UICorner")
battleButtonCorner.CornerRadius = UDim.new(0, 10)
battleButtonCorner.Parent = battleButton

-- وظيفة تشغيل سكربت Battle Ground عند النقر على الزر
battleButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-KJ-Moveset-By-Tombul-Oranda-so-its-me-30853"))()
end)
