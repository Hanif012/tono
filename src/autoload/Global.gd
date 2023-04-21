extends Node

#game system___________________
var pause     : bool     = false
var next_scene: String
var level     : int      = 1
var data

#game var______________________
var lvl_1_highscore : float = 0
var lvl_2_highscore : float = 0
var timer


func restart_level():
	get_tree().call_group("instanced", "queue_free")
	get_tree().reload_current_scene()

#call the function and scene path as argument
func loading(target):
	next_scene = target
	var scene = preload("res://src/ui/transition.tscn")
	var instance = scene.instantiate()
	add_child(instance)

#music_________________________
func _music_menu():
	$music/menu.play()

func _click_ui():
	$sfx/click.play()

func save() -> void:
	data = {
		
	}

	var save_game = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var json = JSON.stringify(data)
	save_game.store_line(json)
	save_game.close()

func load() -> void:
	var save_game = FileAccess.open("user://savegame.json", FileAccess.READ)
	if save_game.file_exists("user://savegame.json"):
		data = JSON.parse_string(save_game.get_as_text())
		save_game.close()
	
