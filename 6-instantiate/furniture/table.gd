@tool
extends CSGCombiner3D
class_name Table
## This class creates a table with 4 legs.

## Size of the table plate.
@export var size = Vector3(2, 0.1, 1):
	set(x):
		size = x
		if is_node_ready(): create()
		
## Size of the table leg.	
@export var leg_size = Vector3(0.1, 1, 0.1):
	set(x):
		leg_size = x
		if is_node_ready(): create()
		
@export var d = 0.1:
	set(x):
		d = x
		if is_node_ready(): create()
		
## Table material.
@export var material: BaseMaterial3D		

		
func _ready():
	create()
	
## Creating the table.
func create():
	for child in get_children():
		child.free()
	
	var plate	
	plate = CSGBox3D.new()
	add_child(plate)
	plate.name = "Plate"
	plate.size = size
	plate.position = 0.5 * size
	plate.position.y += leg_size.y
	plate.material = material
	plate.use_collision = true
	
	for x in 2:
		for z in 2:
			var leg = CSGBox3D.new()
			add_child(leg)
			leg.size = leg_size
			leg.name = "Leg_" + str(x) + str(z)
			leg.position = 0.5 * leg_size
			leg.position.x += d + x * (size.x - leg.size.x - 2 * d)
			leg.position.z += d + z * (size.z - leg.size.z - 2 * d)
