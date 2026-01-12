extends Area2D

@export var sprite_normal: Texture2D
@export var sprite_pressed: Texture2D

@export var traps: Array[Node] = []

@onready var sprite = $Sprite2D

var is_pressed = false

func _ready():
	sprite.texture = sprite_normal
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body is Personatge and not is_pressed:
		is_pressed = true
		sprite.texture = sprite_pressed
		_activate_traps()

func _on_body_exited(body):
	if body is Personatge and is_pressed:
		is_pressed = false
		sprite.texture = sprite_normal

func _activate_traps():
	for trap in traps:
		if trap != null:
			trap.shoot()
