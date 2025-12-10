extends Node3D
func _input(event):
	if event.is_action_pressed("pause"):
		print("Escape key pressed!")  # Debug line
		toggle_pause()

func toggle_pause():
	var is_paused = not get_tree().paused
	get_tree().paused = is_paused
	print("Game paused: ", is_paused)  # Debug line
	print("PauseMenu exists: ", has_node("game/PauseMenu"))  # Debug line
	$game/PauseMenu.visible = is_paused
	print("PauseMenu visible set to: ", is_paused)  # Debug line
