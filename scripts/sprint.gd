extends Node

@export var speed : int = 3
@export var stamina : Stamina_Level
var personatge

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	personatge  = get_parent()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("sprint"):
		if stamina.stamina > 0:
			personatge.speed_modifier = speed
			stamina.isRestando = true
		else:
			personatge.speed_modifier = 1
	else:
		personatge.speed_modifier = 1
		stamina.isRestando = false
	
