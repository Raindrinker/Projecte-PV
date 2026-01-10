extends Interactable

@export var text_sign : String = ""

func interact(player):
	UI.show_text(text_sign)
