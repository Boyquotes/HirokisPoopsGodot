extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Back".grab_focus()


func _on_Back_pressed() -> void:
	get_tree().change_scene("res://src/menus/Main.tscn")
