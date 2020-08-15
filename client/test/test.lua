local dbg = rdebug()
--Marker test
local marker
local keys = getKeys()

Citizen.CreateThread(function()
    dbg.info('Starting create marker test!')
    marker = createMarker();
    marker.setPosition(vector3(1729.89,3313.33,40.22))
    marker.render();
    marker.on('enter',function()
        dbg.info('On enter')
    end)
    marker.on('leave', function()
        dbg.info('on leave')
    end)
    marker.setKeys({
        keys['E'],
        keys['X']
    })
    marker.on('key', function(pressed)
        dbg.info('on key press %s',pressed)
    end)
    Citizen.Wait(20000)
    marker.stopRender()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        marker.setRed(math.random(0,255))
        marker.setGreen(math.random(0,255))
        marker.setBlue(math.random(0,255))
    end
end)