extends Sprite2D

var direction = Vector2i.RIGHT
var last = true

var size
var right_bound
var down_bound

# Called when the node enters the scene tree for the first time.
func _ready():
	size = get_rect().size.x
	right_bound = get_viewport_rect().size.x
	down_bound = get_viewport_rect().size.y

func _input(event):
	if event.is_action_pressed("left"):
		if direction != Vector2i.RIGHT:
			direction = Vector2i.LEFT
	if event.is_action_pressed("right"):
		if direction != Vector2i.LEFT:
			direction = Vector2i.RIGHT
	if event.is_action_pressed("down"):
		if direction != Vector2i.UP:
			direction = Vector2i.DOWN
	if event.is_action_pressed("up"):
		if direction != Vector2i.DOWN:
			direction = Vector2i.UP


func move():
	position += direction*size
	if position.x >= right_bound:
		position.x = 0
	elif position.x < 0:
		position.x = right_bound - size
	elif position.y >= down_bound:
		position.y = 0
	elif position.y < 0:
		position.y = down_bound - size


func grow():
	if last:
		var node = load("res://snake.gd").new(self)
		add_sibling(node)
		last = false



