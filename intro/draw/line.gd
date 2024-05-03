@tool
extends Node2D

var p0 := Vector2(300, 300)
var p1 : Vector2
var width := 5.0
var color := Color.ORANGE


func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	if mouse_pos != p1:
		p1 = mouse_pos
		queue_redraw()


func _draw() -> void:
	draw_line(p0, p1, color, width)
	var r = p0.distance_to(p1)
	var start_angle = (p1 - p0).angle()
	var end_angle : float = (p0 - p1).angle()
	if end_angle < 0: 
		end_angle += TAU
	
	draw_arc(p0, r, start_angle, end_angle, 100, Color.RED, 10)
		
