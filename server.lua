ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('YK_AnnaKamaa')
AddEventHandler('YK_AnnaKamaa', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if math.random(1, 2) == 1 then
        local randomItem = YK.Config.DumpsterLoot[math.random(1, #YK.Config.DumpsterLoot)]
        xPlayer.addInventoryItem(randomItem, 1)
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Dumpster',
            description = 'You found ' .. randomItem,
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Dumpster',
            description = 'You didnt find anything',
            type = 'error'
        })
    end
end)
