-- إنشاء واجهة المستخدم
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- إنشاء الإطار الرئيسي
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 210, 0, 270)
frame.Position = UDim2.new(0.7, -160, 0.9, -135)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

-- جعل الإطار بشكل Squircle
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

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 15)
buttonCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- إنشاء ScrollingFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -80) -- زيادة المساحة السفلية
scrollFrame.Position = UDim2.new(0, 5, 0, 40)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame

-- إنشاء قائمة داخل ScrollingFrame
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10) -- زيادة المسافة بين الأزرار
listLayout.Parent = scrollFrame

-- تحديث حجم ScrollingFrame تلقائيًا بناءً على محتواه
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20) -- إضافة مسافة إضافية
end)

-- إنشاء زر Fly
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 140, 0, 40)
flyButton.Text = "Fly"
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.BackgroundColor3 = Color3.new(1, 0.5, 0)
flyButton.Parent = scrollFrame

local flyButtonCorner = Instance.new("UICorner")
flyButtonCorner.CornerRadius = UDim.new(0, 10)
flyButtonCorner.Parent = flyButton

flyButton.MouseButton1Click:Connect(function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

-- زر Script Blox
local scriptBloxButton = Instance.new("TextButton")
scriptBloxButton.Size = UDim2.new(0, 140, 0, 40)
scriptBloxButton.Text = "👇🏼 SCRIPT BLOX 👇🏼"
scriptBloxButton.TextColor3 = Color3.new(1, 1, 1)
scriptBloxButton.BackgroundColor3 = Color3.new(0, 0, 0)
scriptBloxButton.Parent = scrollFrame

local scriptBloxCorner = Instance.new("UICorner")
scriptBloxCorner.CornerRadius = UDim.new(0, 10)
scriptBloxCorner.Parent = scriptBloxButton

-- زر REDZ BLOX
local redzButton = Instance.new("TextButton")
redzButton.Size = UDim2.new(0, 140, 0, 40)
redzButton.Text = "REDZ BLOX Fruit "
redzButton.TextColor3 = Color3.new(1, 1, 1)
redzButton.BackgroundColor3 = Color3.new(0.7, 0, 0)
redzButton.Parent = scrollFrame

local redzButtonCorner = Instance.new("UICorner")
redzButtonCorner.CornerRadius = UDim.new(0, 10)
redzButtonCorner.Parent = redzButton

redzButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
end)

-- زر Legend of Speed Header
local legendHeader = Instance.new("TextButton")
legendHeader.Size = UDim2.new(0, 140, 0, 40)
legendHeader.Text = "👇🏼 legend of speed 👇🏼"
legendHeader.TextColor3 = Color3.new(1, 1, 1)
legendHeader.BackgroundColor3 = Color3.new(0, 0, 0)
legendHeader.Parent = scrollFrame

local legendHeaderCorner = Instance.new("UICorner")
legendHeaderCorner.CornerRadius = UDim.new(0, 10)
legendHeaderCorner.Parent = legendHeader

-- زر Legend 1
local legendButton1 = Instance.new("TextButton")
legendButton1.Size = UDim2.new(0, 140, 0, 40)
legendButton1.Text = "Legend of Speed 1"
legendButton1.TextColor3 = Color3.new(0, 0, 0) -- لون النص أسود
legendButton1.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
legendButton1.Parent = scrollFrame

local legendButton1Corner = Instance.new("UICorner")
legendButton1Corner.CornerRadius = UDim.new(0, 10)
legendButton1Corner.Parent = legendButton1

legendButton1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bonk-Hub-Cracked-29165"))()
end)

-- زر Legend 2
local legendButton2 = Instance.new("TextButton")
legendButton2.Size = UDim2.new(0, 140, 0, 40)
legendButton2.Text = "legend of speed 2"
legendButton2.TextColor3 = Color3.new(0, 0, 0) -- لون النص أسود
legendButton2.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
legendButton2.Parent = scrollFrame

local legendButton2Corner = Instance.new("UICorner")
legendButton2Corner.CornerRadius = UDim.new(0, 10)
legendButton2Corner.Parent = legendButton2

legendButton2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
end)

-- زر Legend 3
local legendButton3 = Instance.new("TextButton")
legendButton3.Size = UDim2.new(0, 140, 0, 40)
legendButton3.Text = "3 legend of speed  "
legendButton3.TextColor3 = Color3.new(0, 0, 0) -- لون النص أسود
legendButton3.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
legendButton3.Parent = scrollFrame

local legendButton3Corner = Instance.new("UICorner")
legendButton3Corner.CornerRadius = UDim.new(0, 10)
legendButton3Corner.Parent = legendButton3

legendButton3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
end)

-- زر Random Script Header مع تأثير RGB
local randomScriptHeader = Instance.new("TextButton")
randomScriptHeader.Size = UDim2.new(0, 140, 0, 40)
randomScriptHeader.Text = "👇🏼 random script 👇🏼"
randomScriptHeader.TextColor3 = Color3.new(1, 1, 1)
randomScriptHeader.BackgroundColor3 = Color3.new(0, 0, 0)
randomScriptHeader.Parent = scrollFrame

local randomScriptCorner = Instance.new("UICorner")
randomScriptCorner.CornerRadius = UDim.new(0, 10)
randomScriptCorner.Parent = randomScriptHeader

