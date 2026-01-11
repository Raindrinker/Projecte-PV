extends CharacterBody2D


@export var chasee : Node2D
@export var totalHealth : float = 3.5
var health = totalHealth

var external_force : Vector2

func _process(delta: float) -> void:
	
	var dir = chasee.global_position - global_position
	
	velocity = dir.normalized() * 50
	
	velocity += external_force
	external_force *= 0.93
	move_and_slide()
	
	var collision : KinematicCollision2D = get_last_slide_collision()
	if collision != null:
		if collision.get_collider() is Personatge:
			collision.get_collider().hit(self)
			external_force = -dir.normalized() * 500
	
func take_damage(weapon_damage: float):
	$AnimationPlayer.play("take_damage")
	health -= weapon_damage
	print("damage")
	
	if health <= 0.0:
		queue_free()
