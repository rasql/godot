extends Node

var doc = """Click to instantiate new ball."""

var scene = preload("res://2d/ball2.tscn") # packed scene resource

func _input(event):		
	if event is InputEventMouseButton and event.is_pressed():
		var ball = scene.instantiate()
		ball.position = event.position
		ball.scale = Vector2(0.2, 0.2)
		add_child(ball)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = """Create nodes
	clic - create new instance"""
	
	var scene = load("res://2d/ball2.tscn") # packed scene resource
	var instance = scene.instantiate() # node
	instance.position.x = 500
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
