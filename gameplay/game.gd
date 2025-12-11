extends Node3D

@onready var player:RigidBody3D = $PlayerBall
@onready var camera = $Vision

func _physics_process(delta):
	camera.position = lerp(camera.position, player.position, delta)
