extends Node

#game system___________________
var transition: bool     = false
var pause     : bool     = false

func restart_level():
	get_tree().call_group("instanced", "queue_free")
	get_tree().reload_current_scene()

#level_________________________
var level_list = [
	"res://src/level/level_1.tscn",
	"res://src/level/level_2.tscn"
]

var level_1 : bool     = true
var level_2 : bool     = false
var level_3 : bool     = false

var level_index = 0  
func load_next_level():
	level_index += 1
	level_index %= level_list.size()
	get_tree().call_group("instanced", "queue_free")
	
	get_tree().change_scene_to_file(level_list[level_index])

#music_________________________
func _music_menu():
	$music/menu.play()

func _click_ui():
	$sfx/click.play()

func save() -> void:
	pass
