repeat wait() until game:IsLoaded()
if game:GetService("CoreGui"):FindFirstChild("sjorlib") then return end
getgenv().error = function() end


if not isfolder("Shitware") then
    makefolder("Shitware")
end
if not isfolder("Shitware/"..tostring(game.GameId)) then
    makefolder("Shitware/"..tostring(game.GameId))
end

local library,menu,tabholder = loadstring(game:HttpGet("https://raw.githubusercontent.com/KnownUnknown420/Phantom-Forces/main/Shitware/Library.lua"))()

--Config
local configTab = library:addTab("Config")
local configGroup = configTab:createGroup(0)
configGroup:addColorpicker({text = "Menu Accent",flag = "menu_accent",ontop = true,color = Color3.fromRGB(100,60,80),callback = function(val)
    for i,v in next, tabholder:GetDescendants() do
        pcall(function()
            if v.Name ~= "dontchange" and v.BackgroundColor3 == library.libColor then
                v.BackgroundColor3 = val
            end
        end)
    end
    library.libColor = val
end})
configGroup:addList({text = "Config",flag = "selected_config",skipflag = true,values = {}})
configGroup:addTextbox({text = "config name",flag = "config_name"})
configGroup:addButton({text = "Save Config",callback = library.saveConfig})
configGroup:addButton({text = "Load Config",callback = library.loadConfig})
configGroup:addButton({text = "Delete Config",callback = library.deleteConfig})
configGroup:addButton({text = "Refresh Configs",callback = library.refreshConfigs})
library:refreshConfigs()


