extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node(".").visible = false
	$MainUI.visible = false
	$Background.visible = false


func _on_Hiroki_mouse_entered() -> void:
	$MainUI/Portrait.texture = load("res://assets/img/portraits/hiroki-portrait.png")

func _on_Edward_mouse_entered() -> void:
	$MainUI/Portrait.texture = load("res://assets/img/portraits/edward-portrait.png")

func _on_Brook_mouse_entered() -> void:
	$MainUI/Portrait.texture = load("res://assets/img/portraits/brook-portrait.png")


func _on_Hiroki_pressed() -> void:
	get_tree().change_scene("res://src/Hiroki.tscn")


func _on_Edward_pressed() -> void:
	get_tree().change_scene("res://src/Edward.tscn")


func _on_Brook_pressed() -> void:
	get_tree().change_scene("res://src/Brook.tscn")
