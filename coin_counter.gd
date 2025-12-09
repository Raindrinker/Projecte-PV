extends Label
class_name CoinCounter

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sum_points(quantity): 
	points += quantity
	text = str(points)


func _on_personatge_coins_update() -> void:
	pass # Replace with function body.
