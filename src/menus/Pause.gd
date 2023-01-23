extends Control

onready var PauseButton := get_node("../PauseButton")


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("pause"):
		var new_pause_state := not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_Button_pressed() -> void:
	var new_pause_state := not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	PauseButton.visible = !new_pause_state

func _on_Button3_pressed() -> void:
	get_tree().quit()
