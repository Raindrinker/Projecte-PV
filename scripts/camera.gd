extends Camera2D

@export var player: Node2D

# --- SALA 1 ---
@export var sala1_left: int = 0
@export var sala1_right: int = 2000

# --- SALA 2 ---
@export var sala2_left: int = 2000
@export var sala2_right: int = 4096

# Límites verticales (comunes)
@export var limit_top_manual: int = 0
@export var limit_bottom_manual: int = 2048

var tshake := 0.0
var shake_offset := Vector2.ZERO

func _ready() -> void:
	enabled = true
	set_sala_1()

func _process(delta: float) -> void:
	update_sala_by_player()

	if tshake > 0.0:
		shake_offset = Vector2.DOWN.rotated(randf_range(0.0, TAU)) * randf_range(0.0, 1.0) * 5.0
		tshake -= delta
	else:
		shake_offset = Vector2.ZERO

	global_position = lerp(global_position, player.global_position, 0.1) + shake_offset

# ------------------------------------------------

func update_sala_by_player() -> void:
	# Cambia esto según dónde esté el corte entre salas
	if player.global_position.x < sala2_left:
		set_sala_1()
	else:
		set_sala_2()

func set_sala_1() -> void:
	limit_left = sala1_left
	limit_right = sala1_right
	limit_top = limit_top_manual
	limit_bottom = limit_bottom_manual

func set_sala_2() -> void:
	limit_left = sala2_left
	limit_right = sala2_right
	limit_top = limit_top_manual
	limit_bottom = limit_bottom_manual

func _on_personatge_take_damage() -> void:
	tshake = 0.2
