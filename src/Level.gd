extends Node2D


func _ready() -> void:
	randomize()


func _on_Button3_pressed() -> void:
	get_tree().quit()
