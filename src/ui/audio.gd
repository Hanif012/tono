extends VBoxContainer

signal menu_changed

@onready var sound_volume_slider := $sfx/sfx_slider as HSlider
@onready var music_volume_slider := $music/music_slider as HSlider


func _ready() -> void:
	sound_volume_slider.value = Settings.file.get_value("audio", "sound_volume", 0.5)
	music_volume_slider.value = Settings.file.get_value("audio", "music_volume", 0.5)

	# Apply initial configuration settings (only really useful in the first start)
	sound_volume_slider.emit_signal("value_changed", sound_volume_slider.value)
	music_volume_slider.emit_signal("value_changed", music_volume_slider.value)


func _on_sound_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Effects"),
			linear_to_db(value)
	)


func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Music"),
			linear_to_db(value)
	)


func _on_done_pressed() -> void:
	Settings.file.set_value("audio", "sound_volume", sound_volume_slider.value)
	Settings.file.set_value("audio", "music_volume", music_volume_slider.value)
	Settings.save()
	emit_signal("menu_changed", $"/root/Menu/Control/Options")

