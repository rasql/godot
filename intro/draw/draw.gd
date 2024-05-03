@tool
class_name Draw
extends Node2D

@export var texture : Texture2D:
	set(value):
		texture = value
		queue_redraw()
		
@export var length := 50:
	set(value):
		length = value
		queue_redraw()
		
@export var w := 10:
	set(value):
		w = value
		queue_redraw()

		
func _draw() -> void:
	draw_texture(texture, Vector2())
	
	draw_line(Vector2(0, 100), Vector2(length, 100), Color.GOLD, w)
	draw_line(Vector2(0, 150), Vector2(length, 150), Color.GOLD, w)
	
	var p := Vector2(100, 100)
	var size := Vector2(length, length)
	
	draw_rect(Rect2(p, size), Color.RED)
	draw_rect(Rect2(p * 1.5, size), Color.ORANGE, false, w)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
