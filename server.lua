--[[
───────────────────────────────────────────────────────────────

	OnDuty911 (server.lua) - Created by Obliviox
	     Current Version: v0.2.0B (10/3/222)
	       ──────────────────────────────
	       |  Support: COMING SOON!!!!  |
	       ──────────────────────────────

	DO NOT EDIT THIS IF YOU DON'T KNOW WHAT YOU ARE DOING
	
───────────────────────────────────────────────────────────────
]]

if Config.enable == false then
    Config.prefix = ""
end


Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "OnDuty911") then 
		--StopResource(GetCurrentResourceName());
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named OnDuty911 for it to work properly...");
	end
end)
local resourceName = 
[[^4Credits to LegacysMaps for the blipcode help!^3
    ____        _____        _         ___  __ __ 
   / __ \      |  __ \      | |       / _ \/_ /_ |
  | |  | |_ __ | |  | |_   _| |_ _   | (_) || || |
  | |  | | '_ \| |  | | | | | __| | | \__, || || |
  | |__| | | | | |__| | |_| | |_| |_| | / / | || |
   \____/|_| |_|_____/ \__,_|\__|\__, |/_/  |_||_|
                                __/ |           
                               |___/            ^7

       	              ^6OnDuty911
	                 ^0Created By ^1Obli^5viox^0
                          ^1/911
                         ^1/panic^0
]]
print()
print()
print(resourceName)
print()
print()

    RegisterNetEvent('911:createCall')
AddEventHandler('911:createCall', function(source, args)
    if not table.unpack(args) then
        TriggerClientEvent('chat:addMessage', -1, Config.prefix .. '^1Please specify a postal and description!')

    else
        TriggerClientEvent('chat:addMessage', -1, Config.prefix .. '^1911 ^2^*Successfully ^r^2sent!')
        vIsOnDuty = exports.PoliceEMSActivity:isOnDuty()
        if vIsOnDuty == true then
            TriggerClientEvent('t-notify:client:Custom', -1, {
                style = 'error',
                duration = 35000,
                title = "New 911",
                message = "**Location**: " ..  table.remove(args, 1) .. "\n\n" .. "**Call Description**: \n".. table.concat(args, " "),
                sound = true,
                custom = true
            })
          end 
    end
end)

    RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, xCoord, yCoord, zCoord)

------ Forked from BlipAdder
    local blips = {
         {title="911 Call", colour=5, id=792, x = xCoord, y = yCoord, z = zCoord}
      }
          
    Citizen.CreateThread(function()
    
        for _, info in pairs(blips) do
          info.blip = AddBlipForCoord(xCoord, yCoord, zCoord)
          SetBlipSprite(info.blip, 162)
          SetBlipDisplay(info.blip, 4)
          SetBlipScale(info.blip, 1.5)
          SetBlipColour(info.blip, info.colour)
          SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING");
          AddTextComponentString("911 Report - " + name);
          EndTextCommandSetBlipName(info.blip);
        end
    end)


    if vIsOnDuty == true then
------- Code from https://legacysmaps.tebex.io/   |||     Thanks for the code legacy!
    local displayTime = 10
    blip = AddBlipForCoord(xCoord, yCoord, zCoord)
    SetBlipSprite(blip, 4)
    SetBlipScale(blip, 0.3)
    SetBlipColour(blip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('911 Call - ' .. name)
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime)
    for i, blip in pairs(blips) do 
        RemoveBlip(blip)
    end
end
end)



RegisterCommand("panic", function(source, args)

    if not table.unpack(args) then
        TriggerClientEvent('chat:addMessage', -1, Config.prefix .. '^1Please specify a postal/street!')

    else
        TriggerClientEvent('chat:addMessage', -1, Config.prefix .. '^1^*PANIC BUTTON PRESSED. UNITS WILL ARRIVE TO YOUR LOCATION ASAP')
        vIsOnDuty = exports.PoliceEMSActivity:isOnDuty()
        if vIsOnDuty == true then

            TriggerClientEvent('t-notify:client:Custom', -1, {
                style = 'error',
                duration = 50000,
                message = GetPlayerName(source) .. " triggered their panic button!",
                sound = true,
                custom = true
            })
            Citizen.Wait(50)

            Citizen.Wait(50)
            TriggerClientEvent('t-notify:client:Custom', -1, {
                style = 'error',
                duration = 100000,
                message = "**Location Pressed**: " ..  table.concat(args, " "),
                sound = true,
                custom = true
            })
            TriggerClientEvent('t-notify:client:Custom', -1, {
                style = 'error',
                duration = 100000,
                title = "Signal 100",
                message = "**SIGNAL 100 IS NOW IN EFFECT!!**\nEMERGENCY RTO TRAFFIC ONLY!!!",
                sound = true,
                custom = true
            })
        end 
    end

    
    RegisterNetEvent('911:setBlipPanic')
AddEventHandler('911:setBlipPanic', function(name, xCoord, yCoord, zCoord)

------ Forked from BlipAdder
    local blips = {
         {title="911 Call", colour=5, id=792, x = xCoord, y = yCoord, z = zCoord}
      }
          
    Citizen.CreateThread(function()
    
        for _, info in pairs(blips) do
          info.blip = AddBlipForCoord(xCoord, yCoord, zCoord)
          SetBlipSprite(info.blip, 162)
          SetBlipDisplay(info.blip, 4)
          SetBlipScale(info.blip, 1.5)
          SetBlipColour(info.blip, info.colour)
          SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING");
          AddTextComponentString("911 Report - " + name);
          EndTextCommandSetBlipName(info.blip);
        end
    end)


    if vIsOnDuty == true then
------- Code from https://legacysmaps.tebex.io/   |||     Thanks for the code legacy!
    local displayTime = 10
    blip = AddBlipForCoord(xCoord, yCoord, zCoord)
    SetBlipSprite(blip, 4)
    SetBlipScale(blip, 0.3)
    SetBlipColour(blip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('911 Call - ' .. name)
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime)
    for i, blip in pairs(blips) do 
        RemoveBlip(blip)
    end
end
end)
    

end, false)