extends Area3D

signal ballin

@export var target_loading : String

func _on_body_entered(body):
	$AnimationPlayer.play("finish")
	$AudioStreamPlayer3D.play()
	emit_signal("ballin")
	
func load_next_scene():
	Global.loading(target_loading)
	print("fin")
	
