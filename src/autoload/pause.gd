extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.transition == true && Global.pause == true:
		pass
	else:
		print("nope")
