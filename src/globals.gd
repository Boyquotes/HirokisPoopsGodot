extends Node


var crash_score := 0
var score: float = 0.0
var bullets: int = 10
var crashed: bool = false

func _ready() -> void:
	self.pause_mode = Node.PAUSE_MODE_PROCESS
	# Fullscreen in editor
	if not OS.has_feature("standalone"):
		OS.set_window_fullscreen(true)	

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		OS.set_window_fullscreen(!OS.window_fullscreen)
