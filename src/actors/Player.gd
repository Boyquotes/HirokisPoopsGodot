extends KinematicBody2D

export var speed := 11_000
var velocity := Vector2(0, 0)
export var thirty_fps := false

# Called when the node enters the scene tree for the first time.
func _ready():
	if thirty_fps:
		print("Override fps to be 30!!")
		Engine.set_target_fps(30)
	else:
		print("Proceeding normal. 60 fps.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func hurt():
	$crash.play()

func _on_Joystick_use_move_vector(move_vector, delta) -> void:
	move_and_slide(move_vector * speed * delta)
