extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.secret:
		self.text = str("tidak ada rahasia di bawah :D")
