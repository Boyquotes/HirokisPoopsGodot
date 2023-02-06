extends Node


var crash_score := 0
var score: float = 0.0
var bullets: int = 10

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("fullscreen"):
		OS.set_window_fullscreen(!OS.window_fullscreen)
