extends Area3D

@export var target_loading : String

func _on_body_entered(body):
		Global.loading(target_loading)
		print("fin")
