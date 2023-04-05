local currentVehicle = nil

local function getRandomColor()
    local _tbl = {}
    _tbl.r = math.random(0, 255)
    _tbl.g = math.random(0, 255)
    _tbl.b = math.random(0, 255)
    return _tbl
end

local function SetVehicleColour()
    local playerPed <const> = PlayerPedId()
    currentVehicle = GetVehiclePedIsIn(playerPed, false)
    ToggleVehicleMod(currentVehicle, 22, true)
    SetVehicleNeonLightEnabled(currentVehicle, 0, true)
	SetVehicleNeonLightEnabled(currentVehicle, 1, true)
	SetVehicleNeonLightEnabled(currentVehicle, 2, true)
	SetVehicleNeonLightEnabled(currentVehicle, 3, true)
    if currentVehicle ~= nil and DoesEntityExist(currentVehicle) then
        local _vehicle_color = getRandomColor()
        local _neon_color = getRandomColor()
        SetVehicleCustomPrimaryColour(currentVehicle, _vehicle_color.r, _vehicle_color.g, _vehicle_color.b)
        SetVehicleCustomSecondaryColour(currentVehicle, _vehicle_color.r, _vehicle_color.g, _vehicle_color.b)
        SetVehicleNeonLightsColour(currentVehicle, _neon_color.r, _neon_color.g, _neon_color.b)
        SetVehicleHeadlightsColour(currentVehicle, math.random(0, 12))
        SetVehicleNumberPlateText(currentVehicle, 'MiraxxR')
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        SetVehicleColour()
    end
end)

print("^4 fivem-rainbowvehicle - By MiraxxR#8801 - https://github.com/MiraxxR1/fivem-rainbowvehicle - https://discord.gg/wJmnKQHTWD^0")
