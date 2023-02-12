extends KinematicBody2D

export var speed := 184
var velocity := Vector2(0, 0)
export(AudioStreamMP3) var song := load("res://assets/music/stained_glass.mp3")
export(AudioStreamSample) var crash := load("res://assets/sfx/hiroki_crash.wav")
export(Texture) var texture := load("res://assets/img/hiroki.png")
onready var joystick := get_node("../BoilerPlate/Controls/Joystick")
export (PackedScene) var bullet_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	$crash.stream = crash
	$music.stream = song
	$Image.texture = texture
	
	# Reset globals
	globals.score = 0
	globals.bullets = 10
	
	if OS.get_name() == "HTML5":
		#print("Override FPS to be 30!!")
		Engine.set_target_fps(30)
	else:
		pass
		#print("60 FPS")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	# Fix joystick input
	if joystick.get_output()[0] > .99500:
		direction = Vector2.ZERO
		direction.x += 1
	if joystick.get_output()[0] < -.99500:
		direction = Vector2.ZERO
		direction.x -= 1
	if joystick.get_output()[1] > .99500:
		direction = Vector2.ZERO
		direction.y += 1
	if joystick.get_output()[1] < -.99500:
		direction = Vector2.ZERO
		direction.y -= 1
	
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	velocity = move_and_slide(velocity)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	if globals.bullets > 0:
		var bullet = bullet_scene.instance()
		globals.bullets -= 1
		get_node("../").add_child(bullet)
		bullet.position = $BulletSpawn.position + get_node(".").position


func hurt():
	$crash.play()
	get_tree().paused = true
	yield($crash, "finished")
	get_tree().paused = false
	# reset joystick position
	joystick._reset()
	globals.crash_score = get_node("../BoilerPlate/UI/ScoreLayer/Score").text
	get_tree().change_scene("res://src/menus/Crash.tscn")

func _on_Joystick_use_move_vector(move_vector, delta) -> void:
	move_and_slide(move_vector * speed * delta)
