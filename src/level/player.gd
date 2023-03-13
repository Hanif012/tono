extends CharacterBody2D
@export var player_speed = 10000

func _process(delta):
	var direction = Vector2(
	Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	direction = direction.normalized()
	velocity = direction * player_speed * delta
	move_and_slide()

