extends CanvasLayer


@onready var text_label = $TEXT
var auto_hide: bool = false
var show_time: float = 0.0
var duration: float = 2.0  # segons

func _ready():
	text_label.visible = false
	
func show_text(msg: String):
	text_label.text = msg
	text_label.visible = true
	auto_hide = true
	show_time = 0.0

func hide_text():
	text_label.visible = false
	auto_hide = false

func _process(delta):
	if auto_hide:
		show_time += delta
		if show_time >= duration:
			hide_text()
			
