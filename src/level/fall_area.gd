extends Area3D

var is_it_ballin: bool = false

func _on_body_entered(body):
	if !is_it_ballin:
		Global.restart_level()
		print("restart_level")


func _on_finish_point_ballin():
	is_it_ballin = true
