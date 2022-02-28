--[[
  "cracked" 2/28/2022 by Introvert#1337
  i ended up just getting the source, however, the script can be cracked easily

  to bypass initial key gui:
    easy way: run script loaded when its passed 
    cool way: the 2nd constant of the MouseButton1Down connection callback of the submit button has the valid key, which you can just use

  to bypass hwid check:
    the server response is just hash(key), the key is just "key_synapse", hash function": https://pastebin.com/raw/2ryfX0Hv
]]


--This script reveals ALL hidden messages in the default chat
--chat "/spy" to toggle!
enabled = true
--if true will check your messages too
spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = true
--customize private logs
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--chat
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
--lock	    
getgenv().AimPart = "HumanoidRootPart" -- For R15 Games: {UpperTorso, LowerTorso, HumanoidRootPart, Head} | For R6 Games: {Head, Torso, HumanoidRootPart}
getgenv().AimlockToggleKey = "Y" -- Toggles Aimbot On/Off 
getgenv().AimRadius = 50 -- How far away from someones character you want to lock on at
getgenv().ThirdPerson = false -- Locking onto someone in your Third Person POV
getgenv().FirstPerson = true -- Locking onto someone in your First Person POV
getgenv().TeamCheck = false -- Check if Target is on your Team (True means it wont lock onto your teamates, false is vice versa) (Set it to false if there are no teams)
getgenv().PredictMovement = true -- Predicts if they are moving in fast velocity (like jumping) so the aimbot will go a bit faster to match their speed 
getgenv().PredictionVelocity = 15 -- The speed of the PredictMovement feature 

loadstring(game:HttpGet("https://pastebin.com/raw/WTddwn24", true))()

print("Created By Venomous - Criminality Booster V2")

local ScreenGUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Tittle = Instance.new("ImageLabel")
local ImageLabel = Instance.new("ImageLabel")
local RainbowLine = Instance.new("TextLabel")
local RainbowLine2 = Instance.new("TextLabel")
local InfstamButton = Instance.new("TextButton")
local InfiniteStamina = Instance.new("TextLabel")
local scrapespButton = Instance.new("TextButton")
local ScrapESP = Instance.new("TextLabel")
local SafeESPButton = Instance.new("TextButton")
local SafeESP = Instance.new("TextLabel")
local HBEButton = Instance.new("TextButton")
local HBE = Instance.new("TextLabel")
local ChatLogButton = Instance.new("TextButton")
local Chatlogs = Instance.new("TextLabel")
local fastpickupButton = Instance.new("TextButton")
local FastPickup = Instance.new("TextLabel")
local FallDamage = Instance.new("TextButton")
local Optimize = Instance.new("TextLabel")
local jap = Instance.new("TextLabel")
local Controls = Instance.new("TextLabel")
local AimbotToggle = Instance.new("TextLabel")
local ZGUIToggle = Instance.new("TextLabel")
local THBEToggle = Instance.new("TextLabel")
local Verison = Instance.new("TextLabel")
local MessageDaily = Instance.new("TextLabel")
local ESPButton = Instance.new("TextButton")
local ESP = Instance.new("TextLabel")

--Properties:

ScreenGUI.Name = "Screen GUI"
syn.protect_gui(ScreenGUI)
ScreenGUI.Parent = game.CoreGui

Frame.Parent = ScreenGUI
Frame.BackgroundColor3 = Color3.fromRGB(0, 32, 61)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.674479187, 0, 0.332515329, 0)
Frame.Size = UDim2.new(0, 511, 0, 294)

Tittle.Name = "Tittle"
Tittle.Parent = Frame
Tittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tittle.BackgroundTransparency = 1.000
Tittle.BorderColor3 = Color3.fromRGB(27, 42, 53)
Tittle.Position = UDim2.new(0.017857179, 0, 0.0292746611, 0)
Tittle.Size = UDim2.new(0, 271, 0, 25)
Tittle.Image = "http://www.roblox.com/asset/?id=7717197829"

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.581299126, 0, 0.0174462982, 0)
ImageLabel.Size = UDim2.new(0, 31, 0, 31)
ImageLabel.Image = "http://www.roblox.com/asset/?id=7719991803"

RainbowLine.Name = "Rainbow Line"
RainbowLine.Parent = Frame
RainbowLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowLine.BackgroundTransparency = 1.000
RainbowLine.Position = UDim2.new(0.142727882, 0, 0.0533707812, 0)
RainbowLine.Size = UDim2.new(0, 367, 0, 50)
RainbowLine.Font = Enum.Font.SourceSans
RainbowLine.Text = "â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”"
RainbowLine.TextColor3 = Color3.fromRGB(244, 244, 244)
RainbowLine.TextSize = 14.000

RainbowLine2.Name = "Rainbow Line2"
RainbowLine2.Parent = Frame
RainbowLine2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowLine2.BackgroundTransparency = 1.000
RainbowLine2.Position = UDim2.new(0.128921181, 0, 0.789172947, 0)
RainbowLine2.Size = UDim2.new(0, 379, 0, 61)
RainbowLine2.Font = Enum.Font.SourceSans
RainbowLine2.Text = "â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”"
RainbowLine2.TextColor3 = Color3.fromRGB(247, 247, 247)
RainbowLine2.TextSize = 14.000

