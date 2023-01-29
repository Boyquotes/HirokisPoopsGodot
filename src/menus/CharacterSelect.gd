extends Control

func _ready() -> void:
	pass


func _on_Hiroki_pressed() -> void:
	get_tree().change_scene("res://src/Hiroki.tscn")


func _on_Edward_pressed() -> void:
	get_tree().change_scene("res://src/Edward.tscn")


func _on_Brook_pressed() -> void:
	get_tree().change_scene("res://src/Brook.tscn")
