extends RigidBody2D
class_name Caixa

@export var max_health := 2
var health := max_health

# Llamada cuando la caja recibe daño
func take_damage(amount: float) -> void:
	health -= int(amount)
	if health <= 0:
		queue_free()  # La caja desaparece
