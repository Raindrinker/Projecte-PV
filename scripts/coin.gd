extends Node2D
class_name Coin

var player_entered = false

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Personatge:
		if player_entered == false:
			print("Hola que tal")
			self.hide()
			player_entered = false
			body.coger_moneda()
		
	
	
