--// Wait Until game is loaded
repeat
	task.wait()
until game:IsLoaded() == true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
repeat
	task.wait(1)
until LocalPlayer.Character ~= nil
local Character = LocalPlayer.Character or LocalPlayer.Character.CharacterAdded:Wait()

--// Synapse X Functions
local function IsBetterFile(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil
end

local function GetURL(scripturl)
	if shared.IClientDev then
		if not betterisfile("IClient/" .. scripturl) then
			error("File not found : IClient/" .. scripturl)
		end
		return readfile("IClient/" .. scripturl)
	else
		local res = game:HttpGet("https://raw.githubusercontent.com/randomdude11135/IClient/main/" .. scripturl, true)
		assert(res ~= "404: Not Found", "File not found")
		return res
	end
end

local getasset = getsynasset or getcustomasset or function(location)
	return "rbxasset://" .. location
end
local queueteleport = syn and syn.queue_on_teleport
	or queue_on_teleport
	or fluxus and fluxus.queue_on_teleport
	or function() end
local requestfunc = syn and syn.request
	or http and http.request
	or http_request
	or fluxus and fluxus.request
	or request
	or function(tab)
		if tab.Method == "GET" then
			return {
				Body = game:HttpGet(tab.Url, true),
				Headers = {},
				StatusCode = 200,
			}
		else
			return {
				Body = "bad exploit",
				Headers = {},
				StatusCode = 404,
			}
		end
	end

--// Main Varibles
local GuiLibrary = loadstring(GetURL("GuiLibrary.lua"))()
local checkpublicreponum = 0
local checkpublicrepo
local function checkpublicrepo(id)
	print("Getting module for game place id of" .. id)
	local suc, req = pcall(function()
		return requestfunc({
			Url = "https://raw.githubusercontent.com/randomdude11135/IClient/main/GameScripts/" .. id .. ".Lua",
			Method = "GET",
		})
	end)
	if not suc then
		checkpublicreponum = checkpublicreponum + 1
		task.spawn(function() end)
		task.wait(2)
		return checkpublicrepo(id)
	end
	if req.StatusCode == 200 then
		return req.Body
	end
	return nil
end

--// Check if script is supported
if not (getasset and requestfunc and queueteleport) then
	return
end

if shared.AlreadyExecuted then
	return
else
	shared.AlreadyExecuted = true
end

--// Global Functions
shared.SendNotification = function(title,text)
	StarterGui:SetCore("SendNotification",{
		Title = title,
		Text = text
	}
 	)
end

--// Create Folder
if isfolder("IClient") == false then
	makefolder("IClient")
end

if isfolder("IClient/Settings") == false then
	makefolder("IClient/Settings")
end

if isfolder("IClient/Settings/" .. game.PlaceId) == false then
	makefolder("IClient/Settings/" .. game.PlaceId)
end

if isfolder("IClient/SettingsSelecting") == false then
	makefolder("IClient/SettingsSelecting")
end

local success2, result2 = pcall(function()
	return readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt")
end)

if not success2 or not result2 then
	writefile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt", "MainSetting")
end

--// Set Shared Info
shared.IClientToggledProperty = {}
shared.GuiLibrary = GuiLibrary
shared.TabInGui = {}
shared.ButtonInGui = {}

--// Write Profile
local success2, result2 = pcall(function()
	return game:GetService("HttpService"):JSONDecode(
		readfile(
			"IClient/Settings/"
				.. game.PlaceId
				.. "/"
				.. readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt")
				.. ".IClientSetting.txt"
		)
	)
end)

if success2 and result2 then
	for i, v in pairs(result2) do
		shared.IClientToggledProperty[i] = v
	end
else
	writefile(
		"IClient/Settings/"
			.. game.PlaceId
			.. "/"
			.. readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt")
			.. ".IClientSetting.txt",
		game:GetService("HttpService"):JSONEncode(shared.IClientToggledProperty)
	)
end

LocalPlayer.OnTeleport:Connect(function(State)
	if State == Enum.TeleportState.Started then
		local teleportstr =
			'loadstring(game:HttpGet("https://raw.githubusercontent.com/randomdude11135/IClient/main/MainScript.lua", true))()'
		writefile(
			"IClient/Settings/"
				.. game.PlaceId
				.. "/"
				.. readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt")
				.. ".IClientSetting.txt",
			game:GetService("HttpService"):JSONEncode(shared.IClientToggledProperty)
		)
		queueteleport(teleportstr)
	end
end)

-------// Load UI
local LoadIClientUI,MainFrame = GuiLibrary.Load({
	Title = "IClient",
	Style = 3,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",

	ColorOverrides = {
		MainFrame = Color3.fromRGB(0, 0, 0),
	},
})
MainFrame.Visible = false
shared.MainUI = LoadIClientUI


UserInputService.InputBegan:Connect(function(obj)
	if obj.KeyCode == Enum.KeyCode.RightShift then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

----// Non - Blantant Frame
local LiteFrame = LoadIClientUI.New({
	Title = "Non-Gaming chair",
})
shared.TabInGui["Non-Gaming chair"] = LiteFrame

----// Blantant Frame
local BlantantFrame = LoadIClientUI.New({
	Title = "Gaming Chair",
})
shared.TabInGui["Gaming chair"] = BlantantFrame

----// Cosmetics Frame
local CosmeticsFrame = LoadIClientUI.New({
	Title = "Cosmetics",
})
shared.TabInGui["Cosmetics"] = CosmeticsFrame

----// Animation Frame
local AnimationTab = LoadIClientUI.New({
	Title = "Animations",
})
shared.TabInGui["Animations"] = AnimationTab

----// Profile Frame
local ProfileTab = LoadIClientUI.New({
	Title = "Load Settings",
})

----// Login Frame
local LoginTab = LoadIClientUI.New({
	Title = "Login",
})

pcall(function()
	loadstring(GetURL("GameScripts/Universal.Lua"))()
end)

pcall(function()
	local publicrepo = checkpublicrepo(game.PlaceId)
	if publicrepo then
		loadstring(publicrepo)()
	end
end)


if isfolder("IClient/CustomModules") and isfile("IClient/CustomModules/Universal.Lua") then
	pcall(function()
	loadstring(readfile("IClient/CustomModules/Universal.Lua"))()
	end)
end

--------------------------------------// Settings Tab
do
	local ProfileTable = {}
	local ProfileSetName = ""
	function refreshprofilelist()
		if listfiles then
			for i, v in pairs(listfiles("IClient/Settings/" .. game.PlaceId)) do
				local newstr = v:gsub("IClient/Settings/" .. game.PlaceId, ""):sub(2, v:len())
				local newstr2 = string.split(newstr, ".")[1]
				if ProfileTable[newstr2] then
					ProfileTable[newstr2]:SetText(
						"Load "
							.. newstr2
							.. " Setting "
							.. (
								readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt") == newstr2
									and "(Selected)"
								or ""
							)
					)
				else
					ProfileTable[newstr2] = ProfileTab.Button({
						Text = "Load " .. newstr2 .. " Setting " .. (readfile(
							"IClient/SettingsSelecting/" .. game.PlaceId .. ".txt"
						) == newstr2 and "(Selected)" or ""),
						Callback = function(Value)
							--// Write Profile
							local success2, result2 = pcall(function()
								return game:GetService("HttpService"):JSONDecode(
									readfile(
										"IClient/Settings/" .. game.PlaceId .. "/" .. newstr2 .. ".IClientSetting.txt"
									)
								)
							end)

							if success2 and result2 then
								writefile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt", newstr2)
								refreshprofilelist()

								for x, z in pairs(shared.ButtonInGui) do
									pcall(function()
										z[1]:SetState(false)
									end)
									task.wait()
								end

								for list, newprop in pairs(result2) do
									shared.IClientToggledProperty[list] = newprop
								end

								wait(1)
								for x, z in pairs(shared.ButtonInGui) do
									pcall(function()
										z[1]:SetState(shared.IClientToggledProperty[z[2]])
									end)
								end
							end
						end,

						Menu = {
							["Delete Profile"] = function(self)
								if delfile then
									delfile(
										"IClient/Settings/" .. game.PlaceId .. "/" .. newstr2 .. ".IClientSetting.txt"
									)
									--ProfileTable[newstr2]:SetText("Load " .. newstr2 .. " Setting (Deleted)")
									ProfileTable[newstr2]:Remove()
								end
							end,
						},
					})
				end
			end
		end
	end

	-----// Set Adding Profile Name
	local WiggleAnimationFrame = ProfileTab.TextField({
		Text = "Profile Name",
		Callback = function(Value)
			ProfileSetName = Value
		end,
	})

	----// Add Profile
	local WiggleAnimationFrame = ProfileTab.Button({
		Text = "Add Profile / Save Current Profile",
		Callback = function(Value)
			if ProfileSetName == "" then
				writefile(
					"IClient/Settings/"
						.. game.PlaceId
						.. "/"
						.. readfile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt")
						.. ".IClientSetting.txt",
					game:GetService("HttpService"):JSONEncode(shared.IClientToggledProperty)
				)
			else
				writefile(
					"IClient/Settings/" .. game.PlaceId .. "/" .. ProfileSetName .. ".IClientSetting.txt",
					game:GetService("HttpService"):JSONEncode(shared.IClientToggledProperty)
				)
				writefile("IClient/SettingsSelecting/" .. game.PlaceId .. ".txt", ProfileSetName)
				ProfileSetName = ""
				refreshprofilelist()
			end
		end,
	})

	refreshprofilelist()
end
