extends ColorRect

signal game_start

@onready var level   = %level
@onready var counter = %counter
var show_level = {
	0: "tutorial",
	1: "Hutan",
	2: "Peradaban",
	3: "Metropolitan",
	4: "Nekropolis"
}

func _ready():
	level = show_level[Global.current_level]

func start():
	emit_signal("game_start")
	queue_free()
