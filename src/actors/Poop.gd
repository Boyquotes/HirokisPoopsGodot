extends Area2D


export var max_speed := 800
export var min_speed := 200
var velocity := Vector2(0, 0)
var generator := RandomNumberGenerator.new()
var speed := 0
export (PackedScene) var explosion_scene
var not_exploded = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generator.randomize()
	speed = generator.randi_range(max_speed, min_speed)
	position.x = 1024
	position.y = generator.randi_range(5, 550)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < -50:
		queue_free()

func _physics_process(delta):
	if not_exploded:
		var direction = Vector2.ZERO
		
		direction.x -= 1
		
		velocity.x = direction.x * speed * delta
		velocity.y = direction.y * speed * delta
		position += velocity


func _on_Poop_body_entered(body):
	if body is KinematicBody2D:
		body.hurt()


func explode(bullet):
	if not_exploded:
		var explosion = explosion_scene.instance()
		$Explosions.add_child(explosion)
		get_node(".").monitoring = false
		$Poop.visible = false
		not_exploded = false
		bullet.queue_free()
		globals.score += 20
