extends ColorRect

signal game_start

@onready var level   = %level
@onready var counter = %counter
var show_level = {
	0: "tutorial",
	1: "Labirin",
	2: "Spiral",
	3: "Balok",
	4: "Kipas",
	5: "Tamat!"
}

func _ready():
	level.text = str(show_level[Global.current_level])

func start():
	emit_signal("game_start")

func _on_animation_player_animation_finished(anim_name):
	queue_free()
