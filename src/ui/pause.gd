extends Control

signal restart_ui_game

func _ready():
	self.visible = false

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pause") and Global.pause:
			_on_resume_pressed()

func _on_resume_pressed():
			Global.pause = false
			await get_tree().create_timer(0.1).timeout
			self.visible = false
			get_tree().paused = false
			print("resume")
			$"../AnimationPlayer".play_backwards("pause")

func _on_menu_pressed():
	Global.loading("res://src/ui/ui_menu.tscn")
	_on_resume_pressed()


func _on_restart_pressed():
	Global.pause = false
	await get_tree().create_timer(0.1).timeout
	self.visible = false
	get_tree().paused = false
	print("restart")
	_restart_level()

func _restart_level():
	$"../AnimationPlayer".stop()
	Global.restart_level()
	
