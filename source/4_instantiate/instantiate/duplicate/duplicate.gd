@tool
extends Node3D
class_name Duplicate
## Duplicates the given node a number of times.


## Number of repetitions.
@export var count = 18:
	set(x):
		count = x
		if is_node_ready():
			create()
		
## Transposition vector (offset).
@export var transpose = Vector3(1.3, 0.5, 0):
	set(x):
		transpose = x 
		create()
		
# Euler angles of rotation.
@export var rotate_3d = Vector3(0, 20, 0):
	set(x):
		rotate_3d = x
		create()

# Show nodes in scene tree.	
@export var show_node = false:
	set(x):
		show_node = x
		create()

## Button action to create the duplicate nodes.
@export_tool_button("Create", "BoxMesh") var action := create

		
func _ready():
	create()
	
	
func create():
	for child in get_children():
		if child.is_in_group("procedural"):
			child.free()
			
	if get_child_count() == 0:
		var node = CSGBox3D.new()
		add_child(node)
		node.add_to_group("procedural")
	
	var node = get_child(0)
	
	for i in range(1, count):
		node = node.duplicate()
		node.translate(transpose)
		node.rotate_x(deg_to_rad(rotate_3d.x))
		node.rotate_y(deg_to_rad(rotate_3d.y))
		node.rotate_z(deg_to_rad(rotate_3d.z))
		add_child(node)
		node.add_to_group("procedural")
		if show_node:
			node.owner = get_tree().edited_scene_root
	