InfstamButton.Name = "Inf stam Button"
InfstamButton.Parent = Frame
InfstamButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
InfstamButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfstamButton.BorderSizePixel = 2
InfstamButton.Position = UDim2.new(0.0315581858, 0, 0.390449405, 0)
InfstamButton.Size = UDim2.new(0, 24, 0, 23)
InfstamButton.Font = Enum.Font.SourceSans
InfstamButton.Text = ""
InfstamButton.TextColor3 = Color3.fromRGB(0, 0, 0)
InfstamButton.TextSize = 14.000

InfiniteStamina.Name = "Infinite Stamina"
InfiniteStamina.Parent = InfstamButton
InfiniteStamina.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfiniteStamina.BackgroundTransparency = 1.000
InfiniteStamina.Position = UDim2.new(1.24999988, 0, 0.0434783101, 0)
InfiniteStamina.Size = UDim2.new(0, 101, 0, 20)
InfiniteStamina.Font = Enum.Font.SourceSans
InfiniteStamina.Text = "Infinite Stamina"
InfiniteStamina.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteStamina.TextSize = 16.000
InfiniteStamina.TextStrokeTransparency = 0.000
InfiniteStamina.TextWrapped = true

scrapespButton.Name = "scrap esp Button"
scrapespButton.Parent = Frame
scrapespButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
scrapespButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
scrapespButton.BorderSizePixel = 2
scrapespButton.Position = UDim2.new(0.0315581858, 0, 0.525280893, 0)
scrapespButton.Size = UDim2.new(0, 24, 0, 23)
scrapespButton.Font = Enum.Font.SourceSans
scrapespButton.Text = ""
scrapespButton.TextColor3 = Color3.fromRGB(0, 0, 0)
scrapespButton.TextSize = 14.000

ScrapESP.Name = "Scrap ESP"
ScrapESP.Parent = scrapespButton
ScrapESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrapESP.BackgroundTransparency = 1.000
ScrapESP.Position = UDim2.new(0.624999881, 0, 0.0434783101, 0)
ScrapESP.Size = UDim2.new(0, 101, 0, 20)
ScrapESP.Font = Enum.Font.SourceSans
ScrapESP.Text = "Scrap ESP"
ScrapESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ScrapESP.TextSize = 16.000
ScrapESP.TextStrokeTransparency = 0.000
ScrapESP.TextWrapped = true

SafeESPButton.Name = "Safe ESP Button"
SafeESPButton.Parent = Frame
SafeESPButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
SafeESPButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SafeESPButton.BorderSizePixel = 2
SafeESPButton.Position = UDim2.new(0.0315581858, 0, 0.668539286, 0)
SafeESPButton.Size = UDim2.new(0, 24, 0, 23)
SafeESPButton.Font = Enum.Font.SourceSans
SafeESPButton.Text = ""
SafeESPButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SafeESPButton.TextSize = 14.000

SafeESP.Name = "Safe ESP"
SafeESP.Parent = SafeESPButton
SafeESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SafeESP.BackgroundTransparency = 1.000
SafeESP.Position = UDim2.new(0.291666657, 0, 0.130434781, 0)
SafeESP.Size = UDim2.new(0, 109, 0, 20)
SafeESP.Font = Enum.Font.SourceSans
SafeESP.Text = "Safe ESP"
SafeESP.TextColor3 = Color3.fromRGB(255, 255, 255)
SafeESP.TextSize = 16.000
SafeESP.TextStrokeTransparency = 0.000
SafeESP.TextWrapped = true

HBEButton.Name = "HBE Button"
HBEButton.Parent = Frame
HBEButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
HBEButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HBEButton.BorderSizePixel = 2
HBEButton.Position = UDim2.new(0.406311631, 0, 0.244381994, 0)
HBEButton.Size = UDim2.new(0, 24, 0, 23)
HBEButton.Font = Enum.Font.SourceSans
HBEButton.Text = ""
HBEButton.TextColor3 = Color3.fromRGB(0, 0, 0)
HBEButton.TextSize = 14.000

HBE.Name = "HBE"
HBE.Parent = HBEButton
HBE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HBE.BackgroundTransparency = 1.000
HBE.Position = UDim2.new(2.38418579e-07, 0, 4.76837158e-07, 0)
HBE.Size = UDim2.new(0, 109, 0, 20)
HBE.Font = Enum.Font.SourceSans
HBE.Text = "HBE"
HBE.TextColor3 = Color3.fromRGB(255, 255, 255)
HBE.TextSize = 16.000
HBE.TextStrokeTransparency = 0.000
HBE.TextWrapped = true

