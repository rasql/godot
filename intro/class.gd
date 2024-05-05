@tool
extends Node

# global variable for the current class (script)
var rect : Object

# this is an inner class which extends an existing Godot class
class MyColorRect extends ColorRect:
	static var count := 0	# this is a static variable (by class)
	var id : int # this is a member variable (by instance)
	
	# constructor function
	func _init(col:=Color.RED) -> void :
		position = Vector2(50, 100)	# same as self.position
		size = Vector2(100, 200)
		color = col
		id = count
		count += 1
		
	func _gui_input(event : InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			print('self ', self)
			print('position ', self.position)
			print('parent ', get_parent())
			print('id ', id)
			print()
			

# Godot has default parameters, but not named parameters
func f(x: int, y:=100) -> void:
	prints(x, y)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# MyColorRect() : error MyColorRect is not a function
	rect = MyColorRect.new()
	add_child(rect)
	
	rect = MyColorRect.new(Color.OLIVE)
	rect.position.x = 200
	add_child(rect)
	
	rect = MyColorRect.new(Color.YELLOW)
	rect.position.x = 300
	rect.size = Vector2(100, 100)
	add_child(rect)
	
	f(1) # uses 1 default parameter (100)
	f(1, 2)
	
	print("name" in rect, name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	rect.rotation += PI * _delta
