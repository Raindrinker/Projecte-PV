extends Node2D
class_name Coin

var player_entered = false

func _process(delta: float) -> void:
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if player_entered == false:
		print("Hola que tal")
		self.hide()
		player_entered = false
	
