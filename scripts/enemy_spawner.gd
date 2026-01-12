extends Node2D

@export var enemy_scene: PackedScene        # assignarem Enemy.tscn
@export var player: Node2D                  # referència al Personatge
@export var spawn_interval: float = 3.0     # segons entre enemics
@export var max_enemies: int = 10           # límit simultani (opcional)

var _time_passed: float = 0.0
var _current_enemies: int = 0

func _process(delta: float) -> void:
	if enemy_scene == null or player == null:
		return
	
	_time_passed += delta
	
	if _time_passed >= spawn_interval:
		_time_passed = 0.0
		if _current_enemies < max_enemies:
			spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	# posar l’enemic a la mateixa capa que el spawner
	get_parent().add_child(enemy)
	
	# col·locar-lo on està el spawner
	enemy.global_position = global_position
	
	# dir-li a qui ha de perseguir
	enemy.chasee = player
	
	_current_enemies += 1
	
	# quan mori, volem restar el comptador
	enemy.tree_exited.connect(_on_enemy_tree_exited)

func _on_enemy_tree_exited():
	_current_enemies = max(_current_enemies - 1, 0)
