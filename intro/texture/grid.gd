@tool
class_name Grid
extends Node2D

@export var rows = 5
@export var lines = 5
@export var color = Color.WHITE
@export var width = 3

func _draw():
	var p0 = Vector2(0, 0)
	var p1 = Vector2(500, 0)
	var d = 500 / rows
	for i in range(rows+1):
		draw_line(p0, p1, color, width)
		p0.y += d
		p1.y += d	

	p0 = Vector2(0, 0)
	p1 = Vector2(0, 500)
	d = 500 / lines
	for i in range(lines+1):
		draw_line(p0, p1, color, width)
		p0.x += d
		p1.x += d
