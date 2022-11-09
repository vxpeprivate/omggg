--// Main Varibles
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local cam = workspace.CurrentCamera
local Team = game:GetService("Teams")
--// UI Elements
local LiteFrame = shared.TabInGui["Non-Gaming chair"]
local BlantantFrame = shared.TabInGui["Gaming chair"]
local AnimationTab = shared.TabInGui["Animations"]
local IClientToggleProperty = shared.IClientToggledProperty
local ButtonInGui = shared.ButtonInGui

local oldisnetworkowner = isnetworkowner
local networkownerfunc = isnetworkowner
local isnetworkowner = isnetworkowner or function()
	return true
end

local function Cape(char, texture)
	for i, v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
	local hum = char:WaitForChild("Humanoid")
	local torso = nil
	if hum.RigType == Enum.HumanoidRigType.R15 then
		torso = char:WaitForChild("UpperTorso")
	else
		torso = char:WaitForChild("Torso")
	end
	local p = Instance.new("Part", torso.Parent)
	p.Name = "Cape"
	p.Anchored = false
	p.CanCollide = false
	p.TopSurface = 0
	p.BottomSurface = 0
	p.FormFactor = "Custom"
	p.Size = Vector3.new(0.2, 0.2, 0.2)
	p.Transparency = 0
	p.BrickColor = BrickColor.new("Black")
	local decal = Instance.new("Decal", p)
	decal.Texture = texture
	decal.Face = "Back"
	local msh = Instance.new("BlockMesh", p)
	msh.Scale = Vector3.new(9, 17.5, 0.5)
	local motor = Instance.new("Motor", p)
	motor.Part0 = p
	motor.Part1 = torso
	motor.MaxVelocity = 0.01
	motor.C0 = CFrame.new(0, 2, 0) * CFrame.Angles(0, math.rad(90), 0)
	motor.C1 = CFrame.new(0, 1, 0.45) * CFrame.Angles(0, math.rad(90), 0)
	local wave = false
	repeat
		wait(1 / 44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude / 10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude / 11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude / 111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat
			wait()
		until motor.CurrentAngle == motor.DesiredAngle
			or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude / 10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
	until not p or p.Parent ~= torso.Parent
end

local function SpecialCape(char, texture)
	for i, v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
	local hum = char:WaitForChild("Humanoid")
	local torso = nil
	if hum.RigType == Enum.HumanoidRigType.R15 then
		torso = char:WaitForChild("UpperTorso")
	else
		torso = char:WaitForChild("Torso")
	end
	local p = Instance.new("Part", torso.Parent)
	p.Name = "Cape"
	p.Anchored = false
	p.CanCollide = false
	p.TopSurface = 0
	p.BottomSurface = 0
	p.FormFactor = "Custom"
	p.Size = Vector3.new(0.2, 0.2, 0.2)
	p.Transparency = 0
	p.BrickColor = BrickColor.new("Black")
	local decal = Instance.new("Decal", p)
	--decal.Texture = "http://www.roblox.com/asset/?id=7596459141"
	decal.Face = "Back"

	spawn(function()
		local x = 0.06 -- number of seconds

		local CapeTexture = {
			"http://www.roblox.com/asset/?id=7596459141",
			"http://www.roblox.com/asset/?id=7596439980",
			"http://www.roblox.com/asset/?id=7596441418",
			"http://www.roblox.com/asset/?id=8574453387",
			"http://www.roblox.com/asset/?id=7596477697",
			"http://www.roblox.com/asset/?id=7596520279",
			"http://www.roblox.com/asset/?id=7596536228",
			"http://www.roblox.com/asset/?id=7604541151",
			"http://www.roblox.com/asset/?id=7604546665",
			"http://www.roblox.com/asset/?id=7604556372",
			"http://www.roblox.com/asset/?id=7604566245",
			"http://www.roblox.com/asset/?id=7604591195",
			"http://www.roblox.com/asset/?id=7604597871",
			"http://www.roblox.com/asset/?id=7604611676",
			"http://www.roblox.com/asset/?id=7604683032",
			"http://www.roblox.com/asset/?id=7604697467",
			"http://www.roblox.com/asset/?id=7604718179",
			"http://www.roblox.com/asset/?id=7604737729",
			"http://www.roblox.com/asset/?id=7604724901",
			"http://www.roblox.com/asset/?id=7604835358",
			"http://www.roblox.com/asset/?id=7604806606",
			"http://www.roblox.com/asset/?id=7604846482",
			"http://www.roblox.com/asset/?id=7604902004",
			"http://www.roblox.com/asset/?id=7604918864",
			"http://www.roblox.com/asset/?id=7604926863",
			"http://www.roblox.com/asset/?id=7604926863",
			"http://www.roblox.com/asset/?id=7604954258",
			"http://www.roblox.com/asset/?id=7604948766",
			"http://www.roblox.com/asset/?id=7605031118",
			"http://www.roblox.com/asset/?id=7605044918",
		}

		while true do
			for i, v in pairs(CapeTexture) do
				decal.Texture = CapeTexture[i]
				task.wait(x)
			end
		end
	end)

	local msh = Instance.new("BlockMesh", p)
	msh.Scale = Vector3.new(9, 17.5, 0.5)
	local motor = Instance.new("Motor", p)
	motor.Part0 = p
	motor.Part1 = torso
	motor.MaxVelocity = 0.01
	motor.C0 = CFrame.new(0, 2, 0) * CFrame.Angles(0, math.rad(90), 0)
	motor.C1 = CFrame.new(0, 1, 0.45) * CFrame.Angles(0, math.rad(90), 0)
	local wave = false
	repeat
		wait(1 / 44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude / 10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude / 11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude / 111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat
			wait()
		until motor.CurrentAngle == motor.DesiredAngle
			or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude / 10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
	until not p or p.Parent ~= torso.Parent
end

local function isAlive(plr)
	local plr = plr or LocalPlayer
	if
		plr
		and plr.Character
		and (
			(plr.Character:FindFirstChild("Humanoid"))
			and (plr.Character:FindFirstChild("Humanoid").Health > 0)
			and (plr.Character:FindFirstChild("HumanoidRootPart"))
			and (plr.Character:FindFirstChild("Head"))
		)
	then
		return true
	end
end

local HeartbeatTable = {}
local RenderStepTable = {}
local function BindToHeartbeat(name, func)
	if HeartbeatTable[name] == nil then
		HeartbeatTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
	end
end

local function UnbindFromHeartbeat(name)
	if HeartbeatTable[name] then
		HeartbeatTable[name]:Disconnect()
		HeartbeatTable[name] = nil
	end
end

local function BindToRenderStep(name, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
	end
end

local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

--// Folder
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESPFolder"
ESPFolder.Parent = workspace

_G.ESPFolder = ESPFolder

--// Game Hider
do
	local connections = {}
	local renamedInstances = {}
	local textservice = game:GetService("TextService")
	local namebox = { Value = "Player" }
	local others = { Enabled = false }
	local othersnamebox = { Value = "Other" }
	local function x(v)
		local removed = v:gsub(LocalPlayer.Name, namebox.Value or "Player")
			:gsub(tostring(LocalPlayer.UserId), "1")
			:gsub(LocalPlayer.DisplayName, namebox.Value or "Player")
		if others.Enabled then
			for _, plr in next, Players:GetPlayers() do
				removed = removed
					:gsub(plr.Name, othersnamebox.Value or "Other")
					:gsub(tostring(plr.UserId), "1")
					:gsub(plr.DisplayName, othersnamebox.Value or "Other")
			end
		end
		return removed
	end
	local function replace(v)
		if pcall(function()
			return v.Text
		end) and typeof(v.Text) == "string" then
			renamedInstances[v] = { Original = v.Text, Property = "Text" }
			local y = x(v.Text)
			v.Text = y
			connections[#connections + 1] = v:GetPropertyChangedSignal("Text"):connect(function()
				renamedInstances[v].Original = v.Text
				v.Text = x(v.Text)
			end)
			return y
		end
		if pcall(function()
			return v.Image
		end) and typeof(v.Image) == "string" then
			renamedInstances[v] = { Original = v.Image, Property = "Image" }
			local y = x(v.Image)
			v.Image = y
			connections[#connections + 1] = v:GetPropertyChangedSignal("Image"):connect(function()
				renamedInstances[v].Original = v.Image
				v.Image = x(v.Image)
			end)
			return y
		end
		return v
	end

	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local oldnamecall = mt.__namecall

	--// NickHider Frame
	local AntiCheatFrame = LiteFrame.Toggle({
		Text = "NickHider",
		Callback = function(Value)
			IClientToggleProperty.NickHiderToggle = Value
			if IClientToggleProperty.NickHiderToggle then
				spawn(function()
					for i, v in next, game:GetDescendants() do
						replace(v)
						if i % 500 == 0 then
							task.wait()
						end
					end
				end)
				connections[#connections + 1] = game.DescendantAdded:connect(function(v)
					replace(v)
				end)
				mt.__namecall = newcclosure(function(self, ...)
					local args = { ... }
					local ncm = getnamecallmethod()
					if ncm == "GetTextSize" and self == textservice then
						args[1] = replace(args[1])
					end
					return oldnamecall(self, table.unpack(args))
				end)
			else
				for i, v in next, connections do
					v:Disconnect()
					connections[i] = nil
				end
				mt.__namecall = oldnamecall
				for i, v in next, renamedInstances do
					if typeof(i) == "Instance" and i.Parent ~= nil then
						i[v.Property] = v.Original
					end
				end
			end
		end,
		Enabled = IClientToggleProperty.NickHiderToggle,
	})

	ButtonInGui["NickHider"] = { AntiCheatFrame, "NickHiderToggle" }
end

----------// Anti cheat bypass real
do
	local IsUsingAntiCheatAssist = false

	local AnticheatAssistConstants = {
		MaxDistance = 20,
		-- normal
		Delay = 0.125,
		Lerp = 0.39,
		TPDelay = 0.1,

		-- combat
		CombatDelay = 0.1,
		CombatLerp = 0.5,
		CombatTPDelay = 0,
	}

	local BodyPart = {
		R6 = {
			"Head",
			"Torso",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
		},
		R15 = {
			"Head",
			"UpperTorso",
			"LowerTorso",
			"LeftUpperLeg",
			"LeftLowerLeg",
			"LeftFoot",
			"RightUpperLeg",
			"RightLowerLeg",
			"RightFoot",
			"LeftUpperArm",
			"LeftLowerArm",
			"LeftHand",
			"RightUpperArm",
			"RightLowerArm",
			"RightHand",
		},
	}

	local OldHipHeight
	local AnticheatAssistLastTick = 0
	local AnticheatAssistConnections = {}
	local AnticheatAssistTransparent = {}
	local lagbacknum = 0
	local lagbackcurrent = false
	local NextTrack = os.time()
	local pinglist = {}
	local fpslist = {}
	local RealRoot

	local function AnticheatAssistFunction(char)
		IsUsingAntiCheatAssist = true
		spawn(function()
			if not isAlive() then
				repeat
					task.wait()
				until isAlive()
			end
			if not LocalPlayer.CharacterAppearanceLoaded then
				repeat
					task.wait()
				until LocalPlayer.CharacterAppearanceLoaded
			end
			local char = char or LocalPlayer.Character

			local Humanoid = char:WaitForChild("Humanoid", 15)
			local HumanoidRootPart = char:WaitForChild("HumanoidRootPart", 15)
			local RigType = Humanoid.RigType
			local BodyParts = BodyPart[RigType.Name]
			for i, v in next, BodyParts do
				char:WaitForChild(v, 10)
			end

			repeat
				task.wait()
				if
					networkownerfunc == nil
					and gethiddenproperty(HumanoidRootPart, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual
				then
					sethiddenproperty(HumanoidRootPart, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
				end
			until HumanoidRootPart
				and (
					networkownerfunc and networkownerfunc(HumanoidRootPart)
					or networkownerfunc == nil
						and gethiddenproperty(HumanoidRootPart, "NetworkOwnershipRule") == Enum.NetworkOwnership.Automatic
				)

			OldHipHeight = OldHipHeight or Humanoid.HipHeight --// Change Hip Hieght
			Humanoid.HipHeight = OldHipHeight
			RealRoot = HumanoidRootPart -- // Change HhumanoidRotPart
			char.Parent = game -- Parent char to game
			FakeRoot = RealRoot:Clone() -- Clone Root (Fake Root)
			FakeRoot.Parent = char
			FakeRoot.Anchored = true
			RealRoot.Parent = cam
			FakeRoot.CFrame = RealRoot.CFrame
			char.PrimaryPart = FakeRoot -- // Change
			char.Parent = workspace
			RealRoot.CanCollide = true

			RealRoot.Transparency = AnticheatAssistTransparent.Enabled and 0.5 or 0
			RealRoot.Color = Color3.fromRGB(71, 236, 50)
			RealRoot.Material = Enum.Material.Water

			task.wait(0.1)

			for i, v in next, char:GetDescendants() do
				if v:IsA("BodyVelocity") then
					v:Destroy()
				end
				if v:IsA("Weld") or v:IsA("Motor6D") then
					if v.Part0 and v.Part0 == RealRoot then
						v.Part0 = FakeRoot
					end
					if v.Part1 and v.Part1 == RealRoot then
						v.Part1 = FakeRoot
					end
				end
			end

			for i, v in next, RealRoot:GetDescendants() do
				if v:IsA("BodyVelocity") then
					v:Destroy()
				end
			end

			BindToRenderStep("AnticheatAssist", function()

				--// Check FPS
				if NextTrack <= os.time() then
					local ping = math.floor(
						tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
					)
					local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
					if #pinglist >= 10 then
						table.remove(pinglist, 1)
					end
					if #fpslist >= 10 then
						table.remove(fpslist, 1)
					end
					table.insert(pinglist, ping)
					table.insert(fpslist, fps)
					task.wait(1)
				end

				--// Setting CFrame
				if isAlive() then

					--// Check if got anti cheated
					if
						networkownerfunc == nil
						and gethiddenproperty(RealRoot, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual
					then
						if lagbackcurrent == false then
							lagbacknum = tick() + 8
							lagbackcurrent = true
						end
						if lagbacknum <= tick() then
							sethiddenproperty(RealRoot, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
						end
					else
						lagbackcurrent = false
					end

					--// Actual CFraming
					if RealRoot and FakeRoot then
						FakeRoot.Anchored = false
						RealRoot.CanCollide = false
						--//
						if
							networkownerfunc == nil
							and gethiddenproperty(RealRoot, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual
						then
							if lagbackcurrent == false then
								lagbackcurrent = true
							end
							if lagbacknum <= tick() then
								sethiddenproperty(RealRoot, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
							end
						else
							lagbackcurrent = false
						end

						--// Setting up the cframe
						if
							networkownerfunc and (not networkownerfunc(RealRoot))
							or networkownerfunc == nil
								and gethiddenproperty(RealRoot, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual
						then
							FakeRoot.CFrame = RealRoot.CFrame
						else
							local MoveDirection = Humanoid.MoveDirection * 20
							local Velo = Vector3.new(MoveDirection.X, FakeRoot.Velocity.Y, MoveDirection.Z)
							RealRoot.Velocity = Velo
							RealRoot.RotVelocity = Vector3.zero
							RealRoot.Transparency = AnticheatAssistTransparent.Enabled and 1 or 0.7

							local Magnitude = (FakeRoot.Position - RealRoot.Position).Magnitude
							if Magnitude > AnticheatAssistConstants.MaxDistance then
								FakeRoot.CFrame = RealRoot.CFrame
							end

							local Delay = AnticheatAssistConstants.Delay
							if tick() - AnticheatAssistLastTick > Delay then
								AnticheatAssistLastTick = tick()
								RealRoot.CFrame = RealRoot.CFrame:Lerp(FakeRoot.CFrame, AnticheatAssistConstants.Lerp)
							end
						end
					end
				end
			end)
		end)
	end

	local function DisableAnticheatAssist(char)
		if IsUsingAntiCheatAssist then
		else
			return
		end
		spawn(function()
			if not isAlive() then
				repeat
					task.wait()
				until isAlive()
			end
			local char = char or LocalPlayer.Character
			local Humanoid = char:FindFirstChildWhichIsA("Humanoid")
			UnbindFromRenderStep("AnticheatAssist")
			pcall(function()
				char.Parent = game
			end)
			if RealRoot and RealRoot.Parent ~= nil then
				RealRoot.Parent = char
				char.PrimaryPart = RealRoot
				RealRoot.Transparency = 1
			end
			if char.Parent ~= nil then
				char.Parent = workspace
			end
			for i, v in next, char:GetDescendants() do
				if v:IsA("BodyVelocity") then
					v:Destroy()
				end
				if v:IsA("Weld") or v:IsA("Motor6D") then
					if v.Part0 and v.Part0 == FakeRoot then
						v.Part0 = RealRoot
					end
					if v.Part1 and v.Part1 == FakeRoot then
						v.Part1 = RealRoot
					end
				end
			end
			if Humanoid then
				Humanoid.HipHeight = OldHipHeight
			end
			if FakeRoot then
				FakeRoot:Destroy()
				FakeRoot = nil
			end
		end)
	end

	-- AntiCheat Bypass real

	--// AntiCheat Frame
	local AntiCheatFrame = BlantantFrame.Toggle({
		Text = "Test",
		Callback = function(Value)
			IClientToggleProperty.AnticheatBypass = Value
			if IClientToggleProperty.AnticheatBypass then
				AnticheatAssistConnections["CharacterRemoving"] = LocalPlayer.CharacterRemoving:Connect(function(char)
					DisableAnticheatAssist(char)
				end)

				AnticheatAssistConnections["CharacterAdded"] = LocalPlayer.CharacterAdded:Connect(function(char)
					AnticheatAssistFunction(char)
				end)

				AnticheatAssistConnections["TeamUpdate"] = LocalPlayer:GetPropertyChangedSignal("Team")
					:Connect(function()
						local char = LocalPlayer.Character
						DisableAnticheatAssist(char)
						AnticheatAssistFunction(char)
					end)

				if isAlive() then
					AnticheatAssistFunction(LocalPlayer.Character)
				end
			else
				UnbindFromRenderStep("AnticheatAssist")

				for i, v in next, AnticheatAssistConnections do
					v:Disconnect()
					AnticheatAssistConnections[i] = nil
				end

				if isAlive() then
					DisableAnticheatAssist(LocalPlayer.Character)
				end
			end
		end,
		Enabled = IClientToggleProperty.AnticheatBypass,
	})

	ButtonInGui["AntiCheat Real"] = { AntiCheatFrame, "AnticheatBypass" }
end

do
	local speedsettings = {
		factor = 5.37,
		velocitydivfactor = 2.9,
		wsvalue = 22.5,
	}
	local speeddelayval = tick()

	--// Speed Frame
	local SpeedFrame =
		BlantantFrame.Toggle({
			Text = "Speed 4",
			Callback = function(Value)
				IClientToggleProperty.SpeedToggled = Value
				if not IClientToggleProperty.SpeedToggled then
					LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
					UnbindFromHeartbeat("Speed")
				else
					BindToHeartbeat("Speed", function(dt)
						if isAlive() then
							if IClientToggleProperty.SpeedToggled then
								local movevec = LocalPlayer.Character.Humanoid.MoveDirection.Unit
								movevec = movevec == movevec and movevec or Vector3.new()
								local newpos = (
									movevec
									* (math.clamp(40 - LocalPlayer.Character.Humanoid.WalkSpeed, 0, 1000000000) * dt)
								)
								LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
									+ newpos
							end
						end
					end)
				end
			end,
			Enabled = IClientToggleProperty.SpeedToggled,
		})

	ButtonInGui["Speed"] = { SpeedFrame, "SpeedToggled" }
end

----------// Player ESP Handler
do
	local BeeTable = {}
	--// Frame
	local AutoBuyFrame = BlantantFrame.Toggle({
		Text = "Player ESP",
		Callback = function(Value)
			IClientToggleProperty.PlayEspToggle = Value
			if IClientToggleProperty.PlayEspToggle then
				BindToRenderStep("ESP", function()
					if IClientToggleProperty.PlayEspToggle then
						for i, plr in pairs(Players:GetPlayers()) do
							if plr.Character then
								if BeeTable[plr.Character] then
								else
									if plr.Name == LocalPlayer.Name then
									else
										if plr.Character then
											local MakeHighLight = Instance.new("BoxHandleAdornment")
											MakeHighLight.Name = plr.Name
											MakeHighLight.Adornee = plr.Character.HumanoidRootPart
											MakeHighLight.Size = plr.Character.HumanoidRootPart.Size
											MakeHighLight.AlwaysOnTop = true
											MakeHighLight.Color3 = #Team:GetChildren() >= 1
													and plr.Team.Name == LocalPlayer.Team.Name
													and Color3.new(0.333333, 1, 0)
												or Color3.new(1, 0, 0)
											MakeHighLight.Parent = ESPFolder
											MakeHighLight.ZIndex = 1
											MakeHighLight.Transparency = 0.3
											BeeTable[plr.Character] = MakeHighLight
										end
									end
								end

								for i, v in pairs(BeeTable) do
									if i:IsDescendantOf(workspace) then
										if i.Humanoid.Health > 0 then
											v.Transparency = 0.3
										else
											v.Transparency = 1
										end
									else
										v:Destroy()
									end
								end
							end
						end
					end
				end)
			else
				UnbindFromRenderStep("ESP")
				for i, v in pairs(BeeTable) do
					v.Transparency = 1
				end
				BeeTable = {}
			end
		end,
		Enabled = IClientToggleProperty.PlayEspToggle,
	})

	ButtonInGui["Player ESP"] = { AutoBuyFrame, "PlayEspToggle" }
end

----------// Auto Report
do
	local LoggedPerson = {}

	--// Frame
	local AutoBuyFrame = BlantantFrame.Toggle({
		Text = "Auto Report",
		Callback = function(Value)
			shared.IClientToggledProperty.AutoReportToggle = Value
			if shared.IClientToggledProperty.AutoReportToggle then
				BindToRenderStep("AutoReport", function()
					if shared.IClientToggledProperty.AutoReportToggle then
						for i, v in pairs(Players:GetPlayers()) do
							if not LoggedPerson[v] and v ~= lplr then
								LoggedPerson[v] = true
								shared.SendNotification("Reported","Reported " .. v.Name)
								--Players:ReportAbuse(v, "Swearing", "Player did a bad thing!")
							end
						end
					end
				end)
			else
				UnbindFromRenderStep("AutoReport")
			end
		end,
		Enabled = shared.IClientToggledProperty.AutoReportToggle,
	})
end

--------------------------------------// Cosmetics Tab
----------// Cape
do
	local Capeconnection

	local WiggleAnimationFrame = shared.TabInGui["Cosmetics"].Toggle({
		Text = "Cape",
		Callback = function(Value)
			shared.IClientToggledProperty.CosmeticCape = Value
			if shared.IClientToggledProperty.CosmeticCape then
				Capeconnection = LocalPlayer.CharacterAdded:Connect(function(char)
					task.spawn(function()
						pcall(function()
							Cape(char, "rbxassetid://880811505")
						end)
					end)
				end)
				if LocalPlayer.Character then
					task.spawn(function()
						pcall(function()
							Cape(LocalPlayer.Character, "rbxassetid://880811505")
						end)
					end)
				end
			else
				if Capeconnection then
					Capeconnection:Disconnect()
				end
				if LocalPlayer.Character then
					for i, v in pairs(LocalPlayer.Character:GetDescendants()) do
						if v.Name == "Cape" then
							v:Destroy()
						end
					end
				end
			end
		end,
		Enabled = shared.IClientToggledProperty.CosmeticCape,
	})

	shared.ButtonInGui["Cape"] = { WiggleAnimationFrame, "CosmeticCape" }
end

----------// Cape
do
	local Capeconnection

	local WiggleAnimationFrame = shared.TabInGui["Cosmetics"].Toggle({
		Text = "Special Cape",
		Callback = function(Value)
			shared.IClientToggledProperty.CosmeticCapeSpecial = Value
			if shared.IClientToggledProperty.CosmeticCapeSpecial then
				Capeconnection = LocalPlayer.CharacterAdded:Connect(function(char)
					task.spawn(function()
						pcall(function()
							SpecialCape(char, "rbxassetid://880811505")
						end)
					end)
				end)
				if LocalPlayer.Character then
					task.spawn(function()
						pcall(function()
							SpecialCape(LocalPlayer.Character, "rbxassetid://880811505")
						end)
					end)
				end
			else
				if Capeconnection then
					Capeconnection:Disconnect()
				end
				if LocalPlayer.Character then
					for i, v in pairs(LocalPlayer.Character:GetDescendants()) do
						if v.Name == "Cape" then
							v:Destroy()
						end
					end
				end
			end
		end,
		Enabled = shared.IClientToggledProperty.CosmeticCapeSpecial,
	})

	shared.ButtonInGui["CapeSpecial"] = { WiggleAnimationFrame, "CosmeticCapeSpecial" }
end

----------// Trail
do
	local breadcrumbtrail = nil
	local breadcrumbattachment
	local breadcrumbattachment2
	local WiggleAnimationFrame = shared.TabInGui["Cosmetics"].Toggle({
		Text = "Walk Trail",
		Callback = function(Value)
			shared.IClientToggledProperty.CosmeticWalkTrail = Value
		end,
		Enabled = shared.IClientToggledProperty.CosmeticWalkTrail,
	})

	shared.ButtonInGui["Walk Trail"] = { WiggleAnimationFrame, "CosmeticWalkTrail" }

	game:GetService("RunService").Heartbeat:Connect(function()
		if shared.IClientToggledProperty.CosmeticWalkTrail then
			if isAlive() then
				if breadcrumbtrail == nil then
					breadcrumbattachment = Instance.new("Attachment")
					breadcrumbattachment.Position = Vector3.new(0, 0.07 - 2.9, 0.5)
					breadcrumbattachment2 = Instance.new("Attachment")
					breadcrumbattachment2.Position = Vector3.new(0, -0.07 - 2.9, 0.5)
					breadcrumbtrail = Instance.new("Trail")
					breadcrumbtrail.Attachment0 = breadcrumbattachment
					breadcrumbtrail.Attachment1 = breadcrumbattachment2
					breadcrumbtrail.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1))
					breadcrumbtrail.FaceCamera = true
					breadcrumbtrail.Lifetime = (20 / 100)
					breadcrumbtrail.Enabled = true
					breadcrumbtrail.Parent = LocalPlayer.Character
				else
					local trailfound = false
					for i, v in pairs(LocalPlayer.Character:GetChildren()) do
						if v:IsA("Trail") then
							if trailfound then
								v:Destroy()
							else
								trailfound = true
							end
						end
					end
					breadcrumbattachment.Parent = LocalPlayer.character.HumanoidRootPart
					breadcrumbattachment2.Parent = LocalPlayer.character.HumanoidRootPart
					breadcrumbtrail.Parent = LocalPlayer.Character
				end
			end
		else
			if breadcrumbtrail then
				breadcrumbtrail:Destroy()
				if isAlive() then
					for i, v in pairs(LocalPlayer.Character:GetChildren()) do
						if v:IsA("Trail") then
							v:Destroy()
						end
					end
				end
				breadcrumbtrail = nil
			end
		end
	end)
end
