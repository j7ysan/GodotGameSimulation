extends CharacterBody3D 

const SPEED = 25.0
const ACCELERATION = 20.0  # How fast you reach top speed
const FRICTION = 5.0       # How fast you slow down (rolling resistance)
const GRAVITY = 30.0       # Higher gravity feels snappier for sports balls
const FLOOR_BOUNCE = 0.75   # Retain 75% height on floor hits (Automatic Bounce)
const WALL_BOUNCE = 0.8     # Retain 80% speed on wall hits
const BALL_RADIUS = 0.42
const ANIM_SCALE = 0.75

@onready var ball_mesh = $BasketballBall

var can_boost: bool = true
var peak: float = 0.0

func _physics_process(delta):
	if not is_on_floor():
			velocity.y -= GRAVITY * delta
	
	peak = max(position.y, peak)
	
	handle_movement(delta)
	
	var vel_before_collision = velocity
	var did_manual_dribble = handle_dribble_boost()
	
	move_and_slide()
	
	if is_on_wall():
		var collision = get_last_slide_collision()
		if collision:
			var normal = collision.get_normal()
			# Reflect the PRE-collision velocity off the wall
			# We only modify X and Z (horizontal) for wall bounces usually
			var reflected = vel_before_collision.bounce(normal)
			velocity.x = reflected.x * WALL_BOUNCE
			velocity.z = reflected.z * WALL_BOUNCE
			
	if is_on_floor(): 
		can_boost = true
		peak = 0.0
		
		if not did_manual_dribble and vel_before_collision.y < -2.0:
			velocity.y = -vel_before_collision.y * FLOOR_BOUNCE
		
	handle_spin(delta)
	animate()
	
func handle_movement(delta):
	var vec: Vector2 = Input.get_vector("right", "left", "down", "up")
	var target_dir = Vector3(vec.x, 0, vec.y).normalized()

	if target_dir:		
		velocity.x = move_toward(velocity.x, target_dir.x * SPEED, ACCELERATION * delta)
		velocity.z = move_toward(velocity.z, target_dir.z * SPEED, ACCELERATION * delta)
	
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		velocity.z = move_toward(velocity.z, 0, FRICTION * delta)

func handle_dribble_boost() -> bool:
	if Input.is_action_just_pressed("boost") and can_boost:
		if peak < 1.0: # If we are low to the ground...
			velocity.y = 15.0 # Pop it up (The Jump)
		else: # If we are high in the air...
			velocity.y = -20.0 # Slam it down (The Dribble)
			
			# Add a little forward dash when slamming
			var vec: Vector2 = Input.get_vector("right", "left", "down", "up")
			velocity.x = velocity.x * 0.5 + vec.normalized().x * 5.0
			velocity.z = velocity.z * 0.5 + vec.normalized().y * 5.0
			
			can_boost = false
		return true
	return false

func handle_spin(delta):
	# Calculate horizontal speed (we ignore vertical speed for rolling rotation)
	var horizontal_vel = Vector3(velocity.x, 0, velocity.z)
	var speed = horizontal_vel.length()
	
	# Only rotate if moving to avoid jitter
	if speed > 0.1:
		# The axis of rotation is perpendicular to the direction of movement.
		# Cross Product of (Velocity x Down) gives the axis pointing Left relative to movement.
		var rotation_axis = horizontal_vel.cross(Vector3.DOWN).normalized()
		
		# Calculate rotation angle based on arc length formula: 
		# Angle = (Velocity * Time) / Radius
		var rotate_angle = (speed * delta) / BALL_RADIUS
		
		# Apply the rotation globally to the mesh node
		ball_mesh.global_rotate(rotation_axis, rotate_angle)

func animate():
	$BasketballBall/Cube.scale.x = 100 - (abs(velocity.y) * ANIM_SCALE)
	$BasketballBall/Cube.scale.z = 100 + (abs(velocity.y) * ANIM_SCALE)
	$BasketballBall/Cube.scale.x += abs(Vector2(velocity.x, velocity.z).length()) * ANIM_SCALE
	pass
