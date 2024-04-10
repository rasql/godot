@tool
extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = """Shows a CanvasTexture and three Grid nodes."""
	var g = load("res://texture/grid.tscn").instantiate()
	g.position = Vector2(400, 100)
	g.scale = Vector2(0.5, 0.5)
	g.color = Color.GOLD
	g.width = 15
	add_child(g)
	
func _draw():
	var a = Vector2(200, 200)
	draw_circle(a, 100, Color.GREEN)
	draw_circle(a, 80, Color.BLACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