-- دالة تغيير الألوان لـ RGB
local function RGBEffect(button)
    local time = 0
    while button.Parent do
        time = time + 0.1
        local r = math.sin(time * 2) * 0.5 + 0.5
        local g = math.sin(time * 2 + 2) * 0.5 + 0.5
        local b = math.sin(time * 2 + 4) * 0.5 + 0.5
        button.BackgroundColor3 = Color3.new(r, g, b)
        wait(0.1)
    end
end

-- تطبيق تأثير RGB على الزر
spawn(function()
    RGBEffect(randomScriptHeader)
end)

-- زر Amoluff Script
local amoluffButton = Instance.new("TextButton")
amoluffButton.Size = UDim2.new(0, 140, 0, 40)
amoluffButton.Text = "سكربت عربي AMOLUFF"
amoluffButton.TextColor3 = Color3.new(1, 1, 1)
amoluffButton.BackgroundColor3 = Color3.new(0, 0, 0)
amoluffButton.Parent = scrollFrame

local amoluffButtonCorner = Instance.new("UICorner")
amoluffButtonCorner.CornerRadius = UDim.new(0, 10)
amoluffButtonCorner.Parent = amoluffButton

amoluffButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/amoluff/Amoluffy/refs/heads/main/Amoluff.Lua"))()
end)

-- زر Map Brookhaven
local brookhavenButton = Instance.new("TextButton")
brookhavenButton.Size = UDim2.new(0, 140, 0, 40)
brookhavenButton.Text = "map brookhaven"
brookhavenButton.TextColor3 = Color3.new(1, 1, 1)
brookhavenButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
brookhavenButton.Parent = scrollFrame

local brookhavenButtonCorner = Instance.new("UICorner")
brookhavenButtonCorner.CornerRadius = UDim.new(0, 10)
brookhavenButtonCorner.Parent = brookhavenButton

brookhavenButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/sXPiterXs1111/SanderXV2.5/main/SanderXV2.5.lua')))()
end)

-- زر Aimbot
local aimbotButton = Instance.new("TextButton")
aimbotButton.Size = UDim2.new(0, 140, 0, 40)
aimbotButton.Text = "Aimbot all maps "
aimbotButton.TextColor3 = Color3.new(1, 1, 1)
aimbotButton.BackgroundColor3 = Color3.new(0, 0, 0)
aimbotButton.Parent = scrollFrame

local aimbotButtonCorner = Instance.new("UICorner")
aimbotButtonCorner.CornerRadius = UDim.new(0, 10)
aimbotButtonCorner.Parent = aimbotButton

aimbotButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubGunfightArena"))()
end)

-- زر Auto Jump
local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0, 140, 0, 40)
jumpButton.Text = "Auto Jump"
jumpButton.TextColor3 = Color3.new(1, 1, 1)
jumpButton.BackgroundColor3 = Color3.new(0, 0, 0)
jumpButton.Parent = scrollFrame

local jumpButtonCorner = Instance.new("UICorner")
jumpButtonCorner.CornerRadius = UDim.new(0, 10)
jumpButtonCorner.Parent = jumpButton

jumpButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-jump-30457"))()
end)

-- زر Muscle Legend
local muscleButton = Instance.new("TextButton")
muscleButton.Size = UDim2.new(0, 140, 0, 40)
muscleButton.Text = "map Muscle Legend 💪🏻"
muscleButton.TextColor3 = Color3.new(1, 1, 1)
muscleButton.BackgroundColor3 = Color3.new(0, 0, 0)
muscleButton.Parent = scrollFrame

local muscleButtonCorner = Instance.new("UICorner")
muscleButtonCorner.CornerRadius = UDim.new(0, 10)
muscleButtonCorner.Parent = muscleButton

muscleButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Speed-Hub-X-29365"))()
end)

-- زر Battle Ground
local battleButton = Instance.new("TextButton")
battleButton.Size = UDim2.new(0, 140, 0, 40)
battleButton.Text = "map Strongth Battle Ground KJ"
battleButton.TextColor3 = Color3.new(1, 1, 1)
battleButton.BackgroundColor3 = Color3.new(0, 0, 0)
battleButton.Parent = scrollFrame

local battleButtonCorner = Instance.new("UICorner")
battleButtonCorner.CornerRadius = UDim.new(0, 10)
battleButtonCorner.Parent = battleButton

battleButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-KJ-Moveset-By-Tombul-Oranda-so-its-me-30853"))()
end)

-- إنشاء زر Legend of Speed
local legendButton = Instance.new("TextButton")
legendButton.Size = UDim2.new(0, 140, 0, 40)
legendButton.Text = "ADMIN SCRIPT 📜"
legendButton.TextColor3 = Color3.new(1, 1, 1)
legendButton.BackgroundColor3 = Color3.new(0, 0, 0) -- لون أزرق فاتح
legendButton.Parent = scrollFrame

-- جعل زر Legend of Speed بشكل Squircle (زوايا مستديرة)
local legendButtonCorner = Instance.new("UICorner")
legendButtonCorner.CornerRadius = UDim.new(0, 10)
legendButtonCorner.Parent = legendButton

-- وظيفة تشغيل النقر على الزر
legendButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))();
end)
