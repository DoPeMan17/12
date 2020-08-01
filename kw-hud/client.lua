-- Grüße von JanKrb ;)
local thirst, hunger, voice, money, speed, fuel = 0,0,50,0,0,0

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(250)
        if ESX.GetPlayerData().money ~= nil then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                SendNUIMessage({
                    show = IsPauseMenuActive(),
                    thirst = thirst,
                    hunger = hunger,
                    voice = voice,
                    cash = ESX.GetPlayerData().money,
                    car = true,
                    fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false)),
                    speed = ESX.Math.Round((GetEntitySpeed(GetPlayerPed(-1)) * 3.6), 0)
                })
            else
                SendNUIMessage({
                    show = IsPauseMenuActive(),
                    thirst = thirst,
                    hunger = hunger,
                    cash = ESX.GetPlayerData().money,
                    voice = voice,
                    car = false
                })
            end
        end
        
    end
end)

AddEventHandler("kw_hud:updateBasics", function(basics)
    hunger, thirst = basics[2].percent, basics[3].percent
end)

RegisterNetEvent('kw_hud:changeVoice')
AddEventHandler('kw_hud:changeVoice', function(voice1)
    voice = voice1
end)