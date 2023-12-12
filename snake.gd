class_name Snake
extends Sprite2D

var snake_texture = preload("res://block.png")
const size = 20
var last = true

func move():
	pass


func grow():
	if last:
		var node = load("res://body.gd").new(self)
		add_sibling(node)
		last = false
