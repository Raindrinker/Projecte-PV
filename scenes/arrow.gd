extends Area2D

@export var direction: Vector2
@export var speed: float = 300.0

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit(self)
	queue_free()