ChatLogButton.Name = "Chat Log Button"
ChatLogButton.Parent = Frame
ChatLogButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
ChatLogButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatLogButton.BorderSizePixel = 2
ChatLogButton.Position = UDim2.new(0.406311631, 0, 0.386455655, 0)
ChatLogButton.Size = UDim2.new(0, 24, 0, 23)
ChatLogButton.Font = Enum.Font.SourceSans
ChatLogButton.Text = ""
ChatLogButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ChatLogButton.TextSize = 14.000

Chatlogs.Name = "Chat logs"
Chatlogs.Parent = ChatLogButton
Chatlogs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chatlogs.BackgroundTransparency = 1.000
Chatlogs.Position = UDim2.new(0.500000358, 0, 0.0869570002, 0)
Chatlogs.Size = UDim2.new(0, 109, 0, 20)
Chatlogs.Font = Enum.Font.SourceSans
Chatlogs.Text = "FullBright"
Chatlogs.TextColor3 = Color3.fromRGB(255, 255, 255)
Chatlogs.TextSize = 16.000
Chatlogs.TextStrokeTransparency = 0.000
Chatlogs.TextWrapped = true

fastpickupButton.Name = "fast pickup Button"
fastpickupButton.Parent = Frame
fastpickupButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
fastpickupButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
fastpickupButton.BorderSizePixel = 2
fastpickupButton.Position = UDim2.new(0.406311601, 0, 0.528089881, 0)
fastpickupButton.Size = UDim2.new(0, 24, 0, 23)
fastpickupButton.Font = Enum.Font.SourceSans
fastpickupButton.Text = ""
fastpickupButton.TextColor3 = Color3.fromRGB(0, 0, 0)
fastpickupButton.TextSize = 14.000

FastPickup.Name = "Fast Pickup"
FastPickup.Parent = fastpickupButton
FastPickup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FastPickup.BackgroundTransparency = 1.000
FastPickup.Position = UDim2.new(0.500000298, 15, 0.0869570002, 0)
FastPickup.Size = UDim2.new(0, 109, 0, 20)
FastPickup.Font = Enum.Font.SourceSans
FastPickup.Text = "Instant Interact"
FastPickup.TextColor3 = Color3.fromRGB(255, 255, 255)
FastPickup.TextSize = 16.000
FastPickup.TextStrokeTransparency = 0.000
FastPickup.TextWrapped = true

FallDamage.Name = "Fall Damage"
FallDamage.Parent = Frame
FallDamage.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
FallDamage.BorderColor3 = Color3.fromRGB(0, 0, 0)
FallDamage.BorderSizePixel = 2
FallDamage.Position = UDim2.new(0.406311601, 0, 0.667545676, 0)
FallDamage.Size = UDim2.new(0, 24, 0, 23)
FallDamage.Font = Enum.Font.SourceSans
FallDamage.Text = ""
FallDamage.TextColor3 = Color3.fromRGB(0, 0, 0)
FallDamage.TextSize = 14.000

Optimize.Name = "Optimize"
Optimize.Parent = FallDamage
Optimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Optimize.BackgroundTransparency = 1.000
Optimize.Position = UDim2.new(0.25, 0, 0, 0)
Optimize.Size = UDim2.new(0, 150, 0, 20)
Optimize.Font = Enum.Font.SourceSans
Optimize.Text = "No Fall Damage"
Optimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Optimize.TextSize = 16.000
Optimize.TextStrokeTransparency = 0.000
Optimize.TextWrapped = true

jap.Name = "jap :("
jap.Parent = Frame
jap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jap.BackgroundTransparency = 1.000
jap.Position = UDim2.new(0.671232879, 0, 0.853741407, 0)
jap.Size = UDim2.new(0, 200, 0, 50)
jap.Font = Enum.Font.SourceSans
jap.Text = "Created By Venomous#5476"
jap.TextColor3 = Color3.fromRGB(255, 255, 255)
jap.TextSize = 14.000
jap.TextStrokeTransparency = 0.000

Controls.Name = "Controls"
Controls.Parent = Frame
Controls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Controls.BackgroundTransparency = 1.000
Controls.Position = UDim2.new(0.612524509, 0, 0.244897962, 0)
Controls.Size = UDim2.new(0, 200, 0, 50)
Controls.Font = Enum.Font.SourceSans
Controls.Text = "Keybinds:"
Controls.TextColor3 = Color3.fromRGB(255, 255, 255)
Controls.TextSize = 14.000
Controls.TextStrokeTransparency = 0.000

AimbotToggle.Name = "Aimbot Toggle"
AimbotToggle.Parent = Frame
AimbotToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.BackgroundTransparency = 1.000
AimbotToggle.Position = UDim2.new(0.612524509, 0, 0.31292516, 0)
AimbotToggle.Size = UDim2.new(0, 200, 0, 50)
AimbotToggle.Font = Enum.Font.SourceSans
AimbotToggle.Text = "\"Y\" To Toggle Torso Aimlock"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.TextSize = 14.000
AimbotToggle.TextStrokeTransparency = 0.000

