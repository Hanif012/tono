extends Area3D

func _on_body_entered(body):
	Global.restart_level()
	print("restart_level")
