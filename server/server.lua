--[[
  ____    ___  __     __  _____   ____      ____    _____  __     __  _____   _        ___    ____    __  __   _____   _   _   _____ 
 |  _ \  |_ _| \ \   / / | ____| |  _ \    |  _ \  | ____| \ \   / / | ____| | |      / _ \  |  _ \  |  \/  | | ____| | \ | | |_   _|
 | |_) |  | |   \ \ / /  |  _|   | |_) |   | | | | |  _|    \ \ / /  |  _|   | |     | | | | | |_) | | |\/| | |  _|   |  \| |   | |  
 |  _ <   | |    \ V /   | |___  |  _ <    | |_| | | |___    \ V /   | |___  | |___  | |_| | |  __/  | |  | | | |___  | |\  |   | |  
 |_| \_\ |___|    \_/    |_____| |_| \_\   |____/  |_____|    \_/    |_____| |_____|  \___/  |_|     |_|  |_| |_____| |_| \_|   |_|  
                                                                                                                                     
]]

if GetCurrentResourceName() == "river-playerids" then
    CreateThread(function()
        Wait(5000)
        print("^3river-playerids^0 resource validated ^2successfully^0! Made by ^1ThompsonJS^0")
    end)
else
    CreateThread(function()
        Wait(5000)
        print("[^1DEBUG^0] Please make sure the resource is called ^1river-playerids^0 otherwise it will not work") 
    end)
end