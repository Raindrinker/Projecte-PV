extends Interactable

@export var is_open :bool = false
@export var requiresCondition: bool = false
@export var needskey: bool = false

func interact(player):
	if is_open == true:
		print("porta ja oberta")
		return
	if can_open():
		open()
	else: 
		print("Porta tancada. Falta conidicons")

func can_open() -> bool:
	if requiresCondition == false:
		return true
	if requiresCondition == true:
		return false
	return true
	
func open():
	is_open = true
	print("Obrint porta")
