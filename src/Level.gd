extends Node2D

export (PackedScene) var poop_scene


func _ready() -> void:
	randomize()


func _on_poo_timer_timeout() -> void:
	var poop = poop_scene.instance()
	add_child(poop)


func _on_Button3_pressed() -> void:
	get_tree().quit()
