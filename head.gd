extends Snake

var direction = Vector2.RIGHT

var right_bound
var down_bound

func _ready():
	right_bound = get_viewport_rect().size.x
	down_bound = get_viewport_rect().size.y

func _input(event):
	if event.is_action_pressed("left"):
		if direction != Vector2.RIGHT:
			direction = Vector2.LEFT
	if event.is_action_pressed("right"):
		if direction != Vector2.LEFT:
			direction = Vector2.RIGHT
	if event.is_action_pressed("down"):
		if direction != Vector2.UP:
			direction = Vector2.DOWN
	if event.is_action_pressed("up"):
		if direction != Vector2.DOWN:
			direction = Vector2.UP


func move():
	position = next()

func next():
	var pos = position + direction*size
	if pos.x >= right_bound:
		pos.x = 0
	elif pos.x < 0:
		pos.x = right_bound - size
	elif pos.y >= down_bound:
		pos.y = 0
	elif pos.y < 0:
		pos.y = down_bound - size
	return pos





