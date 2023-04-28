extends Area3D

signal ballin

@export var target_loading : String

func _on_body_entered(body):
	$AnimationTree.set("parameters/Blend2/blend_amount", 1.0)
	emit_signal("ballin")
	
func load_next_scene():
	Global.loading(target_loading)
	print("fin")
