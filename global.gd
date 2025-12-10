extends Node

var pause_menu: Node = null

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event):
	if event.is_action_pressed("pause") and pause_menu:
		toggle_pause()

func toggle_pause():
	var is_paused = not get_tree().paused
	get_tree().paused = is_paused
	pause_menu.visible = is_paused
