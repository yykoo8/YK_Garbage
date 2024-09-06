ESX = exports["es_extended"]:getSharedObject()
local searchedDumpsters = {}

local function YK_HuumeVaikutus()
    AnimpostfxPlay("DrugsDrivingOut", 0, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
    
    SetTimeout(60000, function()
        AnimpostfxStop("DrugsDrivingOut")
        StopGameplayCamShaking(true)
    end)
end

exports.ox_target:addModel({
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_3a',
    'prop_dumpster_4a',
    'prop_dumpster_4b'
}, {
    {
        name = 'YK_Dyykkaus',
        icon = 'fas fa-search',
        label = 'Search',
        onSelect = function(data)
            local dumpsterId = data.entity

            if searchedDumpsters[dumpsterId] then
                lib.notify({
                    title = 'Dumpster',
                    description = 'this garbage has already been searched',
                    type = 'error'
                })
                return
            end

            if lib.skillCheck({'easy', 'easy', 'easy', 'easy'}, {'1', '2', '3', '4'}) then
                TriggerServerEvent('YK_AnnaKamaa')

                if math.random() < YK.Config.DrugNeedleChance then
                    lib.notify({
                        title = 'OOPS',
                        description = 'You hit a needle',
                        type = 'error'
                    })
                    YK_HuumeVaikutus()
                end

                searchedDumpsters[dumpsterId] = true
                SetTimeout(YK.Config.CooldownTime, function()
                    searchedDumpsters[dumpsterId] = nil
                end)
            else
                lib.notify({
                    title = 'Dumpster',
                    description = 'You didnt find anything',
                    type = 'error'
                })
            end
        end
    }
})
