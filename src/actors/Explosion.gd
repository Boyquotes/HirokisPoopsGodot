extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yield($AnimationPlayer, "animation_finished")
	queue_free()
