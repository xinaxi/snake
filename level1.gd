extends Node2D

var block_texture = preload("res://block.png")

var size = block_texture.get_height()
var right
var down

func _ready():
	right = get_viewport().size.x
	down = get_viewport().size.y

	for i in range(0, 16*size, size):
		set_in_pos(Vector2(i,0))
		set_in_pos(Vector2(i,down-size))
		
	for i in range(40*size, right, size):
		set_in_pos(Vector2(i,0))
		set_in_pos(Vector2(i,down-size))
	
	for i in range(8*size, down - 8*size, size):
		set_in_pos(Vector2(0,i))
		set_in_pos(Vector2(right-size,i))
	
	for i in range(15*size, 18*size, size):
		for j in range(14*size, 30*size, size):
			set_in_pos(Vector2(j,i))
	
	for i in range(42*size, 45*size, size):
		for j in range(11*size, 24*size, size):
			set_in_pos(Vector2(i,j))

func set_in_pos(pos):
	var block = Sprite2D.new()
	block.set_texture(block_texture)
	block.centered = false
	block.position = pos
	add_child(block)


