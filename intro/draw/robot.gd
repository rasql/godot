@tool
#class_name Robot
extends Node2D

@export var color := Color("478cbf"):
	set(value):
		color = value
		queue_redraw()
		
@export var color2 := Color.WHITE:
	set(value):
		color2 = value
		queue_redraw()
		
@export var color3 := Color.DIM_GRAY:
	set(value):
		color3 = value
		queue_redraw()
		
@export var rotation_speed : float = 1  # In radians per second.

var coords_head : Array = [
	[ 22, 83 ],  [ 28, 98 ],
	[ 53, 107 ], [ 72, 107 ],
	[ 99, 98 ],  [ 105, 83 ],
	[ 105, 55 ], [ 110, 47 ],
	[ 102, 36 ], [ 94, 40 ],
	[ 85, 34 ],  [ 85, 24 ],
	[ 73, 19 ],  [ 68, 28 ],
	[ 59, 28 ],  [ 54, 19 ],
	[ 42, 24 ],  [ 42, 34 ],
	[ 33, 40 ],  [ 25, 36 ],
	[ 17, 47 ],  [ 22, 55 ]
]

var coords_mouth : Array = [
	[ 22, 81 ], [ 38, 82 ],
	[ 39, 90 ], [ 54, 92 ],
	[ 55, 84 ], [ 72, 84 ],
	[ 73, 92 ], [ 88, 90 ],
	[ 89, 82 ], [ 105, 81 ]
]

var default_font : Font = ThemeDB.fallback_font;
var mouth_width := 4.0
var time := 0.0

func _draw() -> void:
	draw_set_transform(Vector2(-60, -60))
	var head : Array
	var mouth : Array
	head = coords_head.map(func(x : Array): return Vector2(x[0], x[1]))
	mouth = coords_mouth.map(func(x : Array): return Vector2(x[0], x[1]))
	
	draw_polygon(head, [color])
	draw_polyline(mouth, color2, mouth_width)
	draw_circle(Vector2(42, 65), 9, color2)
	draw_circle(Vector2(85, 65), 9, color2)
	draw_circle(Vector2(43, 65), 6, color3)
	draw_circle(Vector2(84, 65), 6, color3)
	draw_line(Vector2(64, 60), Vector2(64, 74), color2, 4)
	draw_string(default_font, Vector2(20, 130), "GODOT", HORIZONTAL_ALIGNMENT_CENTER, 90, 22)


func _ready() -> void:
	rotation = 0

func _process(delta: float) -> void:
	rotation -= rotation_speed * delta
	time += delta
	mouth_width = abs(sin(time) * 7)
	queue_redraw()
