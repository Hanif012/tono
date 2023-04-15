extends Node

#game system___________________
var transition: bool     = false
var pause     : bool     = false

#level_________________________
var level_list = [
	"res://src/level/level_1.tscn",
	"res://src/level/level_2.tscn"
	
]

var level_index = 0  
func load_next_level():
	level_index += 1
	level_index %= level_list.size()
	get_tree().call_group("instanced", "queue_free")
	get_tree().change_scene(level_list[level_index])

var coin

#music_________________________
func _music_menu():
	$music/menu.play()

func _click_ui():
	$sfx/click.play()
