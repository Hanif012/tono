extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Global.level_2:
		$VBoxContainer/level_2.set_disabled(true)
	else:
		print("")
	if !Global.level_3:
		$VBoxContainer/level_3.set_disabled(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_pressed():
	if Global.level_1:
		print("level_1")
	else:
		print("false")

func _on_level_2_pressed():
	if Global.level_2:
		print("level_2")
	else:
		print("false")

func _on_level_3_pressed():
	if Global.level_3:
		print("level_3")
	else:
		print("false")
