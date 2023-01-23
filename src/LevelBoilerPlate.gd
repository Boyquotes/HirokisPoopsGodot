extends Node2D

export (PackedScene) var poop_scene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_Poo_Timer_timeout() -> void:
	var poop = poop_scene.instance()
	add_child(poop)
