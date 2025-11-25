extends Sprite2D
class_name Stamina_Level

@export var stamina : float = 2.
var isRestando = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale = Vector2(stamina, 0.5)
	
	if isRestando:
		stamina -= delta
	else:
		stamina += delta
		
	stamina = clamp(stamina, 0, 2)
	
	print(stamina)
	
