extends Control


@onready var menu = $menu
@onready var audio = $audio_settings

func _ready():
	audio.visible = false
	menu.visible = true

func _on_play_button_pressed():
	menu.visible = false
	audio.visible = false

func _on_confirm_pressed():
	menu.visible = true
	audio.visible = false

func _on_settings_button_pressed():
	menu.visible = false
	audio.visible = true
