extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 300.0
@export var damage: int = 2

func _ready():
	# 🔥 CONECTAR SIGNAL CORRECTO
	connect("area_entered", Callable(self, "_on_area_entered"))

	# Visual
	if has_node("Sprite2D"):
		$Sprite2D.z_index = 10
		$Sprite2D.rotation = direction.angle()

	# Colisión alineada
	if has_node("CollisionShape2D"):
		$CollisionShape2D.rotation = direction.angle()

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area: Area2D):
	if area == null:
		return

	# La hitbox suele ser hija del personaje
	var character = area.get_parent()

	if character != null and character.has_method("hit"):
		character.hit(self)
		print("💥 Flecha hizo ", damage, " de daño a ", character.name)
		queue_free()
