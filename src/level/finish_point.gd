extends Area3D

signal ballin

@export var target_loading : String

func _on_body_entered(body):
	$AnimationPlayer.play("finish")
	emit_signal("ballin")
	
func load_next_scene():
	Global.loading(target_loading)
	print("fin")
	
