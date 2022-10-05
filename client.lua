TriggerEvent('chat:addSuggestion', '/911', 'Sends an emergency call to the local Police Department!', {
    { name="Nearest Postal", help="Example: 362" },
    { name="Call Description", help="Example: Shots fired by semi-auto firearm" }
})
TriggerEvent('chat:addSuggestion', '/panic', 'Press your panic button, sending a signal to all OnDuty Units!!', {
    { name="Postal/Street", help="Example: 362" },

})



RegisterCommand("911", function(source, args, playerpedinfo)
TriggerServerEvent("911:createCall",  GetPlayerServerId(), args, GetPlayerName(source))
local playerPos = GetEntityCoords(PlayerPedId())
TriggerServerEvent("911:setBlip", "911 Call", playerPos.x, playerPos.y, playerPos.z)
end, false)

