getgenv().SecureMode = true
local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
ArrayField:LoadConfiguration()
local Namecall
Namecall = hookmetamethod(game, '__namecall', function(self, ...)
   local Caller = tostring(getcallingscript())
   local Method = getnamecallmethod()
   
   if Caller == 'ClientMover' and Method == 'GetService' then
       return
   end
   
   return Namecall(self, ...)
end)
warn('[AxiosHub System]: This game is running without anti-cheat & autobypass!')


loadstring(game:HttpGet('https://raw.githubusercontent.com/123Lider321/AxiosHub/main/other/anti-cheat.lua?token=GHSAT0AAAAAACEPXP5NSHJWP7AZCTK3YFQMZFMU7SQ'))() --> AntiCheat


local Players = game:GetService("Players")

getgenv().HitboxSize = 15
getgenv().HitboxTransparency = 0.7

getgenv().HitboxStatus = false
getgenv().TeamCheck = false
getgenv().FriendCheck = false

getgenv().Walkspeed = 16
getgenv().Jumppower = 50

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Window = ArrayField:CreateWindow({
    Name = "Universal - AxiosHub",
    LoadingTitle = "AxiosHub Interface Suite",
    LoadingSubtitle = "by ReNever",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = ""
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "AxiosHub Interface Suite",
       Subtitle = "Key System",
       Note = "Paste the pastebin in your Browser and paste the key.",
       FileName = "Key System",
       SaveKey = true,
       GrabKeyFromSite = true,
       Actions = {
             [1] = {
                 Text = '--> The key is "." <--',
                 OnPress = function()
                     setclipboard("https://pastebin.com/raw/BrdBaVZV")
                 end,
                 }
             },
       Key = {"."}
    }
})
ArrayField:LoadConfiguration()

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 local MainTabb = Window:CreateTab("Home", 13926924240)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local PlayersTab = Window:CreateTab("Players", 13926883107)
local LocalPlayersSection = PlayersTab:CreateSection("Local Player",false)
local Input = PlayersTab:CreateInput({
    Name = "WalkSpeed",
    SectionParent = LocalPlayersSection,
    PlaceholderText = "Default: 16",
    NumbersOnly = true,
    CharacterLimit = 3,
    OnEnter = true,
    RemoveTextAfterFocusLost = true,
    Callback = function(value)
        getgenv().Walkspeed = value
        pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
        end)
    end,
})
local Input = PlayersTab:CreateInput({
    Name = "JumpPower",
    SectionParent = LocalPlayersSection,
    PlaceholderText = "Default: 50",
    NumbersOnly = true,
    CharacterLimit = 3,
    OnEnter = true,
    RemoveTextAfterFocusLost = true,
    Callback = function(value)
        getgenv().Jumppower = value
        pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
        end)
    end,
})
local Toggle = PlayersTab:CreateToggle({
   Name = "Loop WalkSpeed/JumpPower",
   SectionParent = LocalPlayersSection,
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(state)
    getgenv().loopWJ = state
    game:GetService("RunService").Heartbeat:Connect(function()
        if loopWJ == true then
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Jumppower
            end)
        end
    end)
   end,
})
local Input = PlayersTab:CreateInput({
    Name = "FOV",
    SectionParent = LocalPlayersSection,
    PlaceholderText = "Default: 70",
    NumbersOnly = true,
    CharacterLimit = 2,
    OnEnter = true,
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
    end,
})
local Button = PlayersTab:CreateButton({
    Name = "Fly",
    SectionParent = LocalPlayersSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/123Lider321/AxiosHub/main/Scripts/fly-script.lua?token=GHSAT0AAAAAACEPXP5MF5Q3SYYOCGLFPKGSZFMVJHA'))()
    end,
})
local Button = PlayersTab:CreateButton({
    Name = "NoClip",
    SectionParent = LocalPlayersSection,
    Interact = 'Execute',
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = 'Loaded';
            Text = "Keybind: 'e' ";
            Icon = "rbxassetid://2541869220";
            Duration = 7;
        })
        
        local StealthMode = false
        local Indicator
        if not StealthMode then
            local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
            Indicator = Instance.new("TextLabel", ScreenGui)
        end
        local noclip = false
        local player = game.Players.LocalPlayer
        local character = player.Character
        local mouse = player:GetMouse()
        mouse.KeyDown:Connect(function(key)
            if key == "e" then
                noclip = not noclip
            end
        end)
        while true do
            player = game.Players.LocalPlayer
            character = player.Character
            if noclip then
                for _, v in pairs(character:GetDescendants()) do
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end)
                end
            end
            game:GetService("RunService").Stepped:wait()
        end
    end,
})
local Toggle = PlayersTab:CreateToggle({
    Name = "Infinite Jump",
    SectionParent = LocalPlayersSection,
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(e)
        getgenv().InfJ = e
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfJ == true then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end,
})


