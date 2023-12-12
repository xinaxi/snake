extends Node

signal grew

var food
var snake
var level

func _ready():
	snake = find_child("snake")
	level = find_child("level")
	grew.connect(new_food)
	food = preload("res://food.gd").new()
	add_child(food)
	new_food()

func _input(event):
	if event.is_action_pressed("restart"):
		_on_restart_pressed()

func _on_timer_timeout():
	var head = snake.get_child(0)
	if is_not_empty(head.next()):
		game_over()
		return
	var children = snake.get_children()
	children.reverse()
	for child in children:
		child.move()
	if head.position == food.position:
		grew.emit()
		return


#check intersection
func is_not_empty(pos):
	for child in snake.get_children():
		if child.position == pos:
			return true
	for child in level.get_children():
		if child.position == pos:
			return true
	return false

func new_food():
	var size = Snake.size
	var px = get_viewport().size.x / size
	var py = get_viewport().size.y / size
	food.position = Vector2(randi_range(0,px-1),randi_range(0,py-1)) * size
	while(is_not_empty(food.position)):
		food.position = Vector2(randi_range(0,px-1),randi_range(0,py-1)) * size

func game_over():
	find_child("Timer").stop()
	var game_over_label = find_child("game over")
	game_over_label.visible = true
	for i in 2:
		await get_tree().create_timer(0.5).timeout
		game_over_label.visible = false
		await get_tree().create_timer(0.5).timeout
		game_over_label.visible = true
	await get_tree().create_timer(1.5).timeout
	game_over_label.visible = false
	find_child("restart").visible = true
	

func _on_restart_pressed():
	get_tree().reload_current_scene()
