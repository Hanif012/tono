extends Node3D

func _ready():
	get_tree().paused = true

func _on_ui_menu_tutorial_start():
	get_tree().paused = false
