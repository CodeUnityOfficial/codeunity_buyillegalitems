CodeUnity_BuyIllegalItems_Cfg = {}

CodeUnity_BuyIllegalItems_Cfg.NPC = {
    name = 'Morrey',
    coords = vec4(-425.024170, -1700.043945, 18.085693, 56.692913),
    model = 'g_m_y_ballaorig_01',
    cam_coords = vec4(-424.681305, -1697.512085, 19.052002, 158.740158),
    Dialogues = {
        ['en'] = {
            [1] = {
                NPC = 'Hey man, what do you want from me?',
                PLAYER = 'I was told that you.. do things...'
            },
            [2] = {
                NPC = 'What I do?',
                PLAYER = 'Well man now I know clearly, do you sell illegal items?'
            },
            [3] = {
                NPC = 'Of course, keep the list'
            },
        }
    }
}

CodeUnity_BuyIllegalItems_Cfg.Black_Money = false

CodeUnity_BuyIllegalItems_Cfg.Items = {
    {name = 'PISTOL 9MM', item = 'weapon_pistol', price = 400},
    {name = 'COMBAT PISTOL', item = 'weapon_combatpistol', price = 200},
    {name = 'CARBINE RIFLE', item = 'weapon_carbinerifle', price = 800},
    {name = 'AMMO 9MM', item = 'ammo-9', price = 5},
}

CodeUnity_BuyIllegalItems_Cfg.Language = 'en'

CodeUnity_BuyIllegalItems_Cfg.Vehicle = {
    Vehicle_Name = 'rumpo3',
    Spawn_Coords = vec4(-416.650543, -1713.428589, 19.506958, 252.283463)
}

CodeUnity_BuyIllegalItems_Cfg.Lang = {
    ['en'] = {
        ['Interact_Npc'] = 'Talk to %s',
        ['Quantity'] = 'Quantity: ',
        ['Position_Occupied'] = 'There is another vehicle at the spawn location',
        ['Payment_Success'] = 'You have successfully purchased the items, you find them in the trunk!',
        ['Payment_Failure'] = 'You don\'t have enough money to afford these items',
    }
}

CodeUnity_BuyIllegalItems_Cfg.Notify = function (SIDE, MSG, src)
    if SIDE == 'Client' then
        ESX.ShowNotification(MSG)
    else
        TriggerClientEvent('esx:showNotification', src, MSG)
    end
end
