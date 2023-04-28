extends Node

#game system___________________
var pause     : bool     = false
var next_scene: String
var level     : int      = 1
var data

#game var______________________
var lvl_1_highscore : float = 0.0
var lvl_2_highscore : float = 0.0
var lvl_3_highscore : float = 0.0
var lvl_4_highscore : float = 0.0
var timer

#game signal___________________






############################################
###Functions################################
############################################
func update_highscore(score: float, level_index: int):
	if level == 1:
		if score > lvl_1_highscore:
			lvl_1_highscore = score
			print("update score lvl 1")
	if level == 2:
		if score > lvl_2_highscore:
			lvl_1_highscore = score
			print("update score lvl 2")
	if level == 3:
		if score > lvl_3_highscore:
			lvl_1_highscore = score
			print("update score lvl 3")
	if level == 4:
		if score > lvl_4_highscore:
			lvl_1_highscore = score
			print("update score lvl 4")

#TreeMancer
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
func audio_music_menu():
	$music/menu.play()

func audio_click_ui():
	$sfx/click.play()
	
func audio_hover_ui():
#	$sfx/hover.
	$sfx/hover.play()
	
func audio_squick():
	$sfx/squick.play()
	
func save() -> void:
	data = {
		"level"                : level,
		"lvl_1_highscore"      : lvl_1_highscore,
		"lvl_2_highscore"      : lvl_2_highscore,
		"lvl_3_highscore"      : lvl_3_highscore,
		"lvl_4_highscore"      : lvl_4_highscore
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

func reset() -> void:
	level            = 1
	lvl_1_highscore  = 0.0
	lvl_2_highscore  = 0.0
	lvl_3_highscore  = 0.0
	lvl_4_highscore  = 0.0
	save()
