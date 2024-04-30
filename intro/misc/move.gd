@tool
extends Node2D

var doc = "Rotate, move in a circle, and move via keys."
var speed = 400
var angular_speed = PI
var angle = 0

func _init():
	print("Hello world!")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print($Ball2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += angular_speed * delta 
	$Ball1.rotation = angle
	
	var velocity = Vector2.UP.rotated(angle) * speed
	$Ball2.position += velocity * delta
	
	var dir = Input.get_axis("ui_left", "ui_right")
	$Ball3.rotation += angular_speed * dir * delta
	
	var v3 = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		v3 = Vector2.UP.rotated($Ball3.rotation) * speed
	$Ball3.position += v3 * delta
