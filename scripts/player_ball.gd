extends RigidBody3D 

var can_boost:bool = true
var peak:float = 0.0

func _physics_process(delta):
	peak = max(position.y, peak)
	
	movement(delta)
	boost(delta)
	shadow()
	
	if get_contact_count() > 0:
		can_boost = true
		peak = 0.0

func movement(delta):
	var vec:Vector2 = Input.get_vector("right", "left", "down", "up")
	linear_velocity.x = move_toward(linear_velocity.x, vec.normalized().x * 40, delta)
	linear_velocity.z = move_toward(linear_velocity.z, vec.normalized().y * 40, delta)

func boost(delta):
	if Input.is_action_just_pressed("boost") and can_boost:
		if peak < 0.4:
			linear_velocity.y = 6
		else:
			linear_velocity.y = -7
			
			var vec:Vector2 = Input.get_vector("right", "left", "down", "up")
			linear_velocity.x = linear_velocity.x * 0.5 + vec.normalized().x * 2
			linear_velocity.z = linear_velocity.z * 0.5 + vec.normalized().y * 2
			
			can_boost = false

func shadow():
	$Shadow.position.x = position.x
	$Shadow.position.z = position.z
	var scale = max(1 - (position.y * 0.1), 0.25) * 0.4
	$Shadow.scale.x = scale
	$Shadow.scale.y = scale
