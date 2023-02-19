extends KinematicBody2D

var speed := 200
var velocity := Vector2(0, 0)
export var song: AudioStreamMP3 = load("res://assets/music/stained_glass.mp3")
export var crash: AudioStreamSample = load("res://assets/sfx/hiroki_crash.wav")
export var texture: Texture = load("res://assets/img/hiroki.png")
onready var joystick := get_node("../BoilerPlate/Controls/Joystick")
export var bullet_scene: PackedScene

export var collision := "Hiroki"
onready var node_name = "%"+collision+"Collision"
onready var collision_node = get_node(node_name)


# Called when the node enters the scene tree for the first time.
func _ready():
	$crash.stream = crash
	$music.stream = song
	$Image.texture = texture
	
	collision_node.disabled = false
	
	# Reset globals
	globals.score = 0
	globals.bullets = 10
	
	if OS.get_name() == "HTML5":
		Engine.set_target_fps(30)

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
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
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


# Cool down variables for joystick not repeating
onready var cooldown = 0
onready var cooldown2 = 0


func shoot():
	if globals.bullets > 0:
		var bullet = bullet_scene.instance()
		globals.bullets -= 1
		get_node("../").add_child(bullet)
		bullet.position = $BulletSpawn.position + get_node(".").position


func hurt():
	$crash.play()
	get_tree().paused = true
	# Reset joystick position
	joystick._reset()
	globals.crash_score = get_node("../BoilerPlate/UI/ScoreLayer/Score").text
	get_node("../BoilerPlate/UI/Crash").visible = true
	get_node("../BoilerPlate/UI/Pause").pause_mode = Node.PAUSE_MODE_INHERIT
	get_node("../BoilerPlate/UI/Crash/Crash").start()
	globals.crashed = true
