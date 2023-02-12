extends Control

onready var PauseButton := get_node("../PauseButton")
onready var joystick := get_node("../../../../Controls/Joystick")


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		$"%Unpause".grab_focus()

func _on_Button_pressed() -> void:
	toggle_pause()


func toggle_pause():
	# Reset joystick
	joystick._reset()
	var new_pause_state := not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	PauseButton.visible = !new_pause_state


func _on_Quit_pressed() -> void:
	if OS.get_name() == "HTML5":
		return
	get_tree().quit()


func _on_Main_pressed() -> void:
	toggle_pause()
	get_tree().change_scene("res://src/menus/Main.tscn")
