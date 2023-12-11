extends Sprite2D

var size
var right_bound
var down_bound

var direction = RIGHT

enum {LEFT, RIGHT, DOWN, UP}

# Called when the node enters the scene tree for the first time.
func _ready():
	size = get_rect().size.x
	right_bound = get_viewport_rect().size.x
	down_bound = get_viewport_rect().size.y

func _input(event):
	if event.is_action_pressed("left"):
		direction = LEFT
	if event.is_action_pressed("right"):
		direction = RIGHT
	if event.is_action_pressed("down"):
		direction = DOWN
	if event.is_action_pressed("up"):
		direction = UP

func move():
	match direction:
		RIGHT:
			position.x += size
			if position.x >= right_bound:
				position.x = 0
		LEFT:
			position.x -= size
			if position.x < 0:
				position.x = right_bound - size
		DOWN:
			position.y += size
			if position.y >= down_bound:
				position.y = 0
		UP:
			position.y -= size
			if position.y < 0:
				position.y = down_bound - size





