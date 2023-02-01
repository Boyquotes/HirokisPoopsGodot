extends Node2D

export (PackedScene) var poop_scene
export (PackedScene) var cloud_scene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# Every single call, we need to add by a certain amount.
	globals.score += delta * 35
	$UI/ScoreLayer/Score.text = str(int(globals.score))


func _on_Poo_Timer_timeout() -> void:
	var poop = poop_scene.instance()
	$Poops.add_child(poop)


func _on_Cloud_Timer_timeout() -> void:
	var cloud = cloud_scene.instance()
	$Clouds.add_child(cloud)


func _on_Shoot_released() -> void:
	get_node("../Player").shoot()
