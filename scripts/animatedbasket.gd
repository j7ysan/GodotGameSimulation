# Extending the 'AnimatedBasket' node into here
extends Node3D

# Onready extension
@onready var anim_basket = $AnimationPlayer
@onready var sound_basket = $AudioStreamPlayer3D
@onready var timer_basket = $Timer


func _on_area_3d_body_entered(body: Node3D) -> void:
	anim_basket.play("BonesAction_001")
	sound_basket.play()
	timer_basket.start()
	
func _ready():
	# At _ready the animation plays as a basic 'test' that our rigged object is working and our 3d animation is working.
	# Mainly because it's a base and main aim of the project to have at least that.
	anim_basket.play("BonesAction_001")
