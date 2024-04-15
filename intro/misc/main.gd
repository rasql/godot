extends Node

var doc = "Click to instantiate new balls" 

@export var Ball: PackedScene

func _input(event):
	if event  is InputEventMouseButton and event.is_pressed():
		var new_ball = Ball.instantiate()
		new_ball.position = get_viewport().get_mouse_position()
		add_child(new_ball)
