extends Interactable
class_name Door

@export var is_open :bool = false
@export var requiresCondition: bool = false
@export var needs_key: bool = false
@export var key_id : String = "" #Posar ID de la clau que obre aquesta porta concreta

@export var openText: Texture2D

func interact(player):
	print (is_open)
	print(requiresCondition)
	print(needs_key)
	print(player.keys)
	if is_open == true:
		print("porta ja oberta")
		return
	if can_open(player):
		open()
	else: 
		print("Porta tancada. Falta conidicons")

func can_open(player) -> bool:
	if requiresCondition == false:
		return true
	if needs_key and key_id in player.keys:
		return true
	if needs_key == true:
		return false
	return true
	
func open():
	is_open = true
	print("Obrint porta")
	texture = openText
	$StaticBody2D.process_mode = Node.PROCESS_MODE_DISABLED
