CodeUnity_BuyIllegalItems = {
    Utils = {},
    NPC_List = {},
    Camera_List = {}
}

CodeUnity_BuyIllegalItems.Utils.RegisterNetEvent = function (...)
    RegisterNetEvent(...)
end

CodeUnity_BuyIllegalItems.Utils.TriggerServerEvent = function (...)
    TriggerServerEvent(...)
end

CodeUnity_BuyIllegalItems.Utils.TriggerEvent = function (...)
    TriggerEvent(...)
end

CodeUnity_BuyIllegalItems.Utils.CreateNPC = function (modello,coordinate,nome)
    local modello = GetHashKey(modello)
    RequestModel(modello)
    while not HasModelLoaded(modello) do
        RequestModel(modello)
         Citizen.Wait(1)
    end
    local npc = CreatePed(4, modello, coordinate[1], coordinate[2], coordinate[3], coordinate[4], false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    CodeUnity_BuyIllegalItems.NPC_List[nome] = npc
    return npc
end

CodeUnity_BuyIllegalItems.Utils.GiveBackNPC = function (nome)
    return CodeUnity_BuyIllegalItems.NPC_List[nome]
end

CodeUnity_BuyIllegalItems.CreateCamera = function (nome,coords)
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", vec3(coords[1], coords[2], coords[3]))
    SetCamCoord(camera, vec3(coords[1], coords[2], coords[3]))
    SetCamRot(camera, 0.0, 0.0, coords[4])
    SetCamActive(camera, true)
    RenderScriptCams(true, false, 2000, true, true)
    CodeUnity_BuyIllegalItems.Camera_List[nome] = camera
end

CodeUnity_BuyIllegalItems.DeleteCamera = function (nome)
    local camera = CodeUnity_BuyIllegalItems.Camera_List[nome]
    if camera then
        RenderScriptCams(false, false, 2000, true, true)
        DestroyCam(camera, false)
        CodeUnity_BuyIllegalItems.Camera_List[nome] = nil
    end
end

CodeUnity_BuyIllegalItems.AnimStart = function(player, animationDict, animationName)
    RequestAnimDict(animationDict)

    while not HasAnimDictLoaded(animationDict) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(player, animationDict, animationName, 8.0, -8.0, -1, 49, 0, false, false, false)
end

