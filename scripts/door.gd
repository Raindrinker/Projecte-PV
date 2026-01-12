extends Interactable
class_name Door

@export var show_hint :bool = false
@export var is_open :bool = false
@export var requiresCondition: bool = false
@export var needs_key: bool = false
@export var key_id : String = "" #Posar ID de la clau que obre aquesta porta concreta

@export var openTexture: Texture2D
@export var lokedTexture: Texture2D
@export var closedTexture: Texture2D

var shown_interact_hint = false

var tshake = 0
var originalPosition: Vector2
var shake_offset = Vector2.ZERO

func _ready():
	originalPosition = global_position
	if !is_open:
		texture = closedTexture
	if !is_open and requiresCondition:
		texture = lokedTexture

func _process(delta: float) -> void:
	
	if tshake > 0:
		shake_offset = Vector2.DOWN.rotated(randf_range(0, 2*PI)) * randf_range(0, 1) * 5
		tshake -= delta
	else:
		shake_offset = Vector2.ZERO
		global_position = originalPosition
	
	
	global_position = originalPosition + shake_offset


func on_cannot_open() -> void:
	tshake = 0.2
	
func interact(player):
	if !shown_interact_hint and show_hint:
		tutorialUI.show_text("Prem E per interactuar")
		shown_interact_hint = true
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
		on_cannot_open()

func can_open(player) -> bool:
	if needs_key and key_id in player.keys:
		return true
	if needs_key == true:
		return false
	if requiresCondition == true:
		return false
	return true
	
func open():
	is_open = true
	print("Obrint porta")
	texture = openTexture
	$StaticBody2D.process_mode = Node.PROCESS_MODE_DISABLED
	$Area2D.process_mode = Node.PROCESS_MODE_DISABLED
