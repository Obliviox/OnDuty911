--[[
───────────────────────────────────────────────────────────────

	OnDuty911 (server.lua) - Created by Obliviox
	     Current Version: v1.7.1 (Sep 2021)
	       ──────────────────────────────
	       |  Support: COMING SOON!!!!  |
	       ──────────────────────────────

	DO NOT EDIT THIS IF YOU DON'T KNOW WHAT YOU ARE DOING
	
───────────────────────────────────────────────────────────────
]]



Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "OnDuty911") then 
		--StopResource(GetCurrentResourceName());
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named OnDuty911 for it to work properly...");
	end
end)
local resourceName = 
[[^3
    ____        _____        _         ___  __ __ 
   / __ \      |  __ \      | |       / _ \/_ /_ |
  | |  | |_ __ | |  | |_   _| |_ _   | (_) || || |
  | |  | | '_ \| |  | | | | | __| | | \__, || || |
  | |__| | | | | |__| | |_| | |_| |_| | / / | || |
   \____/|_| |_|_____/ \__,_|\__|\__, |/_/  |_||_|
                                __/ |           
                               |___/            ^7

       	              ^6OnDuty911
	                 ^0Created By Obliviox
                          /911
                         /panic
]]

print(resourceName)
RegisterCommand("911", function(source, args)

    if not table.unpack(args) then
        TriggerClientEvent('chatMessage', -1, '^6[^0^*SVRP^r^6]^0 ' .. '^1Please specify a postal and description!')

    else
        TriggerClientEvent('chatMessage', -1, '^6[^0^*SVRP^r^6]^0 ' .. '^1911 ^2^*Successfully ^r^2sent!')
        vIsOnDuty = exports.PoliceEMSActivity:isOnDuty()
        if vIsOnDuty == true then
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                duration = 35000,
                title = "New 911",
                message = "**Location**: " ..  table.remove(args, 1) .. "\n\n" .. "**Call Description**: \n".. table.concat(args, " "),
                sound = true,
                custom = true
            })
          end 
    end
    

end, false)

RegisterCommand("panic", function(source, args)

    if not table.unpack(args) then
        TriggerClientEvent('chatMessage', -1, '^6[^0^*SVRP^r^6]^0 ' .. '^1Please specify a postal/street!')

    else
        TriggerClientEvent('chatMessage', -1, '^6[^0^*SVRP^r^6]^0 ' .. '^1^*PANIC BUTTON PRESSED. UNITS WILL ARRIVE TO YOUR LOCATION ASAP')
        vIsOnDuty = exports.PoliceEMSActivity:isOnDuty()
        -- if vIsOnDuty == true then
        
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                duration = 50000,
                message = GetPlayerName(source) .. " triggered their panic button!",
                sound = true,
                custom = true
            })
            Citizen.Wait(50)

            Citizen.Wait(50)
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                duration = 100000,
                message = "**Location Pressed**: " ..  table.concat(args, " "),
                sound = true,
                custom = true
            })
            TriggerClientEvent('t-notify:client:Custom', source, {
                style = 'error',
                duration = 100000,
                title = "Signal 100",
                message = "**SIGNAL 100 IS NOW IN EFFECT!!**\nEMERGENCY RTO TRAFFIC ONLY!!!",
                sound = true,
                custom = true
            })
        --   end 
    end
    

end, false)