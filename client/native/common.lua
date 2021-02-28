--Taken and edited from https://forum.cfx.re/t/lua-finding-closest-ped-to-player/166950
function getClosestPed(targetPed, distance)
    local count = 0
    for ped in EnumeratePeds() do
        if DoesEntityExist(ped) and ped ~= 0 then
            local distanceCheck = #(GetEntityCoords(targetPed)-GetEntityCoords(ped))
            if distanceCheck <= distance then
                return ped
            end
            count = count + 1
        end
    end
    print('Find count',count)
    return nil
end

exports('getClosestPed',getClosestPed)

function getClosestPeds(targetPed, distance, count)
    count = count or 250

    local closestPed = {}
    local count = 0
    for ped in EnumeratePeds() do
        local distanceCheck = #(GetEntityCoords(targetPed)-GetEntityCoords(ped))
        if distanceCheck <= distance then
            table.insert(closestPed,ped)
        end
        count = count + 1
        if count >= count then
            break
        end
    end

    return closestPed
end

exports('getClosestPed',getClosestPed)
