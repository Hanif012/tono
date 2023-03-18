extends RigidBody3D

var force = 40
var rotate_force = 20

func _ready():
	pass
	
func _physics_process(delta):

#	$SpringArm3D.global_transform.origin = lerp(
#		$SpringArm3D.global_transform.origin, global_transform.origin, 0.1
#	)

	if Input.is_action_pressed("ui_up"):
		apply_central_force(Vector3(20, 0, 0))
#	elif Input.is_action_pressed("ui_down"):
#		self.angular_velocity.x += force*delta
	if Input.is_action_pressed("ui_left"):
		self.angular_velocity.z += force*delta
	elif Input.is_action_pressed("ui_right"):
		self.angular_velocity.z -= force*delta

	if Input.is_action_pressed("left_awsd"):
		self.rotation_degrees.y -= delta*rotate_force

