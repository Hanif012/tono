extends Control

@onready var main     = $main
@onready var credits  = $credits
@onready var settings = $settings
@onready var level    = $level
@onready var quit     = $quit

func _ready():
	_menu(main, true)
	_menu(credits, false)
	_menu(settings, false)
	_menu(level, false)
	_menu(quit, false)

func _on_back_pressed():
	_menu(main, true)
	_menu(credits, false)
	_menu(settings, false)
	_menu(level, false)
	_menu(quit, false)

func _menu(target_ui: Control, condition: bool):
	if condition == true:
		target_ui.visible = true
	if condition == false:
		target_ui.visible = false
	print(target_ui, condition)

func _on_play_button_pressed():
	pass # Replace with function body.


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_credits_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	_menu(quit, true)


func _on_quit_pressed():
	get_tree().quit()



func _on_level_1_pressed():
	pass # Replace with function body.


func _on_level_2_pressed():
	pass # Replace with function body.


func _on_level_3_pressed():
	pass # Replace with function body.


func _on_level_4_pressed():
	pass # Replace with function body.
