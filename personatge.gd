extends CharacterBody2D
class_name Personatge

var speed : Vector2 = Vector2.ZERO
var speed_modifier : float = 1

var tspeed = Vector2.ZERO

var tdash = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if tdash <= 0:
		movement_logic()
		
		if Input.is_action_just_pressed("dash"):
			if speed.length() == 0:
				$Body.squash()
			else:
				speed *= 12
				tdash = 0.25
			
	else:
		
		$Body.squash()
		tdash-=delta
	

	
	if (speed.length() > 0):
		$AnimationPlayer.play("walk")
		$Body.idle_speed = 2
	else:
		$AnimationPlayer.play("idle")
		$Body.idle_speed = 1
	
	tspeed = lerp(tspeed, speed, 0.3)
	
	velocity = tspeed * 100 * speed_modifier
	move_and_slide()


func hit(body: Node) -> void:
	modulate = Color.RED
	
func movement_logic():
	speed = Vector2.ZERO
	if Input.is_key_pressed(KEY_RIGHT):
		speed = Vector2.RIGHT
	if Input.is_key_pressed(KEY_LEFT):
		speed = Vector2.LEFT
	if Input.is_key_pressed(KEY_UP):
		speed = Vector2.UP
	if Input.is_key_pressed(KEY_DOWN):
		speed = Vector2.DOWN


func _on_button_pressed() -> void:
	$Body.stretch()
