extends Node2D

var doc = """Draws a 2D line with mouse clicks."""

func _input(event):
	if event is InputEventMouse and event.is_pressed():
		var p = event.position
		$Line2D.add_point(p)
		print($Line2D.points)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
