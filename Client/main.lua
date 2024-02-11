Citizen.CreateThread(function ()
    if CodeUnity_BuyIllegalItems_Cfg.NPC.coords then
        local npc = CodeUnity_BuyIllegalItems.Utils.CreateNPC(CodeUnity_BuyIllegalItems_Cfg.NPC.model, CodeUnity_BuyIllegalItems_Cfg.NPC.coords, CodeUnity_BuyIllegalItems_Cfg.NPC.name)
        
        exports.ox_target:addLocalEntity(npc, 
        {
            {
                label = string.format(CodeUnity_BuyIllegalItems_Cfg.Lang[CodeUnity_BuyIllegalItems_Cfg.Language]['Interact_Npc'], CodeUnity_BuyIllegalItems_Cfg.NPC['name']),
                name = 'Talk_To_NPC',
                icon = 'fa-solid fa-microphone-lines',
                event = 'CodeUnity:**:Talk_To_NPC'
            }
        })
    end
end)

CodeUnity_BuyIllegalItems.Utils.RequestDialog = function (Count, callback)
    local Quantity = nil

    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dialog_illegal_items', {
        title = CodeUnity_BuyIllegalItems_Cfg.Lang[CodeUnity_BuyIllegalItems_Cfg.Language]['Quantity']..' '..CodeUnity_BuyIllegalItems_Cfg.Items[Count]['name']..' | '..CodeUnity_BuyIllegalItems_Cfg.Items[Count]['price']
    }, function (data, menu)
        local inputValue = tonumber(data.value)

        if inputValue ~= nil then
            Quantity = inputValue
        else
            Quantity = 0
        end

        menu.close()
        callback(Quantity, CodeUnity_BuyIllegalItems_Cfg.Items[Count]['item'], CodeUnity_BuyIllegalItems_Cfg.Items[Count]['price'])
    end, function (data, menu)
        Quantity = 0
        menu.close()
        callback(Quantity, CodeUnity_BuyIllegalItems_Cfg.Items[Count]['item'], CodeUnity_BuyIllegalItems_Cfg.Items[Count]['price'])
    end)
end


CodeUnity_BuyIllegalItems.Utils.RegisterNetEvent('CodeUnity:**:Talk_To_NPC', function ()
    local npc = CodeUnity_BuyIllegalItems.Utils.GiveBackNPC(CodeUnity_BuyIllegalItems_Cfg.NPC.name)
    CodeUnity_BuyIllegalItems.CreateCamera(CodeUnity_BuyIllegalItems_Cfg.NPC.name, CodeUnity_BuyIllegalItems_Cfg.NPC.cam_coords)
    FreezeEntityPosition(PlayerPedId(), true)
    CodeUnity_BuyIllegalItems.AnimStart(PlayerPedId(), "amb@world_human_cop_idles@male@idle_b", "idle_d")
    CodeUnity_BuyIllegalItems.AnimStart(npc, "misscarsteal4@actor", "actor_berating_loop")
    local dialoguesCount = 0

    for _, languageDialogues in pairs(CodeUnity_BuyIllegalItems_Cfg.NPC.Dialogues) do
        for _, _ in pairs(languageDialogues) do
            dialoguesCount = dialoguesCount + 1
        end
    end

    local function drawDialogue(text, speaker)
        SetTextFont(0)
        SetTextScale(0.5, 0.5)
        SetTextColour(255, 255, 255, 255)
        SetTextCentre(true)
        SetTextEntry("STRING")
        AddTextComponentString("~r~" .. speaker .. ": ~s~" .. text)
        DrawText(0.5, 0.95)
    end

    local i = 1
    local timer = 0
    
    while i <= dialoguesCount do
        local dialogue = CodeUnity_BuyIllegalItems_Cfg.NPC['Dialogues'][CodeUnity_BuyIllegalItems_Cfg.Language][i]
        if dialogue['NPC'] and timer <= 1200 then
            drawDialogue(dialogue['NPC'], CodeUnity_BuyIllegalItems_Cfg.NPC['name'])
        end
    
        if dialogue['PLAYER'] and timer >= 1200 then
            drawDialogue(dialogue['PLAYER'], 'YOU')
        end        
    
        timer = timer + 1
    
        if (timer >= 2400) or (i == dialoguesCount and timer >= 1200) then
            i = i + 1
            timer = 0
        end
    
        Wait(1)
    end

    ClearPedTasksImmediately(PlayerPedId())
    ClearPedTasksImmediately(npc)

    CodeUnity_BuyIllegalItems.DeleteCamera(CodeUnity_BuyIllegalItems_Cfg.NPC.name)
    FreezeEntityPosition(PlayerPedId(), false)
    local itemCount = 0
    for _, item in pairs(CodeUnity_BuyIllegalItems_Cfg.Items) do
        itemCount = itemCount + 1
    end

    local data = {}

    local b = 1
    local done = false
    while b <= itemCount do
        if not done then
            done = true
            CodeUnity_BuyIllegalItems.Utils.RequestDialog(b, function(quantity, itemName, price)
                table.insert(data, {item = itemName, quantity = quantity, price = price})
                b = b + 1
                done = false
            end)
        end
        Wait(1000)
    end

    local vehicleName = CodeUnity_BuyIllegalItems_Cfg.Vehicle.Vehicle_Name
    local spawnCoords = CodeUnity_BuyIllegalItems_Cfg.Vehicle.Spawn_Coords
    local isVehicleOccupied = false
    
    local vehicles = ESX.Game.GetVehiclesInArea(spawnCoords, 5.0)
    
    if #vehicles > 0 then
        isVehicleOccupied = true
    else
        ESX.Game.SpawnVehicle(vehicleName, spawnCoords, spawnCoords.w, function(vehicle)
            SetVehicleDoorsLocked(vehicle, 2)
            PlayVehicleDoorCloseSound(vehicle, 1)
            ESX.TriggerServerCallback('CodeUnity:BuyItems', function(fatto)
                if fatto then
                    SetVehicleDoorsLocked(vehicle, 1)
                    PlayVehicleDoorOpenSound(vehicle, 0)    
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                else
                    DeleteVehicle(vehicle)
                end
            end, data, GetVehicleNumberPlateText(vehicle))
        end)
    end
    
    if isVehicleOccupied then
        CodeUnity_BuyIllegalItems_Cfg.Notify('Client', CodeUnity_BuyIllegalItems_Cfg.Lang[CodeUnity_BuyIllegalItems_Cfg.Language]['Position_Occupied'])
    end    
end)
