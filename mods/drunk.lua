
local time = 0
local hue = 0

function init()
    api.log("Пьяный мод загружен!")
    api.show_message("ПЬЯНЫЙ РЕЖИМ!", 3)

    api.set_level_music("https://storage.filebin.net/filebin/-My-Little-Baby-Boy-TLPUR-song-Instrumental-Bes.ogg")
    api.set_music_volume(1.0)
end

api.on_update(function(dt)
    time = time + dt
    hue = (hue + dt * 120) % 360
    local r, g, b = hsv_to_rgb(hue, 1.0, 1.0)
    api.set_camera_color(r, g, b)
    api.set_ambient_color(r, g, b)
    local angle = math.sin(time * 2.3) * 14
                + math.sin(time * 4.1) * 7
                + math.sin(time * 6.7) * 3
    api.set_camera_rotation(angle)
end)
function hsv_to_rgb(h, s, v)
    local c = v * s
    local hp = h / 60.0
    local x = c * (1 - math.abs(hp % 2 - 1))
    local m = v - c
    local r, g, b = 0, 0, 0

    if hp < 1 then
        r, g, b = c, x, 0
    elseif hp < 2 then
        r, g, b = x, c, 0
    elseif hp < 3 then
        r, g, b = 0, c, x
    elseif hp < 4 then
        r, g, b = 0, x, c
    elseif hp < 5 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end

    return r + m, g + m, b + m
end
