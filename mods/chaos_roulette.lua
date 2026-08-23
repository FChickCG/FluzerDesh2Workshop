function init()
    api.show_message("Хаос-Рулетка запущена! Физика изменится через 15 секунд...", 4)
end

local timer = 0

api.on_second(function()
    if api.is_player_dead() then return end

    timer = timer + 1
    if timer >= 15 then
        timer = 0
        local mode = math.random(1, 3)
        
        api.shake_screen(0.4, 0.6)
        api.play_sound("https://example.org/sounds/chaos_shift.mp3") 

        if mode == 1 then
            api.set_gravity(2.0)
            api.set_jump_force(16)
            api.set_run_speed(7)
            api.show_message("🌕 РЕЖИМ: ЛУНА (Высокие прыжки!)", 3)
        elseif mode == 2 then
            api.set_gravity(9.0)
            api.set_jump_force(9)
            api.set_run_speed(11)
            api.show_message("⚡ РЕЖИМ: СПРИНТЕР (Тяжёлый, но быстрый!)", 3)
        else
            api.set_gravity(5.0)
            api.set_jump_force(18)
            api.set_run_speed(5)
            api.show_message("🦘 РЕЖИМ: КУЗНЕЧИК (Огромный прыжок с места!)", 3)
        end
    end
end)
