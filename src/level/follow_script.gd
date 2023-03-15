extends Area2D

func _on_body_entered(body):
	if is_in_group("player"):
		position = body.position
		set_process(true)

func _process(delta):
	position = get_parent().get_node("player").position
