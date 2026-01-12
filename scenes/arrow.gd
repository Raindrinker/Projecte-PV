extends Area2D

var direction = Vector2.RIGHT
var speed = 300.0

func _ready():
	$Sprite2D.z_index = 10
	$Sprite2D.visible = true
	$Sprite2D.top_level = false
	$Sprite2D.position = Vector2.ZERO
	$Sprite2D.rotation = direction.angle()

	print("💥 FLECHA creada en:", global_position)

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	queue_free()
