extends Control

export (PackedScene) var character_select_scene


func _ready() -> void:
	pass

func _on_Quit_pressed() -> void:
	if OS.get_name() == "HTML5":
		return
	get_tree().quit()


func _on_Play_pressed() -> void:
	$Select/Background.visible = true
	$Select/MainUI.visible = true
	$Select.visible = true


func _on_Credits_pressed() -> void:
	get_tree().change_scene("res://src/menus/Credits.tscn")


func _on_Hiroki_pressed() -> void:
	get_tree().change_scene("res://src/Hiroki.tscn")


func _on_Edward_pressed() -> void:
	get_tree().change_scene("res://src/Edward.tscn")


func _on_Brook_pressed() -> void:
	get_tree().change_scene("res://src/Brook.tscn")
