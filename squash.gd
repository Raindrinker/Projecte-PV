extends Node2D

var t = 0
var press_squash = 1.

@export var idle_intensity : float = 1

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	
	var idle_squash = 1.
	
	t += delta*6
	
	idle_squash = 1 + sin(t)*0.05*idle_intensity
	
	press_squash = lerp(press_squash, 1., 0.1)
		
	var combined_squash = idle_squash*press_squash
		
	scale = Vector2(combined_squash, 1 - (combined_squash-1))

func squash():
	press_squash = 1.5
	
func stretch():
	press_squash = 0.5
