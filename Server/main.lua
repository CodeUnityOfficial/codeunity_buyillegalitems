ESX.RegisterServerCallback('CodeUnity:BuyItems', function(source, cb, data, plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        cb(false)
        return
    end

    local total = 0

    for _, value in pairs(data) do
        total = total + value.price * value.quantity
    end

    local currencyType = CodeUnity_BuyIllegalItems_Cfg.Black_Money and 'black_money' or 'money'

    if xPlayer.getAccount(currencyType).money >= total then
        xPlayer.removeAccountMoney(currencyType, total)
        CodeUnity_BuyIllegalItems_Cfg.Notify('Server', CodeUnity_BuyIllegalItems_Cfg.Lang[CodeUnity_BuyIllegalItems_Cfg.Language]['Payment_Success'], xPlayer.source)

        for _, value in pairs(data) do
            exports.ox_inventory:AddItem('trunk' .. plate, value.item, value.quantity)
        end

        cb(true)
    else
        CodeUnity_BuyIllegalItems_Cfg.Notify('Server', CodeUnity_BuyIllegalItems_Cfg.Lang[CodeUnity_BuyIllegalItems_Cfg.Language]['Payment_Failure'], xPlayer.source)
        cb(false)
    end
end)
