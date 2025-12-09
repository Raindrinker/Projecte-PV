extends CanvasLayer

@onready var panel = $Panel
@onready var label = $Panel/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel.visible = false


func show_text(text: String):
	label.text = text
	panel.visible = true

func hide_text():
	panel.visible = false
