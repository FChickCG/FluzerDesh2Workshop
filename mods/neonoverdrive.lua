function init()
    api.log("=== NEON OVERDRIVE: Инициализация ===")
    api.set_run_speed(10)
    api.set_jump_force(15)
    api.set_gravity(4)
    api.set_max_hp(150)
    local nickname = api.get_player_nickname()
    local coins = api.get_coins()
    local is_online = api.is_online()
    local status = is_online and " [СЕТЬ: АКТИВНА]" or " [СЕТЬ: ЛОКАЛЬНАЯ]"
    local welcome_msg = "Привет, " .. nickname .. "! 💰 Баланс: " .. coins .. status .. "\nРежим НЕОНОВЫЙ ОВЕРДРАЙВ активирован! 🚀"
    api.show_message(welcome_msg, 6) 
    api.vibrate()
    api.set_jump_sound("https://raw.githubusercontent.com/example/sounds/main/jump_sci_fi.mp3")
    api.set_damage_sound("https://files.catbox.moe/c8u714.mp3")
    api.log("Физика, звуки и UI обновлены. Удачной игры!")
end
