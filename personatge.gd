extends Node2D

@export var speed : Vector2 = Vector2.ZERO

var tspeed = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		$Body.squash()
		
	speed = Vector2.ZERO
	if Input.is_key_pressed(KEY_RIGHT):
		speed = Vector2.RIGHT
	if Input.is_key_pressed(KEY_LEFT):
		speed = Vector2.LEFT
	if Input.is_key_pressed(KEY_UP):
		speed = Vector2.UP
	if Input.is_key_pressed(KEY_DOWN):
		speed = Vector2.DOWN
	
	
	tspeed = lerp(tspeed, speed, 0.3)
	
	position += delta * 100. * tspeed
