local dbg = rdebug()
--Marker test
local marker
local text
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
    })
    marker.on('key', function(pressed)
        dbg.info('on key press %s',pressed)
    end)
    Citizen.Wait(20000)
    marker.stopRender()
end)

function createMarker()
    marker = rcore:createMarker();
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
    })
    marker.on('key', function(pressed)
        dbg.info('on key press %s',pressed)
    end)
    Citizen.Wait(20000)
    marker.stopRender()
end

Citizen.CreateThread(function()
    dbg.info('Starting create text test!')
    text = create3DText('Initial text');
    text.setPosition(vector3(1729.89,3313.33,41.22))
    text.render();
    text.on('enter',function()
        dbg.info('On enter')
        text.setText('On enter')
    end)
    text.on('leave', function()
        dbg.info('on leave')
        text.setText('On leave')
    end)
    text.setKeys({
        keys['E'],
    })
    text.on('key', function(pressed)
        dbg.info('on key press %s',pressed)
        text.setText('On press '..pressed)
    end)
    Citizen.Wait(20000)
    text.stopRender()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        marker.setRed(math.random(0,255))
        marker.setGreen(math.random(0,255))
        marker.setBlue(math.random(0,255))
        text.setColor({
            r = math.random(0,255),
            g = math.random(0,255),
            b = math.random(0,255),
            a = 255
        })
    end
end)
