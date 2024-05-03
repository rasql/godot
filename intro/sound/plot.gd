@tool
class_name Plot
extends Node2D

@export var size := Vector2(500, 300):
	set(value):
		size = value
		queue_redraw()
		
@export var reflected := true:
	set(value):
		reflected = value
		queue_redraw()	
		
var data := [123, 89, 12, 34, 65, 23, 43, 234]


var spectrum : AudioEffectInstance
var max_values := []


func _draw() -> void:
	var n = data.size()
	var w : float = size.x / n
	for i in range(n):
		var col = Color.from_hsv(float(n * 0.6 + i * 0.5) / n, 0.5, 0.6)
		var col2 = Color.from_hsv(float(n * 0.6 + i * 0.5) / n, 0.5, 1)
		var y = data[i]
		draw_rect(Rect2(w * i, size.y - y, w - 2, y), col)
		draw_line(
				Vector2(w * i, size.y - y),
				Vector2(w * i + w - 2, size.y - y), col2, 4.0, true)
		if reflected:
			draw_rect(Rect2(w * i, size.y, w - 2, y), col * Color(1, 1, 1, 0.125))
			draw_line(
				Vector2(w * i, size.y + y),
				Vector2(w * i + w - 2, size.y + y), col2* Color(1, 1, 1, 0.125), 4.0, true)
	
	
func _ready():
	pass
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		for i in len(data):
			data[i] = randi_range(0, size.y)
	queue_redraw()
