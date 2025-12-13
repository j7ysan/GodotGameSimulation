extends Area3D

const ROT_SPEED = 360 #degree of rotation per frame
@export var hud : CanvasLayer 
@onready var medal_sound = $AudioStreamPlayer3D

func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED * delta))

func _on_body_entered(_body):
	Global.medals += 1
	hud.get_node("MedalsLabel").text = str(Global.medals) + " / 12"
	set_collision_layer_value(3, false)
	set_collision_mask_value(1, false)
	$AnimationPlayer.play("bounce")
	medal_sound.play()


func reset():
	set_collision_layer_value(3, true)
	set_collision_mask_value(1, true)
	show()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
