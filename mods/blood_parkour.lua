function init()
    api.set_max_hp(60)
    api.show_message("КРОВАВЫЙ ПАРКУР: -2 HP/сек. Прыгай, чтобы лечиться (+5 HP)!", 4)
    api.vibrate()
end

local was_grounded = true

api.on_second(function()
    if not api.is_player_dead() then
        api.damage_player(2)
    end
end)

api.on_update(function(dt)
    if api.is_player_dead() then return end

    local is_grounded = api.is_player_grounded()
    
    if not is_grounded and was_grounded then
        api.heal_player(5)
        api.play_sound("https://example.org/sounds/heal_jump.mp3") 
    end
    
    was_grounded = is_grounded
end)
