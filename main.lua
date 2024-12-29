local allowedValues = { "A5ZSwC9dIW", "xSXwYA67Ql", "DHu1sNhIdy", "Bn8U8plGkb", "r2B5Dxm1ou"}
local Version = "1.0.1"

-- Initialize a flag to check if the script has already been run
local scriptRunFlag = false

--loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Version " .. Version ,"You're updated✅",
    SubTitle = "by Sharky_DEV",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when there's no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Keys", Icon = "key" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Input = Tabs.Main:AddInput("Input", {
    Title = "Keys",
    Placeholder = "Key here",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        print("Input changed:", Value)
    end
})

-- Track if error has been notified
local errorNotified = false

Input:OnChanged(function()
    print("Input updated:", Input.Value)


    if table.find(allowedValues, Input.Value) then
        if scriptRunFlag then
            Fluent:Notify({
                Title = "Sharky HUB🦈",
                Content = "Script runned.",
                Duration = 8
            })
            return -- Exit early if the script has already been run
        end

        local fischPlaceId = 16732694052
        local bloxfruitPlaceIds = {2753915549, 4442272183, 7449423635}

        if game.PlaceId == fischPlaceId then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() -- The script runs in the game called "Fisch"
            Fluent:Notify({
                Title = "Sharky HUB🦈 [Fisch🐟🎣]",
                Content = "loading script for " .. Input.Value,
                Duration = 8
            })
            errorNotified = false -- Reset error flag
            scriptRunFlag = true -- Set the flag to indicate the script has run
        else
            if not errorNotified then
                Fluent:Notify({
                    Title = "Sharky HUB🦈 [🛑Error game not supported]",
                    Content = "[🛑Error game not supported]",
                    Duration = 8 -- The script runs in a different game
                })
                errorNotified = true -- Set error flag
            end
        end

        -- Function to check if the current Place ID is in the list
        local function IsbloxfruitPlaceIds()
            for _, id in ipairs(bloxfruitPlaceIds) do
                if game.PlaceId == id then
                    return true
                end
            end
            return false
        end

        -- Check the current Place ID and print a message
        if IsbloxfruitPlaceIds() then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
            Fluent:Notify({
                Title = "Sharky HUB🦈 [BloxFruits🍇]",
                Content = "loading script for " .. Input.Value,
                Duration = 8
            })
            errorNotified = false -- Reset error flag
            scriptRunFlag = true -- Set the flag to indicate the script has run
        else
            if not errorNotified then
                Fluent:Notify({
                    Title = "Sharky HUB🦈 [🛑Error game not supported]",
                    Content = "[🛑Error game not supported]",
                    Duration = 8 -- The script runs in a different game
                })
                errorNotified = true -- Set error flag
            end
        end
    end
end)

local CurrentId = game.PlaceId -- Current game ID
local ServerStartTime = tick() -- The time the server started
local PlayerCount = #game.Players:GetPlayers() -- Number of players in the server
local PlayerName = game.Players.LocalPlayer.Name -- The player's name

-- Function to calculate server uptime
local function getServerUptime()
    local uptime = tick() - ServerStartTime
    local minutes = math.floor(uptime / 60)
    local seconds = math.floor(uptime % 60)
    return string.format("%02d:%02d", minutes, seconds)
end

-- Function to check if the game is supported
local function isGameSupported()
    local supportedPlaceIds = {16732694052, 2753915549, 4442272183, 7449423635} -- Add supported Place IDs here
    for _, id in ipairs(supportedPlaceIds) do
        if game.PlaceId == id then
            return true
        end
    end
    return false
end

-- Adding the paragraph with the game info
Tabs.Main:AddParagraph({
    Title = "Game Info",
    Content = "Current game ID: " .. CurrentId ..
             "\nServer uptime: " .. getServerUptime() ..
             "\nPlayers in server: " .. PlayerCount ..
             "\nPlayer Name: " .. PlayerName ..
             "\nStatus: " .. (isGameSupported() and "SUPPORTED✅" or "NOT SUPPORTED🛑")
})
Fluent:Notify({
    Title = "Sharky HUB🦈",
    Content = "✅ The script has been loaded.",
    Duration = 8
})
Window:SelectTab(1)
Window:SelectTab(1)
Window:SelectTab(1)
Window:SelectTab(1)
