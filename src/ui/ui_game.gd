extends Control
@export var level_index: int   = 0
@onready var timer_display     = $timer/timer_label
@onready var anim_player       = $AnimationPlayer
@onready var ui_pause          = $pause
var timer = 0.0

func _ready():
	ui_pause.visible = false
#	var audio = {
#		0:Global
#	}
#	audio(level_index)
#
func _process(delta):
	timer += delta
	timer_display.text = get_timer_str()

func get_timer_str():
	return str(timer).pad_decimals(1) + "s"

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pause") and !Global.pause:
			Global.audio_click_ui()
			ui_pause.visible = true
			Global.pause = true
			get_tree().paused = true
			print("paused")
			$AnimationPlayer.play("pause")

func _on_finish_point_ballin():
	Global.update_highscore(timer, level_index)
	print("update highscore %.2f %d" % [timer, level_index])
	
