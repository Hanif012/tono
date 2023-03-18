extends SpringArm3D

@export var target_node: Node3D

func _process(delta):
	if target_node != null:
		set_position(target_node.get_global_position())
