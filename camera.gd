extends Camera2D

@export var player : Node2D

var tshake = 0

var shake_offset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if tshake > 0:
		shake_offset = Vector2.DOWN.rotated(randf_range(0, 2*PI)) * randf_range(0, 1) * 5
		tshake -= delta
	else:
		shake_offset = Vector2.ZERO
	
	
	global_position = lerp(global_position, player.global_position, 0.1) + shake_offset


func _on_personatge_take_damage() -> void:
	tshake = 0.2
