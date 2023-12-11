extends Node

signal grew

func _input(event):
	if event.is_action_pressed("ui_text_backspace"):
		grew.emit()


func _on_timer_timeout():
	var children = find_child("snake").get_children()
	children.reverse()
	for child in children:
		child.move()
