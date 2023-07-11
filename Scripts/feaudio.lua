local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
Library.DefaultColor = Color3.fromRGB(255,0,0)

Library:Notification({
    Text = "Pwred by AxiosHub",
    Duration = 10
})

wait (3)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
Library.DefaultColor = Color3.fromRGB(255,0,0)

Library:Notification({
    Text = "Credits to cmtoe and bruhban_ninja for helping a bit",
    Duration = 30
})


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FE Audio", "BloodTheme")

--Tab Settings!
local Main = Window:NewTab("Audio")
local Credits = Window:NewTab("Credits")
local Discord Link = Window:NewTab("Discord Link")
local MainSection = Main:NewSection("Audio section")
local CreditsSection = Credits:NewSection("Credits for helping")
local Discord LinkSection = Discord Link:NewSection("Join the discord for more Fe Scripts!")
local CreditsSection = Credits:NewSection("Credits to AxiosHub")
local CreditsSection = Discord Link:NewSection("https://discord.gg/")



MainSection:NewButton("One time sound", "All game sounds at onces(ONE TIME).", function()
        --Made by SuchShame
        print(game:GetService("SoundService").RespectFilteringEnabled)
        
        -- Get's every sound instance in workspace and play's it
        for _, sound in next, workspace:GetDescendants() do
        if sound:IsA("Sound") then
            sound:Play()
        end
        end 
end)
MainSection:NewButton("Loop Fe Audio", "loops in game sounds at onces!( CANNOT PAUSE )", function()
        -- Made by SuchSham
        while true do
            wait(0.7)
        -- Doesn't work if RespectFilteringEnabled is enabled in Console
        print(game:GetService("SoundService").RespectFilteringEnabled)
        
        -- Get's every sound instance in workspace and play's it
        for _, sound in next, workspace:GetDescendants() do
        if sound:IsA("Sound") then
            sound:Play()
        end
        end
        end
end)
