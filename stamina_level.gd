extends Sprite2D
class_name Stamina_Level

@export var stamina : float = 2.
var staminaOriginal = stamina
var isRestando = false
@export var time : float = 1
var timeOriginal = time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale = Vector2(stamina, 0.5)
	
	if isRestando:
		stamina -= delta
	if isRestando == false:
		if stamina == 0:
			time -= delta
		if time < 0:
			stamina += delta
			if stamina == staminaOriginal:
				time = timeOriginal
		
	stamina = clamp(stamina, 0, 2)
	
	
func canspend(amount):
	if stamina >= amount:
		stamina -= amount
		return true
	return false
		
	
