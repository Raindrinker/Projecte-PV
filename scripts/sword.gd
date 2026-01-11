extends Node2D

@export var slash_time := 0.2
@export var weapon_damage := 1.0

var can_slash := true
var owner_player : Node2D

@onready var hitbox := $Area2D
@onready var anim := $AnimationPlayer


func _ready():
	owner_player = get_parent().get_parent() # Personatge
	hitbox.monitoring = false
	hitbox.body_entered.connect(_on_body_entered)
	anim.process_mode = Node.PROCESS_MODE_ALWAYS


func _process(delta):
	# Seguim el cursor
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)


func slash():
	if not can_slash:
		return

	can_slash = false
	hitbox.monitoring = true
	anim.play("slash")

	await get_tree().create_timer(slash_time).timeout

	hitbox.monitoring = false
	can_slash = true


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(weapon_damage)
