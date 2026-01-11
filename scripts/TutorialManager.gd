extends Node
var tutorial_active: bool = true
var elapsed_time: float = 0.0

func _process(delta):
	if tutorial_active:
		elapsed_time += delta
		if elapsed_time >= 120.0: # 2 minuts
			tutorial_active = false
