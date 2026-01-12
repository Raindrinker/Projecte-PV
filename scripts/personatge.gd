extends CharacterBody2D
class_name Personatge

signal take_damage
signal health_update

var speed : Vector2 = Vector2.ZERO
@export var stamina : Stamina_Level
@export var coin_counter : Control
@export var AmountExp = 1

@export var maxHealth = 10
var currentHealth: int

var speed_modifier : float = 1

var tspeed = Vector2.ZERO

var push_force = 20
var tdash = 0
var thit = 0
var timmunity = 0

var external_force : Vector2
	
var select_interactable
var keys = []

var current_look_dir = "right"

#variables per atacar
var can_slash: bool = true
@export var slash_time: float = 0.2
@export var sword_return_time: float = 0.5
@export var weapon_damage: float = 1.0

@onready var sword = $Body/Body/Sword

@export var shield_stamina_cost := 0.5
var is_defending := false

@onready var shield = $Body/Body/Shield


func _ready():
	currentHealth = maxHealth
	health_update.emit()

func heal(amount: int):
	currentHealth = min(currentHealth + amount, maxHealth)
	health_update.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_shield(delta)
	
	if Input.is_action_just_pressed("interact"):
		if select_interactable:
			select_interactable.interact(self)
	
	if timmunity > 0:
		timmunity -= delta
	
	if thit > 0:
		thit -= delta
		if thit <= 0:
			$Body.modulate = Color.WHITE
	
	if tdash <= 0:
		movement_logic()
		
		if Input.is_action_just_pressed("dash"):
			if speed.length() == 0:
				$Body.squash()

			else:
				if stamina.canspend(AmountExp):
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
	
	if current_look_dir == "right" and get_global_mouse_position().x < global_position.x:
		#animation look_left
		current_look_dir = "left"
	elif current_look_dir == "left" and get_global_mouse_position().x > global_position.x:
		#animation look_right
		current_look_dir = "right"
		
	if get_global_mouse_position().y > global_position.y:
		$Body/Body/Sword.z_index = 1
	else:
		$Body/Body/Sword.z_index = -1
	
	if Input.is_action_just_pressed("attack"):
		sword.slash()
	
func hit(body: Node) -> void:
	if is_defending:
		$Body.squash()
		return
		
	thit = 0.25
	var dir = (global_position - body.global_position).normalized()
	
	if timmunity <= 0:
		$Body.modulate = Color.RED
		currentHealth -= 1
		take_damage.emit()
		health_update.emit()
		print(currentHealth)
		timmunity = 0.5
	
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

func add_key(id):
	if id not in keys:
		keys.append(id)

func coger_moneda():
	$Body.stretch()
	coin_counter.sum_points(1)
	
func handle_shield(delta: float) -> void:
	if Input.is_action_pressed("defend") and stamina.stamina > 0:
		is_defending = true
		shield.visible = true
		
		stamina.stamina -= shield_stamina_cost * delta
		stamina.time = stamina.timeOriginal
	else:
		is_defending = false
		shield.visible = false
