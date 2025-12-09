extends TextureRect

@export var full_heart : Texture2D
@export var half_heart : Texture2D
@export var empty_heart : Texture2D

func show_image(which):
	if which == 1:
		texture = full_heart
	elif which == 2:
		texture = half_heart
	elif which == 3:
		texture = empty_heart
