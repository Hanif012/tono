extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("pause") and Global.pause:
			Global.pause = false
			await get_tree().create_timer(0.1).timeout
			self.visible = false
			get_tree().paused = false
			print("resume")
