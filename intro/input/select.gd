extends Node2D

var doc = """Selects icons with mouse clicks"""
var selected = null

func _input(event):
	if event is InputEventMouse and event.is_pressed():
		var nodes = get_children()
		var p = event.position
		if selected:
			selected.modulate = Color.WHITE
			selected = null
		for n in nodes:
			var rect = n.get_rect()
			rect.position += n.position
			if rect.has_point(p):
				selected = n
				selected.modulate = Color.BLUE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
