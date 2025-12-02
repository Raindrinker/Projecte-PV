extends Sprite2D
class_name Interactable


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.get_name)
	if body is Personatge:
		body.select_interactable = self
		modulate = Color.YELLOW
		print("cartel entra")
			
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Personatge:
		if body.select_interactable == self:
			body.select_interactable = null
			modulate = Color.WHITE
			print("cartel surt")
	
func interact(player):
	print("interact")
