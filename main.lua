local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
    Title = "Shx HUB🦈 [Loaded]",
    Content = "[✅Get key or enter your key]",
    Duration = 8 -- The script runs in a different game
})



local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "73432b04b36540cda570b6217182db0f"
local falseData = "cca2c08106ba4f938203e4b6f9d0208f"

KeyGuardLibrary.Set({
  publicToken = "ef7caa315cfb447f89454918d1f8f9df",
  privateToken = "35c5dcfbacab44ccb349ffa2bd0ab821",
  trueData = trueData,
  falseData = falseData,
})


local key = ""

local Window = Fluent:CreateWindow({
    Title = "Key System",
    SubTitle = "Shxhub",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
    Title = "Enter Key",
    Description = "Enter Key Here",
    Default = "",
    Placeholder = "Enter key…",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        key = Value
    end
})

local Checkkey = Tabs.KeySys:AddButton({
    Title = "Check Key",
    Description = "Enter Key before pressing this button",
    Callback = function()
        local response = KeyGuardLibrary.validateDefaultKey(key)
        if response == trueData then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GundamNarawit/ShxHub/refs/heads/main/Loader.lua"))()
           -- Your code here
        else
            Fluent:Notify({
                Title = "Shx HUB🦈 [invalid key🛑]",
                Content = "[🛑Error key not found]",
                Duration = 8 -- The script runs in a different game
            })
        end
    end
})
local fischPlaceId = 16732694052
local bloxfruitPlaceIds = {2753915549, 4442272183, 7449423635}
local Checkkey = Tabs.KeySys:AddButton({
    Title = "Check Key (Premium)",
    Description = "Enter Key before pressing this button (Premium)",
    Callback = function()
        local response = KeyGuardLibrary.validatePremiumKey(key)
        if response == trueData then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GundamNarawit/ShxHub/refs/heads/main/Loader.lua"))()
           -- Your code here
        else
            Fluent:Notify({
                Title = "Shx HUB🦈 [invalid key🛑]",
                Content = "[🛑Error key not found]",
                Duration = 8 -- The script runs in a different game
            })
        end
    end
})
local Getkey = Tabs.KeySys:AddButton({
    Title = "Get Key",
    Description = "Get Key here",
    Callback = function()
       setclipboard(KeyGuardLibrary.getLink())
    end
})


Window:SelectTab(1)
