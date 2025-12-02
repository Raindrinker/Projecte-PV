extends Interactable
class_name Key

@export var key_id : String = "" 
var player_haskey = false
var player_ref = null
var is_picked_up = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_picked_up and player_ref:
		global_position = player_ref.global_position + Vector2(0, -16)

func interact(player):
	print("clau")
	if is_picked_up == true:
		return
	is_picked_up = true	
	player_haskey = true
	player_ref = player
	
	# Afegeix la clau inventari
	player.add_key(key_id)
	
	#Desactivar collisions
	if $Area2D:
		$Area2D.monitoring = false
		$Area2D.monitorable = false
	if $Area2D/CollisionShape2D:
		$Area2D/CollisionShape2D.disabled = true
