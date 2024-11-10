local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Shx hub " .. "V1.0",
    SubTitle = "Private script",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
	Scripts = Window:AddTab({ Title = "Scipts", Icon = "book" }),
	Player = Window:AddTab({ Title = "Player", Icon = "person-standing" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
	Debug = Window:AddTab({ Title = "Debug", Icon = "flag" })

}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Shx on top🦈",
		Content = "Welcome to Shx hub " .. game.Players.LocalPlayer.Name,
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.Player:AddParagraph({
        Title = "Control player's walkspeed jumpPower and abilities🌠",
        Content = "There are sliders that control player's walkspeed and jumpPower💡\nButton and toggle switch control player's and abilities🌌"
    })
	local Slider = Tabs.Player:AddSlider("Slider", {
        Title = "WalkSpeed",
        Description = "Change player's walkspeed",
        Default = 16,
        Min = 0,
        Max = 1000,
        Rounding = 1,
		Callback = function(Value)
			
			-- Get the local player
			local player = game.Players.LocalPlayer
			
			-- Ensure the player has a character
			if player and player.Character and player.Character:FindFirstChild("Humanoid") then
				-- Set the Humanoid's WalkSpeed to the slider value
				local humanoid = player.Character:FindFirstChild("Humanoid")
				humanoid.WalkSpeed = Value
			end
		end
		
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(16)

	local Slider2 = Tabs.Player:AddSlider("Slider2", {
        Title = "jumpPower",
        Description = "Change player's jumpPower",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
		Callback = function(Value)
			
			-- Get the local player
			local player = game.Players.LocalPlayer
			
			-- Ensure the player has a character
			if player and player.Character and player.Character:FindFirstChild("Humanoid") then
				-- Set the Humanoid's WalkSpeed to the slider value
				local humanoid = player.Character:FindFirstChild("Humanoid")
				humanoid.JumpPower = Value
			end
		end
		
    })

    Slider2:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider2:SetValue(50)

    Tabs.Main:AddParagraph({
        Title = "Hub by SHX",
        Content = "Private script🤫"
    })

    Tabs.Main:AddParagraph({
        Title = "Client status / Updates",
        Content = "Status: Updated 🟢\n" .. "Current version: V1.0\n" .. "Date: " .. os.date("%m/%d/%Y\n") .. "Script run at: " .. os.date("%H:%M:%S\n") .. "Local name: " .. (game.Players.LocalPlayer.Name)

    })

    Tabs.Scripts:AddParagraph({
        Title = "Script Hub",
        Content = "The Script Hub Tool is a centralized platform for creating, managing, and sharing scripts. It provides a user-friendly interface for users to discover, download, and install scripts created by others."
    })
    Tabs.Scripts:AddButton({
        Title = "Infinite Yield",
        Description = "Admin commands",
        Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

	Tabs.Scripts:AddButton({
        Title = "Tp tool",
        Description = "Use tool to tp",
        Callback = function()
			mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click Teleport"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
        end
    })

    Tabs.Scripts:AddButton({
        Title = "Replication Gui",
        Description = "F3X Replication Gui",
        Callback = function()
			loadstring(game:HttpGet(('https://pastebin.com/raw/zip7keHx'),true))()
        end
    })
    Tabs.Scripts:AddButton({
        Title = "Owl Hub",
        Description = "Owl Hub is a free Roblox script hub developed by Google Chrome and CriShoux.It currently has 30+ games. It is made to be executed on Roblox exploits.",
        Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
        end
    })
    Tabs.Scripts:AddButton({
        Title = "Ez Hub",
        Description = "Multi-game script hub with a beautifully made UI.",
        Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Ez%20Hub.txt"))()
        end
    })
    Tabs.Scripts:AddButton({
        Title = "Highlight Player",
        Description = "Places a selection box around the selected player.",
        Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Highlight%20Player.txt"))()
        end
    })
    Tabs.Scripts:AddButton({
        Title = "High Hips",
        Description = "Walk like normal, but a little taller.",
        Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/High%20Hips.txt"))()
        end
    })
    Tabs.Scripts:AddButton({
        Title = "Focus Anti-AFK",
        Description = "Even when you switch to another window, you will appear to be active.",
        Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/anti-afk%20via%20autofocus.txt"))()
        end
    })
    Tabs.Debug:AddButton({
        Title = "Open Dev Console",
        Description = "Open Dev Console for debugging",
        Callback = function()
game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)

        end
    })
	Tabs.Debug:AddButton({
        Title = "Dex Explorer",
        Description = "Open Dex Explorer", 
        Callback = function()
            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()

        end
    })
    Tabs.Main:AddButton({
        Title = "Credits",
        Description = "Credits of cool people",
        Callback = function()
            Window:Dialog({
                Title = "Credits",
                Content = "Gundam - Everything\nThanks for using my script😎",
                Buttons = {
                    {
                        Title = "Ok!",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Ok...,But cooler",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



	local UserInputService = game:GetService("UserInputService")

	-- Variable to track if infinite jump is enabled
	local isInfJumpEnabled = false
	
	-- Add a toggle to enable or disable infinite jump
	local Toggle = Tabs.Player:AddToggle("MyToggle", {Title = "Inf Jump (Hold to fly)",Discription = "Enable infinite jump", Default = false })
	
	Toggle:OnChanged(function()
		isInfJumpEnabled = Options.MyToggle.Value
		print("Toggle changed:", isInfJumpEnabled)
	end)
	Tabs.Player:AddButton({
        Title = "Remove display name",
        Description = "Remove evryone's display name",
        Callback = function()


			local Players = game:FindService("Players")

			require(game:GetService("Chat"):WaitForChild("ClientChatModules").ChatSettings).PlayerDisplayNamesEnabled = false
			
			local function rename(character,name)
				repeat task.wait() until character:FindFirstChildWhichIsA("Humanoid")
				character:FindFirstChildWhichIsA("Humanoid").DisplayName = name
			end
			
			for i,v in next, Players:GetPlayers() do
				if v.Character then
					v.DisplayName = v.Name
					rename(v.Character,v.Name)
				end
				v.CharacterAdded:Connect(function(char)
					rename(char,v.Name)
				end)
			end
			
			Players.PlayerAdded:Connect(function(plr)
				plr.DisplayName = plr.Name
				plr.CharacterAdded:Connect(function(char)
					rename(char,plr.Name)
				end)
			end)
			
			
        end
    })


	-- Function to handle infinite jump
	UserInputService.JumpRequest:Connect(function()
		if isInfJumpEnabled then
			local player = game.Players.LocalPlayer
			if player and player.Character and player.Character:FindFirstChild("Humanoid") then
				-- Allow the player to jump again
				player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)
	
	-- Set the initial value of the toggle
	Options.MyToggle:SetValue(false)





    local TColorpicker = Tabs.Debug:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("ShxScriptHub")
SaveManager:SetFolder("ShxScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

local success, error = pcall(function()
    -- your script code here
    print("loaded✅")
end)

if not success then
    Fluent:Notify({
        Title = "Shx hub🦈",
        Content = "Opps something went wrong😕. please try again later.",
        Duration = 8
    })
else
    Fluent:Notify({
        Title = "Shx hub🦈",
        Content = "The script has been loaded✅.",
        Duration = 8
    })
end


Window:SelectTab(2)



-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

