extends Button

@export var action_name: String = ""

var is_remapping = false

func _ready():
	display_current_key()
	pressed.connect(_on_button_pressed)

func display_current_key():
	var events = InputMap.action_get_events(action_name)
	if events.size() > 0:
		text = events[0].as_text().trim_suffix(" (Physical)")
	else:
		text = "None"

func _on_button_pressed():
	is_remapping = true
	text = "Press any key..."

func _input(event):
	if is_remapping:
		if event is InputEventKey or event is InputEventMouseButton:
			if event.is_pressed():
				InputMap.action_erase_events(action_name)
				InputMap.action_add_event(action_name, event)
				display_current_key()
				is_remapping = false
				get_viewport().set_input_as_handled()