local HitboxSection = PlayersTab:CreateSection("Hitbox Expander",false)
local Toggle = PlayersTab:CreateToggle({
    Name = "Hitbox",
    SectionParent = HitboxSection,
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(state)
        getgenv().HitboxStatus = state
        game:GetService('RunService').RenderStepped:connect(function()
            if HitboxStatus == true and TeamCheck == false and FriendCheck == false then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                            v.Character.HumanoidRootPart.Transparency = HitboxTransparency
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            elseif HitboxStatus == true and TeamCheck == false and FriendCheck == true then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    for i2,v2 in pairs(game:GetService('Players'):GetChildren()) do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name and not v2:IsFriendsWith(game:GetService('Players').LocalPlayer.UserId) then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                                v.Character.HumanoidRootPart.Transparency = HitboxTransparency
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                                v.Character.HumanoidRootPart.Material = "Neon"
                                v.Character.HumanoidRootPart.CanCollide = false
                            end)
                        end
                    end
                end
            elseif HitboxStatus == true and TeamCheck == true and FriendCheck == false then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if game:GetService('Players').LocalPlayer.Team ~= v.Team then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                            v.Character.HumanoidRootPart.Transparency = HitboxTransparency
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            elseif HitboxStatus == true and TeamCheck == true and FriendCheck == true then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if game:GetService('Players').LocalPlayer.Team ~= v.Team and not game:GetService('Players'):IsFriendsWith(UserId) then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                            v.Character.HumanoidRootPart.Transparency = HitboxTransparency
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            else
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
                            v.Character.HumanoidRootPart.Transparency = 1
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                            v.Character.HumanoidRootPart.Material = "Plastic"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end,
})
local Toggle = PlayersTab:CreateToggle({
    Name = "Team Check",
    SectionParent = HitboxSection,
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(state)
        getgenv().TeamCheck = state
    end,
})
local Slider1 = PlayersTab:CreateSlider({
    Name = "Hitbox Size (Slider)",
    SectionParent = HitboxSection,
    Range = {0, 99},
    Increment = 1,
    Suffix = "",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(value)
     getgenv().HitboxSize = value
    end,
})
local Input = PlayersTab:CreateInput({
     Name = "Hitbox Size (TextBox)",
     SectionParent = HitboxSection,
     PlaceholderText = "Type here!",
     NumbersOnly = true,
     CharacterLimit = 2,
     OnEnter = true,
     RemoveTextAfterFocusLost = true,
     Callback = function(value)
         getgenv().HitboxSize = value
         Slider1:Set(value)
     end,
})
local Input = PlayersTab:CreateInput({
     Name = "Hitbox Transparency",
     SectionParent = HitboxSection,
     PlaceholderText = "Default: 0.7",
     NumbersOnly = false,
     CharacterLimit = 3,
     OnEnter = true,
     RemoveTextAfterFocusLost = false,
     Callback = function(number)
         getgenv().HitboxTransparency = number
     end,
})



local ToolsSection = PlayersTab:CreateSection("Tools",false)
local Button = PlayersTab:CreateButton({
    Name = "Btools",
    SectionParent = ToolsSection,
    Interact = 'Execute',
    Callback = function()
        a = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        a.BinType = 2
        b = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        b.BinType = 3
        c = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        c.BinType = 4
    end,
})
local Button = PlayersTab:CreateButton({
    Name = "Teleport Tool",
    SectionParent = ToolsSection,
    Interact = 'Execute',
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
    end,
})


