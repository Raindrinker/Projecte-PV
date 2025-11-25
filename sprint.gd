extends Node

@export var speed : int = 3
var personatge

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	personatge  = get_parent()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("sprint"):
		personatge.speed_modifier = speed
	else:
		personatge.speed_modifier = 1
	
