extends Node2D

export var max_speed = 200
export var min_speed = 100
var velocity := Vector2(0, 0)
var generator := RandomNumberGenerator.new()
var speed := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generator.randomize()
	speed = generator.randi_range(max_speed, min_speed)
	position.x = 1200
	position.y = generator.randi_range(50, 476)

func _process(delta):
	if position.x < -100:
		queue_free()

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.x -= 1
	
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta
	position += velocity
