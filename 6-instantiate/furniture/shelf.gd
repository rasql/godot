@tool
extends CSGCombiner3D
class_name Shelf
## This class creates a shelf

## Size of the shelf plate.
@export var size = Vector3(1, 0.1, 0.5):
	set(x):
		size = x
		if is_node_ready(): create()
		
## Height
@export var height = 0.3:
	set(x):
		height = x
		if is_node_ready(): create()
		
@export var number = 3:
	set(x):
		number = x
		if is_node_ready(): create()
		
		
func _ready():
	create()
	
## Creating the table.
func create():
	for child in get_children():
		child.free()
	
	for i in number + 1:
		var plate = CSGBox3D.new()
		add_child(plate)
		plate.size = size
		plate.position = 0.5 * size
		plate.position.y +=  i * height
		plate.use_collision = true
		
	for i in 2:
		var wall = CSGBox3D.new()
		add_child(wall)
		wall.size = Vector3(size.y, number*height + size.y, size.z)
		wall.position = 0.5 * wall.size
		wall.position.x += i * (size.x - size.y)
		
	
