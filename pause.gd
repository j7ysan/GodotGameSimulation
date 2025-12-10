extends CanvasLayer

func _ready():
	hide()  # Start hidden
	Global.pause_menu = self  # Register with global

func _on_resume_pressed():
	Global.toggle_pause()  

func _on_options_pressed():
	get_tree().paused = false
	hide()
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_quit_pressed():
	get_tree().paused = false
	hide()
	get_tree().change_scene_to_file("res://main_menu.tscn")
