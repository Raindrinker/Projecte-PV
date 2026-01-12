# flecha.gd
extends Area2D

var direction = Vector2.RIGHT
var speed = 300.0

func _ready():
	print("=== FLECHA CREADA ===")
	
	# 1. Verificar que existe Sprite2D
	if not has_node("Sprite2D"):
		print("❌ ERROR: No hay Sprite2D en esta flecha")
		# Crear uno de emergencia
		var sprite_emergencia = Sprite2D.new()
		sprite_emergencia.texture = preload("res://icon.svg")
		sprite_emergencia.scale = Vector2(3, 3)
		sprite_emergencia.modulate = Color.RED
		add_child(sprite_emergencia)
		return
	
	# 2. Hacer flecha visible
	var sprite = $Sprite2D
	sprite.modulate = Color(1, 0, 0, 1)  # Rojo SÓLIDO
	sprite.scale = Vector2(10, 10)  # 10 veces más grande
	sprite.z_index = 1000  # Para que esté encima de todo
	
	# 3. Crear un círculo rojo adicional (por si acaso)
	var circulo = Sprite2D.new()
	circulo.texture = preload("res://icon.svg")
	circulo.scale = Vector2(8, 8)
	circulo.modulate = Color(1, 0, 0, 1)
	add_child(circulo)
	
	print("✅ Flecha roja gigante creada")

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	queue_free()
