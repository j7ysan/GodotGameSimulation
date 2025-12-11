extends Control

<<<<<<< HEAD

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
=======
func _process(_delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

@onready var master_slider = $MarginContainer/VBoxContainer/Options_Tabs/Sound/MasterSlider
@onready var music_slider = $MarginContainer/VBoxContainer/Options_Tabs/Sound/MusicSlider
@onready var resolution_option = $MarginContainer/VBoxContainer/Options_Tabs/Video/Options_Container/ResolutionOption
@onready var fullscreen_check = $MarginContainer/VBoxContainer/Options_Tabs/Video/FullscreenCheck

var master_bus_index
var music_bus_index

func _ready():
	master_bus_index = AudioServer.get_bus_index("Master")
	music_bus_index = AudioServer.get_bus_index("Music")
	
	_setup_ui_connections()
	_populate_resolutions()
	
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus_index))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus_index))
	
func _setup_ui_connections():
	master_slider.value_changed.connect(_on_master_volume_changed)
	music_slider.value_changed.connect(_on_music_volume_changed)
	
	fullscreen_check.toggled.connect(_on_fullscreen_toggled)
	resolution_option.item_selected.connect(_on_resolution_selected)

func _on_master_volume_changed(value):
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(master_bus_index, value < 0.05)

func _on_music_volume_changed(value):
	AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(music_bus_index, value < 0.05)
	
func _populate_resolutions():
	resolution_option.add_item("1920x1080")
	resolution_option.add_item("1280x720")
	resolution_option.add_item("800x600")

func _on_fullscreen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_resolution_selected(index):
	var text = resolution_option.get_item_text(index)
	var values = text.split("x")
	var width = int(values[0])
	var height = int(values[1])
	
	DisplayServer.window_set_size(Vector2i(width, height))
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = DisplayServer.window_get_size()
	DisplayServer.window_set_position(screen_center - window_size / 2)
>>>>>>> GUI-Controls-Options
