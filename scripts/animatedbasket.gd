# Extending the 'AnimatedBasket' node into here
extends Node3D

# Onready extension
@onready var anim_basket = $AnimationPlayer

# Attempting to create a function that allocates the function playing for each time the ball touches the area set.
func _on_body_entered(_touch):
	_touch = CollisionShape3D
	anim_basket.play("BonesAction_001")
	
func _ready():
	# At _ready the animation plays as a basic 'test' that our rigged object is working and our 3d animation is working.
	# Mainly because it's a base and main aim of the project to have at least that.
	anim_basket.play("BonesAction_001")
