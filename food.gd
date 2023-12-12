extends Sprite2D

func _init():
	set_texture(load("res://block.png"))
	modulate = Color(randf(),randf(),randf())
	centered = false
