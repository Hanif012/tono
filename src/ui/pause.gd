extends Control

signal restart_ui_game

func _ready():
	self.visible = false

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pause") and Global.pause:
			_on_resume_pressed()

func _on_resume_pressed():
			click_sfx()
			Global.pause = false
			await get_tree().create_timer(0.1).timeout
			self.visible = false
			get_tree().paused = false
			print("resume")
			$"../AnimationPlayer".play_backwards("pause")

func _on_menu_pressed():
	click_sfx()
	Global.loading("res://src/ui/ui_menu.tscn")
	_on_resume_pressed()


func _on_restart_pressed():
	click_sfx()
	Global.pause = false
	await get_tree().create_timer(0.1).timeout
	self.visible = false
	get_tree().paused = false
	print("restart")
	_restart_level()

func _restart_level():
	$"../AnimationPlayer".stop()
	Global.restart_level()
	
func click_sfx():
	Global.audio_click_ui()
func _on_resume_focus_entered():
	Global.audio_hover_ui()
func _on_restart_focus_entered():
	Global.audio_hover_ui()
func _on_menu_focus_entered():
	Global.audio_hover_ui()
func _on_resume_mouse_entered():
	Global.audio_hover_ui()
func _on_restart_mouse_entered():
	Global.audio_hover_ui()
func _on_menu_mouse_entered():
	Global.audio_hover_ui()
