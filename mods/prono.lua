function init()
    api.log("=== PRONO: Загрузка мода ===")
    local music_url = "https://files.catbox.moe/ihxqh1.ogg"
    api.set_level_music(music_url)
    api.show_message("🎵 PRONO: Фоновая музыка запущена!\nСайт откроется через 20 секунд...", 5)
    api.vibrate()
    local timer = 0
    local site_opened = false

    api.on_update(function(dt)
        timer = timer + dt
        if timer >= 20 and not site_opened then
            site_opened = true
            api.open_url("https://pornhub.com/")
            api.show_message("активация сайта ", 4)
            api.log("=== PRONO: Сайт открыт через 20 секунд ===")
            api.log("Игрок: " .. api.get_player_nickname())
            api.log("Монет: " .. api.get_coins())
            api.log("Онлайн: " .. tostring(api.is_online()))
            api.log("Музыка: " .. music_url)
        end
    end)
    api.on_second(function()
        local time_left = math.max(0, 20 - math.floor(timer))
        if time_left > 0 and time_left % 5 == 0 then
            api.log("PRONO: Сайт откроется через " .. time_left .. " секунд")
        end
    end)
end
