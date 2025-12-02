extends Control

@export var personatge : Personatge
@export var heart_scn : PackedScene	

var hearts : Array[Node]

func _ready():
	
	var n_hearts = personatge.maxHealth / 2
	
	for i in n_hearts:
		var heart = heart_scn.instantiate()
		$HBoxContainer.add_child(heart)
		hearts.append(heart)
	
	if personatge:
		personatge.health_update.connect(update_healthBar)
		update_healthBar()
	else:
		print("Error: Personatge no asignado a la barra de vida")
	
func update_healthBar():
	
	var player_health = personatge.currentHealth
	
	var player_health_halves = player_health/2.
	
	for i in hearts.size():
		
		var health_necessary_for_full_heart = (i+1)*2
		var health_necessary_for_half_heart = health_necessary_for_full_heart - 1
		
		if player_health >= health_necessary_for_full_heart:
			hearts[i].show_image(1)
		elif player_health >= health_necessary_for_half_heart:
			hearts[i].show_image(2)
		else:
			hearts[i].show_image(3)
