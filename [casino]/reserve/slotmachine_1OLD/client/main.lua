local input = {["E"] = 38,["DOWN"] = 173,["TOP"] = 27,["NENTER"] =  201}
ESX                           = nil
local PlayerData                = {}



Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


Citizen.CreateThread(function()
SetNuiFocus(false, false)
end)


RegisterNetEvent('errormessage2')
AddEventHandler('errormessage2', function()
PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "HUD_MINI_GAME_SOUNDSET", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNetEvent('spinit2')
AddEventHandler('spinit2', function()
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

	SendNUIMessage({
			canspin = true
		})
	Citizen.Wait(100)

		SendNUIMessage({
			canspin = false
		})

end)


RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

end)




RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0, 0, 1)
	TriggerServerEvent('payforplayer2',winnings)
end)


RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays2',bet)
end)

local moneymachine_slot = {
	{ ['x'] = 973.77, ['y'] = 52.03, ['z'] = 74.48 },
	{ ['x'] = 972.11, ['y'] = 52.52, ['z'] = 74.48 },
	{ ['x'] = 981.8, ['y'] = 47.13, ['z'] = 74.38 },
	{ ['x'] = 982.31, ['y'] = 45.8, ['z'] = 74.48 },
	{ ['x'] = 977.69, ['y'] = 54.66, ['z'] = 74.48 },
	{ ['x'] = 979.11, ['y'] = 54.79, ['z'] = 74.48 },
	{ ['x'] = 982.32, ['y'] = 51.47, ['z'] = 74.48 },
	{ ['x'] = 982.4, ['y'] = 56.49, ['z'] = 74.48 },
	{ ['x'] = 1005.99, ['y'] = 58.75, ['z'] = 73.28 },
	{ ['x'] = 1012.26, ['y'] = 55.23, ['z'] = 73.28 },
	{ ['x'] = 1011.26, ['y'] = 59.71, ['z'] = 73.28 },
	{ ['x'] = 1007.45, ['y'] = 54.87, ['z'] = 73.28 },

	{ ['x'] = 1130.19, ['y'] = 251.7, ['z'] = -51.04 },
	{ ['x'] = 1131.22, ['y'] = 251.43, ['z'] = -51.04 },
	{ ['x'] = 1132.15, ['y'] = 250.89, ['z'] = -51.04 },
	{ ['x'] = 1132.92, ['y'] = 250.14, ['z'] = -51.04 },
	{ ['x'] = 1133.44, ['y'] = 249.18, ['z'] = -51.04 },
	{ ['x'] = 1133.74, ['y'] = 248.14, ['z'] = -51.04 },

	--penthouse
	{ ['x'] = 944.73, ['y'] = 20.86, ['z'] = 116.16 },
	{ ['x'] = 941.25, ['y'] = 8.86, ['z'] = 116.16 },
	{ ['x'] = 943.2, ['y'] = 7.67, ['z'] = 116.16 },
	{ ['x'] = 942.07, ['y'] = 5.96, ['z'] = 116.16 },
	{ ['x'] = 940.18, ['y'] = 7.06, ['z'] = 116.16 },
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(29, v.x, v.y, v.z + 0.2, 0, 0, 0, 0, 0, 0, 0.6001, 1.0001, 0.6, 0, 255, 5, 90, 1,0, 0,1)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
						DisplayHelpText("Press ~INPUT_CONTEXT~ ~y~ to play slots")
					if IsControlJustPressed(1,input["E"]) then
						SendNUIMessage({
							show = true
						})
						SetNuiFocus(true,true)
						PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

