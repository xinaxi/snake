extends Sprite2D

var snake_texture = preload("res://block.png")

var parent
var last = true
var size

func _init(previous_node):
	parent = previous_node
	size = snake_texture.get_height()
	set_texture(snake_texture)
	centered = false
	position = parent.position
	position.x -= size


func _ready():
	get_tree().current_scene.grew.connect(grow)

func move():
	set_global_position(parent.get_global_position())

func grow():
	if last:
		var node = load("res://snake.gd").new(self)
		node.position = position
		node.position.x -= size
		add_sibling(node)
		last = false
