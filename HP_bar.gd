extends ProgressBar

@export var personatge: Personatge

func _ready():
	if personatge:
		personatge.health_update.connect(update_healthBar)
		update_healthBar()
	else:
		print("Error: Personatge no asignado a la barra de vida")
	
func update_healthBar():
	value = personatge.currentHealth * 10