local ResetSection = PlayersTab:CreateSection("Reset",false)
local Button = PlayersTab:CreateButton({
  Name = "Normal Reset",
  SectionParent = ResetSection,
Interact = 'Execute',
  Callback = function()
    task.wait()

			game.Players.LocalPlayer.Character.Humanoid.Health = 0
  end,
})
local Button = PlayersTab:CreateButton({
  Name = "Hard Reset",
  SectionParent = ResetSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

		game.Players.LocalPlayer.Character.Humanoid.Torso:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.Torso:Destroy()

    task.wait(1.4)

       game.Players.LocalPlayer.Character.Humanoid.Health = 0

       game.Players.LocalPlayer.Character.Head:Remove()
  end,
})
local Button = PlayersTab:CreateButton({
  Name = "Harder Reset",
  SectionParent = ResetSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

	game.Players.LocalPlayer.Character.Humanoid.Torso:Destroy()
    game.Players.LocalPlayer.Character.Humanoid.LeftLeg:Destroy()
    game.Players.LocalPlayer.Character.Humanoid.RightLeg:Destroy()
    task.wait(1.4)

    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.Character.Head:Remove()
  end,
})


local ServerSection = PlayersTab:CreateSection("Server",false)
local Button = PlayersTab:CreateButton({
    Name = "Rejoin Server",
    SectionParent = ServerSection,
    Interact = 'Rejoin',
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end,
})
local Button = PlayersTab:CreateButton({
    Name = "ServerHop",
    SectionParent = ServerSection,
    Interact = 'Hop',
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local AnimationsTab = Window:CreateTab("Animations", 12308581351)
local Animationr15Section = AnimationsTab:CreateSection("R15", false)
local Button = AnimationsTab:CreateButton({
    Name = "Zombie",
    SectionParent = Animationr15Section,
    Interact = 'Execute',
    Callback = function()
        task.wait()
		local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        game.Players.LocalPlayer.Character.Humanoid.Jump = false
    end,
})
local Button = AnimationsTab:CreateButton({
    Name = "Free Emotes",
    SectionParent = Animationr15Section,
    Interact = 'Execute',
    Callback = function()
        ArrayField:Notify({
            Title = "Keybind",
            Content = "Keybind is comma (,)",
            Duration = 6.5,
            Image = 4483362458,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Aight",
                  Callback = function()
                  
               end
            },
         },
         })
      
          task.wait()
          --keybind to open is comma
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()
    end,
})


local Animationr6Section = AnimationsTab:CreateSection("R6", false)
local Button = AnimationsTab:CreateButton({
    Name = "Rare Animation GUI",
    SectionParent = Animationr6Section,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/EQE58hq3'))()
    end,
})
local Button = AnimationsTab:CreateButton({
    Name = "Energize",
    SectionParent = Animationr6Section,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/0MLPL32f'))()
    end,
})
local Button = AnimationsTab:CreateButton({
    Name = "Animation GUI",
    SectionParent = Animationr6Section,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/LKkeshi/Scripts/main/FE%20R6%20Animation%20GUI'))()
    end,
})


local Animationr615Section = AnimationsTab:CreateSection("R15/R6", false)
local Button = AnimationsTab:CreateButton({
    Name = "Energizer (Remake) Animation GUI",
    SectionParent = Animationr615Section,
    Interact = 'Execute',
    Callback = function()
        
    end,
})
local Button = AnimationsTab:CreateButton({
    Name = "Back Flip",
    SectionParent = Animationr615Section,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/aGjYRz57"))()
       task.wait(1)

       ArrayField:Notify({
        Title = "Keybinds",
        Content = "Keybinds: x, c, z ",
        Duration = 6.5,
        Image = 4483362458,
        Actions = { 
           Ignore = {
              Name = "Aight",
              Callback = function()
              
           end
        },
     },
     })

    end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local HubsGuisTab = Window:CreateTab("Hubs/Guis", 13926923069)
local HubsSection = HubsGuisTab:CreateSection("Has supported games",false)
local Button = HubsGuisTab:CreateButton({
    Name = "Owl Hub",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "V.G Hub",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Unfair Hub",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Fe Audio (May Contain Bugs)",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/123Lider321/AxiosHub/main/Scripts/feaudio.lua?token=GHSAT0AAAAAACEPXP5MBYZSXLMOALVXKXTWZFMVPTQ"))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Ice Hub",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet(""))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "EZ Hub",
    SectionParent = HubsSection,
    Interact = 'Execute',
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
    end,
})


local AdminSection = HubsGuisTab:CreateSection("Admin",false)
local Button = HubsGuisTab:CreateButton({
  Name = "Infinite Yield",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Nameless Admin",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Domain X",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "CMD-X",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Fates-Admin",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Reviz-Admin V2",
  SectionParent = AdminSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()
		loadstring(game:HttpGet("https://pastebin.com/raw/xzX6BR0B"))()
  end,
})


local WorkinallgamesSection = HubsGuisTab:CreateSection("Works in all games")
local Button = HubsGuisTab:CreateButton({
  Name = "c00lkidd GUI reborn",
  SectionParent = WorkinallgamesSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

		loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
  end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Rice Anti-Afk",
    Interact = 'Execute',
    SectionParent = WorkinallgamesSection,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/123Lider321/AxiosHub/main/Scripts/rice-antiafk?token=GHSAT0AAAAAACEPXP5NSL36MWWOVVPSQO3AZFMVK6A"))()
    end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Script Searcher",
  SectionParent = WorkinallgamesSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
  end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Chat Bypass",
    Interact = 'Execute',
    SectionParent = WorkinallgamesSection,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/additional/betterbypasser", true))({
            Method = 1, -- Method 1 is the main method. Method two is emojis. Method 3 is full transparency, no special symbols. Method 3 has been improved!
            Keybind = "F", -- Usually defaulted to F. You can change this keybind by replacing the string with a letter. Works for uppercase and lowercase.
            ShowMethodDictionary = true -- Shows you the full list of words that you can say with the method. Press FN + F9 to see this dictionary.
        })
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Chat Hax",
    Interact = 'Execute',
    SectionParent = WorkinallgamesSection,
    Callback = function()
        loadstring(game:HttpGet(''))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Chat Spy",
    Interact = 'Execute',
    SectionParent = WorkinallgamesSection,
    Callback = function()
        loadstring(game:HttpGet(''))()
    end,
})


