@tool
extends Node3D
class_name Box
## This class creates a Box.

## The size of the box.
@export var size = Vector3(2, 1, 4):
	set(x):
		size = x
		create()
		
## The box material.
@export var material: BaseMaterial3D		

		
func _ready():
	create()
	
## Creating the box.
func create():
	for child in get_children():
		child.queue_free()
	
	var box	
	box = CSGBox3D.new()
	box.size = size
	box.position = 0.5 * size
	box.material = material
	box.use_collision = true
	add_child(box)
	
	
	
