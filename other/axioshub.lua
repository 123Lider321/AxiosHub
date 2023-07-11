local RobloxGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

loadstring(game:HttpGet('https://raw.githubusercontent.com/123Lider321/AxiosHub/main/other/anti-cheat.lua'))() --> AntiCheat loadstring.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Obtén el ID del juego
local gameId = game.PlaceId

-- Crea la tabla de IDs de juegos y URLs
local gameUrlMap = {
    [137885680] = "https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub",  -- Zombie Rush.
}

-- Verifica si el ID del juego está en la tabla
local gameUrl = gameUrlMap[gameId]

-- Si el ID del juego está en la tabla, carga el contenido del URL asociado
local gameInList = false
for i, v in pairs(gameUrlMap) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(gameUrl, true))()
        gameInList = true
        break
    end
end

if not gameInList then
    getgenv().SecureMode = true
    local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Window = ArrayField:CreateWindow({
    Name = RobloxGame,
    LoadingTitle = "AxiosHub Interface Suite",
    LoadingSubtitle = "by ReNever",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "AxiosHubautosave"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
       Title = "AxiosHub Interface Suite",
       Subtitle = "Key System",
       Note = "Paste the pastebin in your Browser and copy the key.",
       FileName = "AxiosHubKey",
       SaveKey = true,
       GrabKeyFromSite = true,
       Actions = {
             [1] = {
                 Text = '--> Click here to copy the key link <--',
                 OnPress = function()
                     setclipboard("https://pastebin.com/raw/BrdBaVZV")
                 end,
                 }
             },
       Key = {"."}
    }
})
ArrayField:Notify({
    Title = "AxiosHub System",
    Content = "We don't support this game yet :(, do you want to load the universal script?",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
        Yes = {
            Name = "Yes",
            Callback = function()
            local secondUrl = "https://raw.githubusercontent.com/123Lider321/AxiosHub/main/other/main.lua"--> Main AxiosHub loadstring.
                		loadstring(game:HttpGet(secondUrl, true))()
        end
        },
        No = {
            Name = "No",
            Callback = function()
                ArrayField:Destroy()
        end
    },
  },
})
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

