extends Node

#game system___________________
var transition: bool     = false
var pause     : bool     = false
#level_________________________
var level_unlocked       
var coin

#music_________________________
func _music_menu():
	$music/menu.play()

func _click_ui():
	$sfx/click.play()
