extends Control


onready var current := "h"



func _ready() -> void:
	get_node(".").visible = false
	$MainUI.visible = false
	$Background.visible = false


func _on_Hiroki_entered() -> void:
	current = "h"
	$MainUI/Portrait.texture = load("res://assets/img/portraits/hiroki-portrait.png")

func _on_Edward_entered() -> void:
	current = "e"
	$MainUI/Portrait.texture = load("res://assets/img/portraits/edward-portrait.png")

func _on_Brook_entered() -> void:
	current = "b"
	$MainUI/Portrait.texture = load("res://assets/img/portraits/brook-portrait.png")

func _on_Hiroki_pressed() -> void:
	if OS.get_name() == "HTML5" or OS.get_name() == "Android":
		yield(get_tree().create_timer(.2), "timeout")
	get_tree().change_scene("res://src/Hiroki.tscn")


func _on_Edward_pressed() -> void:
	if OS.get_name() == "HTML5" or OS.get_name() == "Android":
		yield(get_tree().create_timer(.2), "timeout")
	get_tree().change_scene("res://src/Edward.tscn")


func _on_Brook_pressed() -> void:
	if OS.get_name() == "HTML5" or OS.get_name() == "Android":
		yield(get_tree().create_timer(.2), "timeout")
	get_tree().change_scene("res://src/Brook.tscn")

func _on_Mario_pressed() -> void:
	if OS.get_name() == "HTML5" or OS.get_name() == "Android":
		yield(get_tree().create_timer(.2), "timeout")
	get_tree().change_scene("res://src/Mario.tscn")

func _on_Conner_pressed() -> void:
	if OS.get_name() == "HTML5" or OS.get_name() == "Android":
		yield(get_tree().create_timer(.2), "timeout")
	get_tree().change_scene("res://src/Conner.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_right") and current == "e":
		activate_mario()
	if Input.is_action_pressed("ui_left") and current == "h":
		activate_conner()


func activate_mario():
	if not $"%Mario".visible:
		$"%MarioSound".play()
		$"%Mario".visible = true
		$"%Mario".grab_focus()
		$MainUI/Portrait.texture = load("res://assets/img/portraits/mario-portrait.png")

func activate_conner():
	if not $"%Conner".visible:
		$"%ConnerSound".play()
		$"%Conner".visible = true
		$"%Conner".grab_focus()
		$MainUI/Portrait.texture = load("res://assets/img/portraits/conner-portrait.png")

func _on_Mario_entered() -> void:
	$"%Mario".grab_focus()
	$MainUI/Portrait.texture = load("res://assets/img/portraits/mario-portrait.png")

func _on_Conner_entered() -> void:
	$"%Conner".grab_focus()
	$MainUI/Portrait.texture = load("res://assets/img/portraits/conner-portrait.png")
