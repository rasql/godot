@tool
class_name Grid
extends Node2D

var doc := """Create a new class Grid, using the _draw() function."""

# when the exported variables are changed the grid is redrawn
@export var rows := 5:
	set(value):
		rows = value
		queue_redraw()
		
@export var lines := 5:
	set(value):
		lines = value
		queue_redraw()
		
@export var color := Color.WHITE:
	set(value):
		color = value
		queue_redraw()
	
@export var width := 3:
	set(value):
		width = value
		queue_redraw()

func _draw() -> void:
	#print('draw', self)
	var p0 := Vector2(0, 0)
	var p1 := Vector2(500, 0)
	var d := 500.0 / rows
	for i in range(rows+1):
		draw_line(p0, p1, color, width)
		p0.y += d
		p1.y += d	

	p0 = Vector2(0, 0)
	p1 = Vector2(0, 500)
	d = 500.0 / lines
	for i in range(lines+1):
		draw_line(p0, p1, color, width)
		p0.x += d
		p1.x += d
