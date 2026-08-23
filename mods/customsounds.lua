function init()
  api.log("Мод загружен!")
  api.set_jump_sound("https://example.com/jump.mp3")
  api.set_damage_sound("https://example.com/hit.wav")
  api.get_author()   -- ник автора из index.json
end