local UtilityHubsSection = HubsGuisTab:CreateSection("Utility", false)
local Button = HubsGuisTab:CreateButton({
    Name = "Universal Aimbot",
    Interact = 'Execute',
    SectionParent = UtilityHubsSection,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Universal ESP",
    Interact = 'Execute',
    SectionParent = UtilityHubsSection,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua',true))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "Invisibility Gui",
    Interact = 'Execute',
    SectionParent = UtilityHubsSection,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./5ae3ebb4f7e412eecd3fadce93abde6f3b1dd8e3/Small%20version'))()
    end,
})
local Button = HubsGuisTab:CreateButton({
    Name = "NX> c",
    Interact = 'Execute',
    SectionParent = UtilityHubsSection,
    Callback = function()
        loadstring(game:HttpGet(''))()
    end,
})


local ScriptingHubSection = HubsGuisTab:CreateSection("Scripting",false)
local Button = HubsGuisTab:CreateButton({
    Name = "DarkDex v5",
    Interact = 'Execute',
    SectionParent = ScriptingHubSection,
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4"))()
    end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "SimplySpy V3",
  SectionParent = ScriptingHubSection,
  Interact = 'Execute',
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
  end,
})
local Button = HubsGuisTab:CreateButton({
  Name = "Remote Spy V2",
  SectionParent = ScriptingHubSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/123Lider321/AxiosHub/main/Scripts/simplespy.lua?token=GHSAT0AAAAAACEPXP5M5R4UREHBQVV6ORRAZFMVRFA"))()
  end,
})


local ExecutorSection = HubsGuisTab:CreateSection("Executor",false)
local Button = HubsGuisTab:CreateButton({
  Name = "Synapse x",
  SectionParent = ExecutorSection,
  Interact = 'Execute',
  Callback = function()
    task.wait()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
  end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local GameListTab = Window:CreateTab("GamesList", 12308581351)
local ZombieRushSection = GameListTab:CreateSection("Zombie Rush", false)
local Button = GameListTab:CreateButton({
    Name = "Teleport to Zombie Rush",
    SectionParent = ZombieRushSection,
    Interact = 'Teleport',
    Callback = function()
        game:GetService("TeleportService"):Teleport(137885680)
    end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local CreditsTab = Window:CreateTab("Credits", 13926826453)
local CreditsSection = CreditsTab:CreateSection("Credits",false)
local Paragraph = CreditsTab:CreateParagraph({Title = "Owner & Scripter:", Content = "The entire AxiosHub was created by ReNever, except for some scripts contained in the Hub."},CreditsSection)
local Paragraph = CreditsTab:CreateParagraph({Title = "UI LIbrary:", Content = "The library that AxiosHub uses is ArrayField, rewritten by Arrays."},CreditsSection)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