ZGUIToggle.Name = "Z GUI Toggle"
ZGUIToggle.Parent = Frame
ZGUIToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ZGUIToggle.BackgroundTransparency = 1.000
ZGUIToggle.Position = UDim2.new(0.612524509, 0, 0.377551019, 0)
ZGUIToggle.Size = UDim2.new(0, 200, 0, 50)
ZGUIToggle.Font = Enum.Font.SourceSans
ZGUIToggle.Text = "\"Z\" To Toggle GUI"
ZGUIToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ZGUIToggle.TextSize = 14.000
ZGUIToggle.TextStrokeTransparency = 0.000

THBEToggle.Name = "Play Smart Don't Get Caught"
THBEToggle.Parent = Frame
THBEToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
THBEToggle.BackgroundTransparency = 1.000
THBEToggle.Position = UDim2.new(0.612524509, 0, 0.435374141, 0)
THBEToggle.Size = UDim2.new(0, 200, 0, 50)
THBEToggle.Font = Enum.Font.SourceSans
THBEToggle.Text = "Play Smartly Don't Get Caught"
THBEToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
THBEToggle.TextSize = 14.000
THBEToggle.TextStrokeTransparency = 0.000

Verison.Name = "Verison"
Verison.Parent = Frame
Verison.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Verison.BackgroundTransparency = 1.000
Verison.Position = UDim2.new(0.763209343, 0, 0.112244889, 0)
Verison.Size = UDim2.new(0, 200, 0, 50)
Verison.Font = Enum.Font.SciFi
Verison.Text = "V2"
Verison.TextColor3 = Color3.fromRGB(255, 255, 255)
Verison.TextSize = 14.000
Verison.TextStrokeTransparency = 0.000

MessageDaily.Name = "Message Daily"
MessageDaily.Parent = Frame
MessageDaily.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MessageDaily.BackgroundTransparency = 1.000
MessageDaily.Position = UDim2.new(-0.00782779604, 0, 0.853741407, 0)
MessageDaily.Size = UDim2.new(0, 200, 0, 50)
MessageDaily.Font = Enum.Font.SourceSans
MessageDaily.Text = "Whats Your Mom Doing?"
MessageDaily.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageDaily.TextSize = 14.000
MessageDaily.TextStrokeTransparency = 0.000

ESPButton.Name = "ESP Button"
ESPButton.Parent = Frame
ESPButton.BackgroundColor3 = Color3.fromRGB(255, 44, 16)
ESPButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPButton.BorderSizePixel = 2
ESPButton.Position = UDim2.new(0.0315581858, 0, 0.241573021, 0)
ESPButton.Size = UDim2.new(0, 24, 0, 23)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.Text = ""
ESPButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ESPButton.TextSize = 14.000

ESP.Name = "ESP"
ESP.Parent = ESPButton
ESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESP.BackgroundTransparency = 1.000
ESP.Position = UDim2.new(-1.1920929e-07, 0, 0.0434783101, 0)
ESP.Size = UDim2.new(0, 101, 0, 20)
ESP.Font = Enum.Font.SourceSans
ESP.Text = "ESP"
ESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ESP.TextSize = 16.000
ESP.TextStrokeTransparency = 0.000
ESP.TextWrapped = true

-- doing this so the code at the bottom doesnt look like shit
local NameResolve = {ESP = "ESP Button", InfStamina = "Inf stam Button", NoFall = "Fall Damage", FastPickup = "fast pickup Button",
                    FullBright = "Chat Log Button", ScrapESP = "scrap esp Button", HBE = "HBE Button", SafeESP = "Safe ESP Button"}
                
local settings = setmetatable({},{
    __index = function(tab, idx)
        assert(NameResolve[idx],"ayo invalid setting")
        return Frame[NameResolve[idx]].BackgroundColor3.G==1
    end
})

-- Scripts:

local function UWVJ_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	player = game.Players.LocalPlayer
	
	player:GetMouse().KeyDown:Connect(function(key)
		if key == "z" and script.Parent.Visible == false then
			script.Parent.Visible = true
		else
			if key == "z" and script.Parent.Visible == true then
				script.Parent.Visible = false
			end
		end
	end)
end

