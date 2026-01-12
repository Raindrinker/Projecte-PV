extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 300.0
@export var damage: int = 2

func _ready():
	# 🔥 CONECTAR SIGNAL (ESTO ES LO QUE FALTABA)
	connect("body_entered", Callable(self, "_on_body_entered"))

	# Configuración visual
	if has_node("Sprite2D"):
		$Sprite2D.z_index = 10
		$Sprite2D.visible = true
		$Sprite2D.position = Vector2.ZERO
		$Sprite2D.rotation = direction.angle()
	
	# Rotar colisión
	if has_node("CollisionShape2D"):
		$CollisionShape2D.rotation = direction.angle()

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body):
	if body == null:
		return
	
	if body.has_method("hit"):
		body.hit(self)
		print("💥 Flecha hizo ", damage, " de daño a ", body.name)

	queue_free()
