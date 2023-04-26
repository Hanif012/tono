extends Control

@onready var timer_display = $timer/timer_label
@onready var anim_player = $AnimationPlayer
@onready var ui_pause = $pause
var timer = 0.0

func _ready():
	ui_pause.visible = false

func _process(delta):
	timer += delta
	timer_display.text = get_timer_str()

func get_timer_str():
	return str(timer).pad_decimals(1) + "s"

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pause") and !Global.pause:
			ui_pause.visible = true
			Global.pause = true
			get_tree().paused = true
			print("paused")
			$AnimationPlayer.play("pause")
