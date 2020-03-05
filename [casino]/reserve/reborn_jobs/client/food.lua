X.Plant = function(seed, coords)
	Citizen.CreateThread(function()
		X.startScenario("WORLD_HUMAN_GARDENER_PLANT")
		Citizen.Wait((Config.SecondNeededToPlant - 3)* 1000)
		ClearPedTasks(PlayerPedId())
		Citizen.Wait(3 * 1000)
		ESX.Game.SpawnObject(seed.object, coords, function(object)
			FreezeEntityPosition(object,true)
		end)
		
		X.IsPlanting = false
	end)
end

X.RemoveLowPlant = function(coords, id, seed)
	Citizen.CreateThread(function()
		local object, distance = ESX.Game.GetClosestObject(Config.Seeds[seed].object, coords)
		X.startScenario("WORLD_HUMAN_GARDENER_PLANT")
		Citizen.Wait((Config.SecondNeededToPlant - 3)* 1000)
		ClearPedTasks(PlayerPedId())
		Citizen.Wait(3 * 1000)
		TriggerServerEvent('reborn_jobs:removePlant', id, coords)
		SetEntityAsMissionEntity(object, false, true)
		Citizen.Wait(2 * 1000)
		X.IsPlanting = false
	end)
end

X.HarvestPlant = function(coords, id, seed)
	Citizen.CreateThread(function()
		local object, distance = ESX.Game.GetClosestObject(Config.Seeds[seed].object, coords)
		X.startScenario("WORLD_HUMAN_GARDENER_PLANT")
		Citizen.Wait((Config.SecondNeededToPlant - 3)* 1000)
		TriggerServerEvent('reborn_jobs:harvestPlant', id, Config.Seeds[seed])
		ClearPedTasks(PlayerPedId())
		Citizen.Wait(3 * 1000)
		ESX.Game.DeleteObject(object)
		Citizen.Wait(2 * 1000)
		X.IsPlanting = false
	end)
end

X.IsThisSeedAllowed = function(seed, ph)
	for k,v in pairs(ph.seedsAllowed) do
		if v == seed then
			return true
		end
	end

	return false
end

X.AddWater = function(id, quantity)
	Citizen.CreateThread(function()
		TriggerServerEvent('reborn_jobs:addWater', id, quantity)
		X.startScenario("CODE_HUMAN_MEDIC_KNEEL")
		Citizen.Wait(5* 1000)
		ClearPedTasks(PlayerPedId())	
		X.IsPlanting = false
	end)
end

X.AddFertilizer = function(id, quantity)
	Citizen.CreateThread(function()
		TriggerServerEvent('reborn_jobs:addFertilizer', id, quantity)
		X.startScenario("CODE_HUMAN_MEDIC_KNEEL")
		Citizen.Wait(5* 1000)
		ClearPedTasks(PlayerPedId())	
		X.IsPlanting = false
	end)
end

X.OpenSeedMenu = function()
	local elements = Config.SeedShop
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_load', {
		title    = Local.seedShop,
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value then
			TriggerServerEvent('reborn_jobs:buyItem', data.current.value, data.current.price)
		end
	end,
	function(data, menu)
		menu.close()
	end
	)
end

X.Draw3DTextPlants = function(v)
	if v.rot > 0 then
		if v.percent < 100 then
			X.DrawText3D({x = v.x, y = v.y, z = v.z + 2}, "~w~["..Local[v.seed].."~w~] : "..v.percent.."%")
		else
			X.DrawText3D({x = v.x, y = v.y, z = v.z + 2}, "~w~["..Local[v.seed].."~w~] : ~g~"..Local.ready)
		end
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.85}, "~w~[~b~"..Local.water.."~w~] : "..v.water.."L")
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.7}, "~w~[~y~"..Local.fertilizer.."~w~] : "..v.fertilizer.."%")
	end
	if v.rot > 50 then
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.55}, "~w~[~g~"..Local.state.."~w~] : "..v.rot.."%")
	elseif v.rot > 25 then
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.55}, "~w~[~y~"..Local.state.."~w~] : "..v.rot.."%")
	elseif v.rot > 12 then
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.55}, "~w~[~o~"..Local.state.."~w~] : "..v.rot.."%")
	elseif v.rot > 0 then
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.55}, "~w~[~r~"..Local.state.."~w~] : "..v.rot.."%")
	else
		X.DrawText3D({x = v.x, y = v.y, z = v.z + 1.55}, "~w~[~r~"..Local.rotten.."~w~]")	
	end
end