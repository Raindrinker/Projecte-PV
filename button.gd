extends Interactable

@export var boton: String
signal button_toggled(button_name: String, state: bool)
var cliked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cliked = false

func interact(player):
	print("boto")
	if cliked:
		cliked = false
	else:
		cliked = true
	emit_signal("button_toggled", boton, cliked)
func _process(delta: float) -> void:
	if cliked:
		modulate = Color(0.144, 0.144, 0.144, 1.0)
	else:
		modulate = Color(0.991, 0.991, 0.991, 1.0)
