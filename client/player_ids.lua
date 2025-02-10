--[[
  ____    ___  __     __  _____   ____      ____    _____  __     __  _____   _        ___    ____    __  __   _____   _   _   _____ 
 |  _ \  |_ _| \ \   / / | ____| |  _ \    |  _ \  | ____| \ \   / / | ____| | |      / _ \  |  _ \  |  \/  | | ____| | \ | | |_   _|
 | |_) |  | |   \ \ / /  |  _|   | |_) |   | | | | |  _|    \ \ / /  |  _|   | |     | | | | | |_) | | |\/| | |  _|   |  \| |   | |  
 |  _ <   | |    \ V /   | |___  |  _ <    | |_| | | |___    \ V /   | |___  | |___  | |_| | |  __/  | |  | | | |___  | |\  |   | |  
 |_| \_\ |___|    \_/    |_____| |_| \_\   |____/  |_____|    \_/    |_____| |_____|  \___/  |_|     |_|  |_| |_____| |_| \_|   |_|  
                                                                                                                                     
]]

if GetCurrentResourceName() == "river-playerids" then

local displayIDs = false
local radius = RiverDev.Config.Radius
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("toggleIDs", function()
    displayIDs = not displayIDs
    
    if displayIDs then
        if RiverDev.Config.QBCoreNotis then
            QBCore.Functions.Notify("Player IDs Enabled", "success")
        else
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^1^*SYSTEM", "Player IDs Enabled"}
            })
        end
    else
        if RiverDev.Config.QBCoreNotis then
            QBCore.Functions.Notify("Player IDs Disabled", "error")
        else
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^1^*SYSTEM", "Player IDs Disabled"}
            })
        end
    end
end, false)

RegisterKeyMapping("toggleIDs", "Toggle Player IDs", "keyboard", RiverDev.Config.Keybind)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if displayIDs then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, player in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(player)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < radius then
                        local playerId = GetPlayerServerId(player)
                        DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, "~w~ID: ~b~" .. playerId .. "")
                    end
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.42, 0.42)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
end