extends Area3D

var touchdown: bool = false

func _on_body_entered(body):
	if !touchdown:
		Global.audio_squick()
		print("restart_level")
		await get_tree().create_timer(2).timeout 
		Global.restart_level()

func _on_finish_point_ballin():
	touchdown = true
