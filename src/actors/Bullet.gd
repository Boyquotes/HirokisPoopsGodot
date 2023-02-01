extends Area2D

var velocity := Vector2(0, 0)
var speed := 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.x += 1
	
	velocity.x = direction.x * speed * delta
	velocity.y = direction.y * speed * delta
	position += velocity


func _on_Bullet_area_entered(area: Area2D) -> void:
	area.explode()
	queue_free()
