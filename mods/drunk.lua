
local time = 0
local hue = 0

function init()
    api.log("Пьяный мод загружен!")
    api.show_message("ПЬЯНЫЙ РЕЖИМ!", 3)
    api.set_level_music("https://storage.filebin.net/filebin/a0c7ddb3081d0847120d361301f108a6e17cbc33cc281c08d24c1b7d8af1e53d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=GK352fd2505074fc9dde7fd2cb%2F20260826%2Fhel1-dc4%2Fs3%2Faws4_request&X-Amz-Date=20260826T131944Z&X-Amz-Expires=900&X-Amz-SignedHeaders=host&response-cache-control=max-age%3D900&response-content-disposition=inline%3B%20filename%3D%22Oh-My-Little-Baby-Boy-TLPUR-song-Instrumental-Bes.ogg%22&response-content-type=audio%2Fogg&x-id=GetObject&X-Amz-Signature=863b524f5caa593873d1604a8a174072537c8c25cd2ab22881fd111e535d0857")
    api.set_music_volume(1.0)
end

api.on_update(function(dt)
    time = time + dt
    hue = (hue + dt * 120) % 360
    local r, g, b = hsv_to_rgb(hue, 1.0, 1.0)
    api.set_camera_color(r, g, b)
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
