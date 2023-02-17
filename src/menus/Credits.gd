extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Back".grab_focus()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_down"):
		$"%ScrollContainer".scroll_vertical += 8
	if Input.is_action_pressed("ui_up"):
		$"%ScrollContainer".scroll_vertical -= 8
	$"%ScrollContainer".scroll_vertical += 1

func _on_Back_pressed() -> void:
	get_tree().change_scene("res://src/menus/Main.tscn")
