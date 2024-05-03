@tool
extends Control

var doc = """Shows a CanvasTexture and three Grid nodes."""

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var g = load("res://draw/grid.tscn").instantiate()
	g.position = Vector2(400, 100)
	g.scale = Vector2(0.5, 0.5)
	g.color = Color.GOLD
	g.width = 15
	add_child(g)
	
func _draw():
	var a = Vector2(200, 200)
	draw_circle(a, 100, Color.GREEN)
	draw_circle(a, 80, Color.BLACK)
