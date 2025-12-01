extends CharacterBody2D
class_name Personatge

var speed : Vector2 = Vector2.ZERO

var speed_modifier : float = 1

var tspeed = Vector2.ZERO

var push_force = 20
var tdash = 0

var external_force : Vector2

signal take_damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if tdash <= 0:
		movement_logic()
		
		if Input.is_action_just_pressed("dash"):
			if speed.length() == 0:
				$Body.squash()
			else:
				speed = speed.normalized() * 12
				tdash = 0.25
			
	else:
		$Body.squash()
		tdash-=delta
	
	if tdash <= 0:
		if (speed.length() > 0):
			$AnimationPlayer.play("walk")
			$Body.idle_speed = 2
		else:
			$AnimationPlayer.play("idle")
			$Body.idle_speed = 1
		
		tspeed = lerp(tspeed, speed, 0.3)
		
		velocity = tspeed * 100 * speed_modifier
	else:
		velocity = speed * 100
	
	velocity += external_force
	external_force *= 0.93
	
	move_and_slide()
	
	var collision : KinematicCollision2D = get_last_slide_collision()
	if collision != null:
		if collision.get_collider() is Caixa:
			collision.get_collider().apply_central_force(-collision.get_normal() * push_force)

func hit(body: Node) -> void:
	modulate = Color.RED
	take_damage.emit()
	
	var dir = (global_position - body.global_position).normalized()
	
	external_force += dir * 500
	$Body.squash()
	
func movement_logic():
	speed = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		speed += Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		speed += Vector2.LEFT
	if Input.is_action_pressed("move_up"):
		speed += Vector2.UP
	if Input.is_action_pressed("move_down"):
		speed += Vector2.DOWN
	
	speed = speed.normalized()

func _on_button_pressed() -> void:
	$Body.stretch()
