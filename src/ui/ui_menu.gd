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
	$settings/TextureRect/TextureRect.visible = false

func _on_back_pressed():
	click_sfx()
	_menu(main, true)
	_menu(credits, false)
	_menu(settings, false)
	_menu(level, false)
	_menu(quit, false)
	$settings/TextureRect/TextureRect.visible = false

func _menu(target_ui: Control, condition: bool):
	if condition == true:
		target_ui.visible = true
	if condition == false:
		target_ui.visible = false
	print(target_ui, condition)

func _on_play_button_pressed():
	click_sfx()
	_menu(main, false)
	_menu(credits, false)
	_menu(settings, false)
	_menu(level, true)
	_menu(quit, false)

func _on_settings_button_pressed():
	click_sfx()
	_menu(main, false)
	_menu(credits, false)
	_menu(settings, true)
	_menu(level, false)
	_menu(quit, false)


func _on_credits_button_pressed():
	click_sfx()
	pass # Replace with function body.


func _on_quit_button_pressed():
	click_sfx()
	_menu(quit, true)


func _on_quit_pressed():
	click_sfx()
	get_tree().quit()


func _on_level_1_pressed():
	click_sfx()
	if Global.level > 0:
		print("enter lvl 1")
		Global.loading("res://src/level/level_1.tscn")
		
func _on_level_2_pressed():
	click_sfx()
	if Global.level > 1:
		print("enter lvl 1")
		Global.loading("res://src/level/level_2.tscn")
func _on_level_3_pressed():
	click_sfx()
	if Global.level > 2:
		print("enter lvl 3")
		Global.loading("res://src/level/level_3.tscn")
func _on_level_4_pressed():
	click_sfx()
	if Global.level > 3:
		print("enter lvl 4")
		Global.loading("res://src/level/level_4.tscn")


func _on_delete_save_file_pressed():
	$settings/TextureRect/TextureRect.visible = true


func _on_delete_confirm_pressed():
	Global.reset()

#AUDIO######################################
func click_sfx():
	Global.audio_click_ui()
func _on_back_mouse_entered():
	Global.audio_hover_ui()
func _on_quit_mouse_entered():
	Global.audio_hover_ui()
func _on_delete_confirm_mouse_entered():
	Global.audio_hover_ui()
func _on_delete_save_file_focus_entered():
	Global.audio_hover_ui()
func _on_level_4_mouse_entered():
	Global.audio_hover_ui()
func _on_level_3_mouse_entered():
	Global.audio_hover_ui()
func _on_level_2_mouse_entered():
	Global.audio_hover_ui()
func _on_level_1_mouse_entered():
	Global.audio_hover_ui()
func _on_quit_button_mouse_entered():
	Global.audio_hover_ui()
func _on_credits_button_mouse_entered():
	Global.audio_hover_ui()
func _on_settings_button_mouse_entered():
	Global.audio_hover_ui()
func _on_play_button_mouse_entered():
	Global.audio_hover_ui()
