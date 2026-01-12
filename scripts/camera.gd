extends Camera2D

@export var player: Node2D

# -------------------------------
# Limites de cada sala (en píxeles)
# -------------------------------
# Sala 1
@export var sala1_left: int = -130
@export var sala1_right: int = 1675
@export var sala1_top: int = -325
@export var sala1_bottom: int = 730

# Sala 2
@export var sala2_left: int = 525
@export var sala2_right: int = 1180
@export var sala2_top: int = -640
@export var sala2_bottom: int = -190

# Sala 3
@export var sala3_left: int = 35
@export var sala3_right: int = 1675
@export var sala3_top: int = -1235
@export var sala3_bottom: int = -615

# Sala 4
@export var sala4_left: int = -463
@export var sala4_right: int = 2170
@export var sala4_top: int = -2379
@export var sala4_bottom: int = 1235

# Sala 5 la del costat de Sala1
@export var sala5_left: int = -1450
@export var sala5_right: int = -130
@export var sala5_top: int = -196
@export var sala5_bottom: int = 730

# -------------------------------
# Shake
# -------------------------------
var tshake := 0.0
var shake_offset := Vector2.ZERO

func _ready() -> void:
	enabled = true
	set_sala1_limits() # Arrancamos en sala 1

func _process(delta: float) -> void:
	update_sala_by_player()

	# Shake
	if tshake > 0.0:
		shake_offset = Vector2.DOWN.rotated(randf_range(0.0, TAU)) * randf_range(0.0, 1.0) * 5.0
		tshake -= delta
	else:
		shake_offset = Vector2.ZERO

	# Seguimiento suave del jugador
	global_position = lerp(global_position, player.global_position, 0.1) + shake_offset

# -------------------------------
# Cambio de límites según la sala
# -------------------------------
func update_sala_by_player() -> void:
	# Sala 1
	if player.global_position.x >= sala1_left and player.global_position.x <= sala1_right \
	and player.global_position.y >= sala1_top and player.global_position.y <= sala1_bottom:
		set_sala1_limits()
	# Sala 2
	elif player.global_position.x >= sala2_left and player.global_position.x <= sala2_right \
	and player.global_position.y >= sala2_top and player.global_position.y <= sala2_bottom:
		set_sala2_limits()
	# Sala 3
	elif player.global_position.x >= sala3_left and player.global_position.x <= sala3_right \
	and player.global_position.y >= sala3_top and player.global_position.y <= sala3_bottom:
		set_sala3_limits()
	# Sala 4
	elif player.global_position.x >= sala4_left and player.global_position.x <= sala4_right \
	and player.global_position.y >= sala4_top and player.global_position.y <= sala4_bottom:
		set_sala4_limits()
	# Sala 4
	elif player.global_position.x >= sala5_left and player.global_position.x <= sala5_right \
	and player.global_position.y >= sala5_top and player.global_position.y <= sala5_bottom:
		set_sala5_limits()

func set_sala1_limits() -> void:
	limit_left = sala1_left
	limit_right = sala1_right
	limit_top = sala1_top
	limit_bottom = sala1_bottom

func set_sala2_limits() -> void:
	limit_left = sala2_left
	limit_right = sala2_right
	limit_top = sala2_top
	limit_bottom = sala2_bottom
	
func set_sala3_limits() -> void:
	limit_left = sala3_left
	limit_right = sala3_right
	limit_top = sala3_top
	limit_bottom = sala3_bottom
	
func set_sala4_limits() -> void:
	limit_left = sala4_left
	limit_right = sala4_right
	limit_top = sala4_top
	limit_bottom = sala4_bottom

func set_sala5_limits() -> void:
	limit_left = sala5_left
	limit_right = sala5_right
	limit_top = sala5_top
	limit_bottom = sala5_bottom

# -------------------------------
# Shake cuando el personaje recibe daño
# -------------------------------
func _on_personatge_take_damage() -> void:
	tshake = 0.2
