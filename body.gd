extends Snake

var parent

func _init(previous_node):
	parent = previous_node
	set_texture(snake_texture)
	centered = false
	position = parent.position


func _ready():
	get_tree().current_scene.grew.connect(grow)

func move():
	set_global_position(parent.get_global_position())

