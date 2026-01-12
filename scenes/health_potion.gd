extends Area2D

@export var heal_amount := 2  # 1 corazón = 2 de vida

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Personatge and body.currentHealth < body.maxHealth:
		body.heal(heal_amount)
		queue_free()
