extends Node

var tutorial_active: bool = false
var elapsed_time: float = 0.0
var initial_hint_shown: bool = false

func _process(delta):
	if tutorial_active:
		elapsed_time += delta
		
		if not initial_hint_shown:
			tutorialUI.show_text("Prem WASD per moure't", 5.0)
			initial_hint_shown = true
		
		if elapsed_time >= 120.0: # 2 minuts
			tutorial_active = false

func start_tutorial():
	tutorial_active = true
	elapsed_time = 0.0
	initial_hint_shown = false
