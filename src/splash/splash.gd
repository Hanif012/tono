extends Control

func _on_anim_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://src/ui/ui_menu.tscn")
