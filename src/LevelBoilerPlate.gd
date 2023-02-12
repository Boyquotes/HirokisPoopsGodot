extends Node2D

export var poop_scene: PackedScene
export var cloud_scene: PackedScene


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# Every single call, we need to add by a certain amount.
	globals.score += delta * 35
	$UI/ScoreLayer/Score.text = str(int(globals.score))
	$UI/ScoreLayer/Bullets.text = "Bullets: " + str(globals.bullets)
	
	# FIXME: THIS IS BROKEN LOL FOR JOYSTICKS
	if not int(globals.score) % 1000 and not int(globals.score) == 0:
		# It's a multiple!
		$UI/ExcellentLayer.visible = true
		$UI/ExcellentLayer/ExcellentTimer.start()
		globals.bullets += 10

func _on_Poo_Timer_timeout() -> void:
	var poop = poop_scene.instance()
	$Poops.add_child(poop)


func _on_Cloud_Timer_timeout() -> void:
	var cloud = cloud_scene.instance()
	$Clouds.add_child(cloud)


func _on_Shoot_released() -> void:
	get_node("../Player").shoot()


func _on_ExcellentTimer_timeout() -> void:
	$UI/ExcellentLayer.visible = false
