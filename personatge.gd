extends RigidBody2D

var speed : Vector2 = Vector2.ZERO

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
	
	if (speed.length() > 0):
		$AnimationPlayer.play("walk")
		$Body.idle_speed = 2
	else:
		$AnimationPlayer.play("idle")
		$Body.idle_speed = 1
	
	tspeed = lerp(tspeed, speed, 0.3)
	
	move_and_collide(tspeed)


func _on_body_entered(body: Node) -> void:
	modulate = Color.RED


func _on_button_pressed() -> void:
	$Body.stretch()
