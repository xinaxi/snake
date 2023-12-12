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
	position += direction*size
	if position.x >= right_bound:
		position.x = 0
	elif position.x < 0:
		position.x = right_bound - size
	elif position.y >= down_bound:
		position.y = 0
	elif position.y < 0:
		position.y = down_bound - size





