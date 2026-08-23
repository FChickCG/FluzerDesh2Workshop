function init()
    api.log("=== ПРОТОКОЛ БЕРСЕРК: Загрузка ===")
    

    local name = api.get_player_nickname()
    local coins = api.get_coins()
    local message = ""
    

    if coins >= 5000 then
        message = "💀 Легенда " .. name .. " активировала ПРОТОКОЛ БЕРСЕРК! Твоя мощь сокрушит всё!"
        api.set_max_hp(250)
    elseif coins >= 1000 then
        message = "⚔️ Опытный боец " .. name .. ", режим ярости включен! Баланс: " .. coins
        api.set_max_hp(150)
    else
        message = "🔥 " .. name .. ", режим отчаяния! У тебя всего " .. coins .. " монет. Докажи свою ценность!"
        api.set_max_hp(50)
    end

    api.set_run_speed(9)
    api.set_jump_force(14)
    api.set_gravity(4.2)
    api.show_message(message, 6)
    api.vibrate()
    api.vibrate()
    api.set_level_music("https://raw.githubusercontent.com/example/sounds/main/dark_synths_loop.mp3")
    api.log("Протокол Берсерк: Инициализация завершена успешно.")
end
