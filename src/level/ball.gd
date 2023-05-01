extends RigidBody3D

var force = 50

func _ready():
	set_physics_process(false)
	
func _physics_process(delta):

#	$SpringArm3D.global_transform.origin = lerp(
#		$SpringArm3D.global_transform.origin, global_transform.origin, 0.1
#	)

	if Input.is_action_pressed("ui_up"):
		self.angular_velocity.x -= force*delta
	elif Input.is_action_pressed("ui_down"):
		self.angular_velocity.x += force*delta
	if Input.is_action_pressed("ui_left"):
		self.angular_velocity.z += force*delta
	elif Input.is_action_pressed("ui_right"):
		self.angular_velocity.z -= force*delta

func _on_ui_game_start_game_start():
	set_physics_process(true)
