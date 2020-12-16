RegisterCommand("tpm", function(source)
        local waypointBlip = GetFirstBlipInfoId( 8 ) 
        if DoesBlipExist(waypointBlip) then          
	        local coord = Citizen.InvokeNative( 0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector( ) ) 
	        local x  = coord.x
	        local y = coord.y
	        local z = coord.z
            for z = 1, 1000 do
                SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z + 0.0)

                local foundGround, zPos = GetGroundZFor_3dCoord(x, y, z + 0.0)

                if foundGround then
                    SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z + 0.0)

                    break
                end

                Citizen.Wait(5)
            end

            TriggerEvent("chatMessage", "[Server]", {255, 0, 0}, "Teleported | Rayberk Development")
        else
            TriggerEvent("chatMessage", "[Server]", {255, 0, 0}, "No Waypoints Selected | Rayberk Development")
        end
    end)


RegisterCommand("tpco", function(source, args)
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    TriggerEvent("chatMessage", "[Server]", {255, 0, 0}, "Your coordinates" .. coords .. " | Rayberk Development")
    AddBlipForCoord(coords)
end)