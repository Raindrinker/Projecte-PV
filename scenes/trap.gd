extends Node2D

@export var arrow_scene: PackedScene

# Dirección en la que dispara la trampa
@export var shoot_direction: Vector2 = Vector2.RIGHT

# Dirección visual del sprite (cómo mira la trampa)
@export var sprite_direction: String = "right"

@export var arrow_speed: float = 300.0

@onready var spawn_point = $ArrowSpawn
@onready var sprite = $Sprite2D


func _ready():
	_apply_sprite_direction()


func shoot():
	print("ARROW SCENE PATH:", arrow_scene.resource_path)
	
	var arrow = arrow_scene.instantiate()
	print("SCRIPT DE LA FLECHA:", arrow.get_script())
	arrow.global_position = spawn_point.global_position
	arrow.direction = shoot_direction.normalized()
	arrow.speed = arrow_speed

	get_parent().add_child(arrow)


func _apply_sprite_direction():
	match sprite_direction:
		"right":
			sprite.flip_h = false
			rotation_degrees = 0

		"left":
			sprite.flip_h = true
			rotation_degrees = 0

		"up":
			sprite.flip_h = false
			rotation_degrees = -90

		"down":
			sprite.flip_h = false
			rotation_degrees = 90
