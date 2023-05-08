extends Node

#game system___________________
var pause     : bool     = false
var next_scene: String
var level     : int      = 0
var data

var current_score : float = 0.0
var current_level : int
#game var______________________
var lvl_0_highscore : float = -1.0
var lvl_1_highscore : float = -1.0
var lvl_2_highscore : float = -1.0
var lvl_3_highscore : float = -1.0
var lvl_4_highscore : float = -1.0
var timer

var tips = [
"Tekan Esc untuk Berhenti dan menikmati rumput hijau", 
"Semua suara yang dipakai di gim adalah suara pembuatnya sendiri!", 
"Jangan ragu untuk terjun keluar peta", "3D asset di Tono merupakan barang kamar sang pembuat gim ini!",
"Terinspirasi dari masalah iklim!",
"Membuang sampah di tempatnya",
"100% GRATIS"
]

##DIALOG
var level_0 = (
	'
	Tekan tombol Panah untuk bergerak
	Tekan tombol Esc untuk berhenti sementara
	Selamat bermain!'
)


var level_1 = (
	'
	Manusia bertugas untuk menjaga, mengelola, dan melestarikan Bumi
	Manusia juga suka berkreasi, membuat sesuatu dengan imajinasi tanpa batas\n
	Aku Tono, anak bumi, tujuanku sederhana
	Mengejar bendera'
)
var level_2 = [
	"Usaha manusia sekuat dengan ambisi mereka",
	"Membangun rumah dan transportasi contohnya",
]

var level_3 = [
	"Lihat itu, mereka membangun peradaban",
	"Hahaha,",
	"Kota yang besar"
]
var level_4 = [
	"Wah, salju",
	"Sudah lama sekali aku tidak melihat salju di tempat ini!"
]
var level_5 = [
	"Hanya ada air disini",
	"Kukira ini tempat yang sama"
]
#game signal___________________






############################################
###Functions################################
############################################
func update_highscore(score: float, level_index: int):
	if level_index == 0:
		if score < lvl_0_highscore or lvl_0_highscore == -1.0:
			lvl_0_highscore = score
			print("update score lvl 0")
	if level_index == 1:
		if score < lvl_1_highscore or lvl_1_highscore == -1.0:
			lvl_1_highscore = score
			print("update score lvl 1")
	if level_index == 2:
		if score < lvl_2_highscore or lvl_2_highscore == -1.0:
			lvl_2_highscore = score
			print("update score lvl 2")
	if level_index == 3:
		if score < lvl_3_highscore or lvl_3_highscore == -1.0:
			lvl_3_highscore = score
			print("update score lvl 3")
	if level_index == 4:
		if score < lvl_4_highscore or lvl_4_highscore == -1.0:
			lvl_4_highscore = score
			print("update score lvl 4")
	save()
	load_save()
	
func update_level(local_level: int):
	if level < local_level:
		level = local_level
		print("up level")
		
	else:
		print("already done d lebvel")
	save()
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
func audio_music_clock():
	$music/clock.play()
func audio_music_menu():
	$music/menu.play()
func audio_rempah():
	$music/rempah.play()

#sfx
func audio_click_ui():
	$sfx/click.play()
func audio_hover_ui():
	$sfx/hover.play()
func audio_squick():
	$sfx/squick.play()
	
func save() -> void:
	data = {
		"level"                : level,
		"lvl_0_highscore"      : lvl_0_highscore,
		"lvl_1_highscore"      : lvl_1_highscore,
		"lvl_2_highscore"      : lvl_2_highscore,
		"lvl_3_highscore"      : lvl_3_highscore,
		"lvl_4_highscore"      : lvl_4_highscore
	}

	var save_game = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var json = JSON.stringify(data)
	save_game.store_line(json)
	save_game.close()
	print("save:\n %s" %data)

func load_save() -> void:

	var save_game = FileAccess.open("user://savegame.json", FileAccess.READ)
	if FileAccess.file_exists("user://savegame.json"):
		data = JSON.parse_string(save_game.get_as_text())
		save_game.close()
		level            = data.level
		lvl_0_highscore  = data.lvl_0_highscore
		lvl_1_highscore  = data.lvl_1_highscore
		lvl_2_highscore  = data.lvl_2_highscore
		lvl_3_highscore  = data.lvl_3_highscore
		lvl_4_highscore  = data.lvl_4_highscore
		print("file is loaded %s" %data)
		print(lvl_0_highscore, lvl_1_highscore, lvl_2_highscore, lvl_3_highscore, lvl_4_highscore, level)
#	if !FileAccess.file_exists("user://savegame.json"):
#		print("no save :(")
	else:
		print("somting wong %s" %data)
		
func reset() -> void:
	level            = 0
	lvl_0_highscore  = -1.0
	lvl_1_highscore  = -1.0
	lvl_2_highscore  = -1.0
	lvl_3_highscore  = -1.0
	lvl_4_highscore  = -1.0
	save()
	load_save()
	restart_level()
	print("reset")
