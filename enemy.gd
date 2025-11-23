extends CharacterBody2D

@export var chasee : Node2D

func _process(delta: float) -> void:
	
	var dir = chasee.global_position - global_position
	
	velocity = dir.normalized() * 50
	move_and_slide()
	
	var collision : KinematicCollision2D = get_last_slide_collision()
	if collision != null:
		if collision.get_collider() is Personatge:
			collision.get_collider().hit(self)
