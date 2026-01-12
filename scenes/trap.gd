# trampa.gd
extends Node2D

@export var arrow_scene: PackedScene
@export var arrow_speed: float = 300.0
@export var shoot_direction: Vector2 = Vector2.RIGHT

# PUNTO DE SPAWN MANUAL - arrastra un nodo desde la escena principal
@export var spawn_point: Node2D

# CONTROL DE SPRITE
@export var sprite_flip_h: bool = false  # True para mirar izquierda
@export var sprite_flip_v: bool = false  # True para voltear verticalmente
@export var sprite_rotation: float = 0.0  # Rotación en grados

@onready var sprite = $Sprite2D

func _ready():
	# Aplicar configuración del sprite
	_apply_sprite_settings()

func shoot():
	var arrow = arrow_scene.instantiate()
	
	# Usar posición del nodo que tú elijas
	if spawn_point:
		arrow.global_position = spawn_point.global_position
	else:
		arrow.global_position = global_position
	
	arrow.direction = shoot_direction.normalized()
	arrow.speed = arrow_speed
	
	get_tree().root.add_child(arrow)
	
	# Marcador visual del spawn
	var marcador = Sprite2D.new()
	marcador.global_position = arrow.global_position
	marcador.scale = Vector2(0.5, 0.5)
	get_tree().root.add_child(marcador)
	await get_tree().create_timer(0.5).timeout
	marcador.queue_free()

func _apply_sprite_settings():
	if sprite:
		sprite.flip_h = sprite_flip_h
		sprite.flip_v = sprite_flip_v
		sprite.rotation_degrees = sprite_rotation
