extends Node2D

var button_states = {
	"button1": false,
	"button2": false,
	"button3": false
}
@onready var door = $door
@onready var b1 = $Button1
@onready var b2 = $Button2
@onready var b3 = $Button3

func _ready():
	b1.button_toggled.connect(_on_button_toggled)
	b2.button_toggled.connect(_on_button_toggled)
	b3.button_toggled.connect(_on_button_toggled)

func _on_button_toggled(button_name: String, state: bool):
	button_states[button_name] = state
	_check_all_buttons()

func _check_all_buttons():
	if button_states["button1"] and button_states["button2"] and button_states["button3"]:
		_open_door()

func _open_door():
	print("Tots els botons activats! Obrint porta...")
	door.open()  # o el que sigui que faci la teva portapass