local InfStamina = settings.InfStamina -- my favorite game engine is roblox <3
coroutine.wrap(UWVJ_fake_script)()
local function QDERS_fake_script() -- InfstamButton.LocalScript 
	local script = Instance.new('LocalScript', InfstamButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	    
	    InfStamina = not InfStamina -- would you look at that, decent code
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
coroutine.wrap(QDERS_fake_script)()
local function LHTOEZM_fake_script() -- scrapespButton.LocalScript 
	local script = Instance.new('LocalScript', scrapespButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
coroutine.wrap(LHTOEZM_fake_script)()
local function PBIYWRC_fake_script() -- SafeESPButton.LocalScript 
	local script = Instance.new('LocalScript', SafeESPButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
coroutine.wrap(PBIYWRC_fake_script)()
local function OOORV_fake_script() -- HBEButton.LocalScript 
	local script = Instance.new('LocalScript', HBEButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end

local FullBright = false
coroutine.wrap(OOORV_fake_script)()
local function SHMK_fake_script() -- ChatLogButton.LocalScript 
	local script = Instance.new('LocalScript', ChatLogButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
		FullBright = not FullBright -- a decent toggle? what? just one line? is it really that simple? nooooooo, no way, thats bad coding
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
local InstantInteract = false
coroutine.wrap(SHMK_fake_script)()
local function SFXBQG_fake_script() -- fastpickupButton.LocalScript 
	local script = Instance.new('LocalScript', fastpickupButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	    InstantInteract = not InstantInteract
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end

local NoFall = settings.NoFall -- seriously, fuck you roblox engine
coroutine.wrap(SFXBQG_fake_script)()
local function JUBYCYM_fake_script() -- FallDamage.LocalScript 
	local script = Instance.new('LocalScript', FallDamage)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	    NoFall = not NoFall
	    
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
coroutine.wrap(JUBYCYM_fake_script)()
local function BYWTR_fake_script() -- ESPButton.LocalScript 
	local script = Instance.new('LocalScript', ESPButton)

	local toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		if toggle == false then 
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			--true here
		end
		if toggle == false then 
			--false here
		end
	end)
end
coroutine.wrap(BYWTR_fake_script)()


-- scripts here :)

_G.BPartSize = Vector3.new(4.5,4.5,4.5)

_G.FullBrightColor = Color3.new(1,1,1)

_G.scalingFactor = 3000

_G.LoopActive = true

local LPlayer = game:GetService("Players").LocalPlayer
local LocalMouse = LPlayer:GetMouse()

local UserInputService = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

local camera = workspace.CurrentCamera

repeat wait(0.001) until game:IsLoaded() and game.Players.LocalPlayer.Character -- waits until youve loaded in 

local rcFunction
while not rcFunction do
for i, v in next, getgc(true) do
    if(type(v)=="table" and type(rawget(v,"lol"))=="function" and getinfo(v.lol).source:find(".RCHB"))then
        rcFunction = v.lol
    end
end
wait(0.01)
end

local grcFunction
while not grcFunction do
for i, v in next, getgc(true) do
    if(type(v)=="table" and type(rawget(v,"ONRH_S4"))=="function")then
        grcFunction = v.ONRH_S4
    end
end
wait(0.01)
end

local numberT = 20
for i, v in next, getconstants(rcFunction) do
    if(v==1.75 or v == 10)then
        setconstant(rcFunction,i,numberT) 
    end
end

for i, v in next, getconstants(grcFunction) do
    if(v==1.5 or v == 10)then
        setconstant(grcFunction,i,numberT) 
    end
end

local DefHeadSize = game.Players.LocalPlayer.Character:WaitForChild("Head").Size

local Lighting = game.Lighting
local DefaultAmbient = Lighting.Ambient

local oldIndex
oldIndex = hookmetamethod(game,"__index",newcclosure(function(...) -- future proofing
    local tab, key = ...
    if(tab == nil or type(tab)~="userdata" or key == nil)then --incase we want to change the args in the future
        return oldIndex(...)
    end
    if(not checkcaller() and oldIndex(tab,"ClassName")=="Part" and key == "Size")then
        if(oldIndex(tab,"Name") == "Head")then
            return DefHeadSize
        end
    end
    return oldIndex(...)
end))

local oldNewIndex
oldNewIndex = hookmetamethod(game, "__newindex",newcclosure(function(...)
	if(not checkcaller())then
		local tab, key, value = ...
		if(tab==Lighting and key == "Ambient")then
			return oldNewIndex(tab,key,FullBright and _G.FullBrightColor or DefaultAmbient) -- because i remember the retard having that shit be put inside of a frame hook
		end
	end
	return oldNewIndex(...)
end))

local fMain
local fMainDo
for i, v in next, getgc() do
    if(type(v)=="function" and getinfo(v).source:find(".PlayerScripts.") )then
        if (getinfo(v).name=="Main") then
            fMain = v
        elseif(getinfo(v).name=="MainDo"and ({pcall(function() getproto(v,3) end)})[1])then -- for extra certainty, there is nothing like this for the other function because i cba and i spent alot of time reversing this function
            fMainDo = v
        end
        if(fMain and fMainDo)then
            break
        end
    end
end

if(fMainDo and fMain)then
    local oldMainDo
    oldMainDo = hookfunction(fMainDo, function(InputObject,...)
        if(InstantInteract)then
            local InteractTable = getupvalue(fMain,2) -- yes indeed, i couldve used the proto from MainDo but i forgor that you had to make the last arg true to get upvalues from it
            if(type(InteractTable)=="table" and type(InteractTable[InputObject.KeyCode])=="table")then
                InteractTable[InputObject.KeyCode][2] = 0
            end
        end
        return oldMainDo(InputObject,...)
    end)
else
    warn("Failed to get crucial functions for InstantInteract, therefore it won't work, please contact the retard that made this script")
end



-- niche utility functions
local function MatchBegin(inputString, matchString)
    return inputString:sub(1,#matchString)==matchString
end

-- retarded esp shit goes here because im not using my esp lib ;)

local function ApplySettings(obj, tab) -- so that one weird kid on discord can edit the visuals without bothering me (he'll still probably fuck it up)
    for i, v in next, tab do
        obj[i] = v
    end
end

local sizingFactor = 3.5
local PlayerESPBoxes = {
    Thickness = 1,
    Visible = false,
    Color = Color3.new(1,1,1),
    Filled = false
}

local PlayerESPNames = {
    Color = Color3.new(1,1,1),
	Outline = true,
	Font = 3,
    Size = 17,
    Center = false,
    Visible = false, -- these 2 don't matter, they get overwritten
    Position=Vector2.new()
    -- you can change fonts in here as well
}

local PlayerESPHealth = { -- (same shit as above)
    Color = Color3.new(1,1,1),
    Outline = true,
    Size = 20,
	Font = 3,
    Size = 17,
    Center = false,
    Visible = false, -- these 2 don't matter, they get overwritten
    Position=Vector2.new()
    -- you can change fonts in here as well
}

local PlayerESPTool = { -- (same shit as above)
    Color = Color3.new(218/255,165/255,32/255), -- fromRGB who?
    Outline = true,
    Size = 17,
    Center = false,
    Visible = false, -- these 2 don't matter, they get overwritten
    Position=Vector2.new()
    -- you can change fonts in here as well
}

local PlayerESP = {
    box = {
        [1] = Drawing.new("Square"),
        Created = 1,
        Active = 0
    },
    name = {
        [1] = Drawing.new("Text"),
        Created = 1,
        Active = 0
    },
    health = {
        [1] = Drawing.new("Text"),
        Created = 1,
        Active = 0
    },
    tool = {
        [1] = Drawing.new("Text"),
        Created = 1,
        Active = 0
    }
    
}

ApplySettings(PlayerESP.box[1],PlayerESPBoxes)
ApplySettings(PlayerESP.name[1],PlayerESPNames)
ApplySettings(PlayerESP.health[1],PlayerESPHealth)

local WorldESPScrap = {
    Color = Color3.new(1,1,1),
    Outline = true,
    Size = 15,
    Center = true,
    Visible = false,
    Text = "Scrap", -- you can safely change this if you want
    Position = Vector2.new()
    -- you can change fonts in here as well
}

local WorldESPSafe = {
    Color = Color3.new(1,1,1), -- this gets overwritten, incase something goes wrong atleast it'll have a decent default color
    Outline = true,
    Size = 15,
    Center = true,
    Visible = false,
    Position = Vector2.new()
    -- you can change fonts in here as well
}

local WorldESP = {
    Scrap = {
        [1] = Drawing.new("Text"),
        Created = 1,
        Active = 0
    },
    Safe = {
        [1] = Drawing.new("Text"),
        Created = 1,
        Active = 0
    }
}
ApplySettings(WorldESP.Scrap[1],WorldESPScrap)
ApplySettings(WorldESP.Safe[1],WorldESPSafe)

local GamePlayers = game:GetService("Players") -- the Players object can have its name changed, though ive personally never had issues accessing players via game.Players when the name has been changed, its safer this way (incase something in the roblox engine changes)
game:GetService("RunService").RenderStepped:Connect(function(frameDelta)
    PlayerESP.box.Active = 0 -- incase the retard asks to seperate the visuals into different settings 
    PlayerESP.name.Active = 0
    PlayerESP.health.Active = 0
    PlayerESP.tool.Active = 0
    WorldESP.Scrap.Active = 0
    WorldESP.Safe.Active = 0
    
    if (settings.ESP) then
        for i, v in next, GamePlayers:GetPlayers() do
            if v == LPlayer or not (v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and v.Character:FindFirstChildOfClass("Humanoid") and math.floor(v.Character:FindFirstChildOfClass("Humanoid").Health)>0)then
                continue
            end
			
            PlayerESP.box.Active = PlayerESP.box.Active + 1
            PlayerESP.name.Active = PlayerESP.name.Active + 1
            PlayerESP.health.Active = PlayerESP.health.Active + 1
            PlayerESP.tool.Active = PlayerESP.tool.Active + 1
            
            if (not PlayerESP.box[PlayerESP.box.Active])then
                PlayerESP.box[PlayerESP.box.Active] = Drawing.new("Square")
                ApplySettings(PlayerESP.box[PlayerESP.box.Active],PlayerESPBoxes)
                PlayerESP.box.Created = PlayerESP.box.Created + 1
            end
            if (not PlayerESP.name[PlayerESP.name.Active])then
                PlayerESP.name[PlayerESP.name.Active] = Drawing.new("Text")
                ApplySettings(PlayerESP.name[PlayerESP.name.Active],PlayerESPNames)
                PlayerESP.name.Created = PlayerESP.name.Created + 1
            end
            if (not PlayerESP.health[PlayerESP.health.Active])then
                PlayerESP.health[PlayerESP.health.Active] = Drawing.new("Text")
                ApplySettings(PlayerESP.health[PlayerESP.health.Active],PlayerESPHealth)
                PlayerESP.health.Created = PlayerESP.health.Created + 1
            end
            if (not PlayerESP.tool[PlayerESP.tool.Active])then
                PlayerESP.tool[PlayerESP.tool.Active] = Drawing.new("Text")
                ApplySettings(PlayerESP.tool[PlayerESP.tool.Active],PlayerESPTool)
                PlayerESP.tool.Created = PlayerESP.tool.Created + 1
            end
            
            local TopPoint = camera:WorldToViewportPoint(v.Character.Head.Position+Vector3.new(0,1,0))
            local BottomPoint = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position-Vector3.new(0,3,0))
            if(TopPoint.Z>0 and BottomPoint.Z>0)then
            
                local DeltaPosition = TopPoint-BottomPoint
                PlayerESP.box[PlayerESP.box.Active].Visible = true
                PlayerESP.box[PlayerESP.box.Active].Position = Vector2.new(TopPoint.X-(DeltaPosition.Y/sizingFactor),TopPoint.Y)
                PlayerESP.box[PlayerESP.box.Active].Size = Vector2.new((DeltaPosition.Y/sizingFactor)*2,-DeltaPosition.Y)
                
                local indent = math.ceil(PlayerESP.box[PlayerESP.box.Active].Thickness/2)+2 -- so thicknes can be safely edited
                
                PlayerESP.name[PlayerESP.name.Active].Visible = true
                PlayerESP.name[PlayerESP.name.Active].Text = v.Name
                PlayerESP.name[PlayerESP.name.Active].Position = Vector2.new(PlayerESP.box[PlayerESP.box.Active].Position.X+indent,PlayerESP.box[PlayerESP.box.Active].Position.Y - PlayerESP.name[PlayerESP.name.Active].TextBounds.Y*0.25)
                
                local healthRatio = v.Character:FindFirstChildOfClass("Humanoid").Health/v.Character:FindFirstChildOfClass("Humanoid").MaxHealth
                PlayerESP.health[PlayerESP.health.Active].Visible = true
                PlayerESP.health[PlayerESP.health.Active].Text = "Health: "..tostring(math.floor(v.Character:FindFirstChildOfClass("Humanoid").Health))
                PlayerESP.health[PlayerESP.health.Active].Color = Color3.new(1-healthRatio,healthRatio,0)
                PlayerESP.health[PlayerESP.health.Active].Position = Vector2.new(PlayerESP.box[PlayerESP.box.Active].Position.X+indent,PlayerESP.box[PlayerESP.box.Active].Position.Y+PlayerESP.name[PlayerESP.name.Active].TextBounds.Y*0.5+1 - PlayerESP.health[PlayerESP.health.Active].TextBounds.Y*0.25)
                
                if(v.Character:FindFirstChildOfClass("Tool"))then
                    PlayerESP.tool[PlayerESP.tool.Active].Visible = true
                    PlayerESP.tool[PlayerESP.tool.Active].Text = v.Character:FindFirstChildOfClass("Tool").Name
                    PlayerESP.tool[PlayerESP.tool.Active].Position = Vector2.new(PlayerESP.box[PlayerESP.box.Active].Position.X+indent,PlayerESP.health[PlayerESP.health.Active].Position.Y+PlayerESP.health[PlayerESP.health.Active].TextBounds.Y*0.75+1 - PlayerESP.tool[PlayerESP.tool.Active].TextBounds.Y*0.25)
                else
                    PlayerESP.tool[PlayerESP.tool.Active].Visible = false
                end
                
            else -- either this or doing the same thing below with an additional re-iteration of the table
                PlayerESP.box[PlayerESP.box.Active].Visible = false
                PlayerESP.name[PlayerESP.name.Active].Visible = false
                PlayerESP.health[PlayerESP.health.Active].Visible = false
                PlayerESP.tool[PlayerESP.tool.Active].Visible = false
           end
        end
    end
    if(PlayerESP.box.Created>PlayerESP.box.Active)then
        for i = 1 ,PlayerESP.box.Created-PlayerESP.box.Active,1 do
            PlayerESP.box[PlayerESP.box.Active+i].Visible = false
        end
    end
    if(PlayerESP.name.Created>PlayerESP.name.Active)then
        for i = 1 ,PlayerESP.name.Created-PlayerESP.name.Active,1 do
            PlayerESP.name[PlayerESP.name.Active+i].Visible = false
        end
    end
    if(PlayerESP.health.Created>PlayerESP.health.Active)then
        for i = 1 ,PlayerESP.health.Created-PlayerESP.health.Active,1 do
            PlayerESP.health[PlayerESP.health.Active+i].Visible = false
        end
    end
    if(PlayerESP.tool.Created>PlayerESP.tool.Active)then
        for i = 1 ,PlayerESP.tool.Created-PlayerESP.tool.Active,1 do
            PlayerESP.tool[PlayerESP.tool.Active+i].Visible = false
        end
    end
    if(settings.ScrapESP)then
        for i, v in next, workspace.Filter.SpawnedPiles:GetChildren() do
            WorldESP.Scrap.Active = WorldESP.Scrap.Active + 1
            if (not WorldESP.Scrap[WorldESP.Scrap.Active])then
                WorldESP.Scrap[WorldESP.Scrap.Active] = Drawing.new("Text")
                ApplySettings(WorldESP.Scrap[WorldESP.Scrap.Active],WorldESPScrap)
                WorldESP.Scrap.Created = WorldESP.Scrap.Created + 1
            end
            ScreenPoint = camera:WorldToViewportPoint(v.PrimaryPart.Position)
            if(ScreenPoint.Z>0)then
                WorldESP.Scrap[WorldESP.Scrap.Active].Visible = true
                WorldESP.Scrap[WorldESP.Scrap.Active].Position = Vector2.new(ScreenPoint.X,ScreenPoint.Y)
				WorldESP.Scrap[WorldESP.Scrap.Active].Color = v.PrimaryPart:FindFirstChildOfClass("ParticleEmitter").Color.Keypoints[1].Value
            else
                WorldESP.Scrap[WorldESP.Scrap.Active].Visible = false
            end
        end
    end
    if(WorldESP.Scrap.Created>WorldESP.Scrap.Active)then
        for i = 1 ,WorldESP.Scrap.Created-WorldESP.Scrap.Active,1 do
            WorldESP.Scrap[WorldESP.Scrap.Active+i].Visible = false
        end
    end
    
    if(settings.SafeESP)then
        for i, v in next, workspace.Map.BredMakurz:GetChildren() do
            if not(v:FindFirstChild("Values") and v.Values:FindFirstChild("Broken") and not v.Values.Broken.Value) then
                continue
            end
			
            WorldESP.Safe.Active = WorldESP.Safe.Active + 1
            if (not WorldESP.Safe[WorldESP.Safe.Active])then
                WorldESP.Safe[WorldESP.Safe.Active] = Drawing.new("Text")
                ApplySettings(WorldESP.Safe[WorldESP.Safe.Active],WorldESPSafe)
                WorldESP.Safe.Created = WorldESP.Safe.Created + 1
            end
            ScreenPoint = camera:WorldToViewportPoint(v.PrimaryPart.Position)
            if(ScreenPoint.Z>0)then
                WorldESP.Safe[WorldESP.Safe.Active].Visible = true
                WorldESP.Safe[WorldESP.Safe.Active].Text = MatchBegin(v.Name,"Register") and "Register" or (MatchBegin(v.Name,"SmallSafe") and "SmallSafe" or (MatchBegin(v.Name,"MediumSafe") and "MediumSafe" or v.Name))
                WorldESP.Safe[WorldESP.Safe.Active].Position = Vector2.new(ScreenPoint.X,ScreenPoint.Y)
                WorldESP.Safe[WorldESP.Safe.Active].Color = (v.Values.Broken.Value and Color3.new(1,0,0) or Color3.new(1,1,1))
            else
                WorldESP.Safe[WorldESP.Safe.Active].Visible = false
            end
        end
    end
    if(WorldESP.Safe.Created>WorldESP.Safe.Active)then
        for i = 1 ,WorldESP.Safe.Created-WorldESP.Safe.Active,1 do
            WorldESP.Safe[WorldESP.Safe.Active+i].Visible = false
        end
    end
end)

local oldStamina
oldStamina = hookfunction(getupvalue(getrenv()._G.S_Take,2),function(v1,...)
    if(InfStamina)then -- god damn the roblox engine is so shit
        v1 = 0
    end
    return oldStamina(v1,...)
end)

local oldNamecall
oldNamecall = hookmetamethod(game,"__namecall", newcclosure(function(...)
    if(not checkcaller() and getnamecallmethod()=="FireServer" and NoFall)then
        local tab = ...
        if(tostring(tab)=="__DFfDD")then
            return
        end
    end
    
    return oldNamecall(...)
end))

_G.instantLockpick = true
local oldGB2Index
oldGB2Index = hookmetamethod(Instance.new("Frame"),"__index",function(...)
    local tab, idx = ...
    if(tab == nil or type(tab)~="userdata" or idx == nil)then
        return oldGB2Index(...)
    end
    if(not checkcaller() and _G.instantLockpick and (idx == "AbsolutePosition" or idx == "AbsoluteSize"))then
        for i = 2, 4 do -- for safety/future proofing
            if(getinfo(i).name=="collidesWith")then
                if(idx=="AbsolutePosition")then
                    return Vector2.new()
                else
                    return Vector2.new(1,1)
                end
            end
        end
    end
    
    return oldGB2Index(...)
end)

while _G.LoopActive do -- loop for unimportant shit
	Lighting.Ambient = FullBright and _G.FullBrightColor or DefaultAmbient
    for i, v in next, GamePlayers:GetPlayers() do
        if(v~=LPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart"))then
            if(settings.HBE and v.Character.Head.Size~=_G.BPartSize)then
                v.Character.Head.Size=_G.BPartSize
                v.Character.Head.Transparency = 0.5
            elseif(not settings.HBE and v.Character.Head.Size==_G.BPartSize)then
                v.Character.Head.Size=DefHeadSize
                v.Character.Head.Transparency = 0
            end
        end
    end
wait(0.001)
end
