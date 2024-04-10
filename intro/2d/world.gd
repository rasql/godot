extends TextureRect

var scene = preload("res://2d/ball.tscn") # packed scene resource
var cube = preload("res://2d/cube.tscn") # packed scene resource


func _input(event):		
	if event is InputEventMouseButton and event.is_pressed():
		var ball = cube.instantiate()
		ball.position = event.position
		ball.scale = Vector2(0.2, 0.2)
		add_child(ball)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
