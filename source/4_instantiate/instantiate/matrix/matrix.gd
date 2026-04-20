@tool
extends Node3D
class_name Matrix
## Arranges nodes into a 3D matrix.
##
## This node arranges its child nodes into a 3D matrix.

@export var repeat := Vector3i(2, 2, 2):	## Number of repetitions in 3D.
	set(x):
		repeat = x
		create()
	
@export var step := Vector3(2, 2, 2):  ## Step size in 3D.
	set(x):
		step = x
		create()
		
@export var show_node := false:  ## Show the nodes in scene tree.
	set(x):
		show_node = x
		create()
		
## Button action to create a 3D matrix of given nodes.
@export_tool_button("Create", "BoxMesh") var action := create


func _ready():
	create()

	
## Create a 3D matrix of given nodes.
func create():
	for child in get_children():
		if child.is_in_group("procedural"):
			child.free()
			
	if get_child_count() == 0:
		var node = CSGBox3D.new()
		add_child(node)
		node.add_to_group("procedural")
	
	var children = get_children()
	
	if not is_node_ready() or not is_inside_tree():
		return
		
	for x in repeat.x:
		for y in repeat.y:
			for z in repeat.z:
				if x != 0 or y != 0 or z != 0:
					for node in children:
						node = node.duplicate()
						add_child(node)
						node.add_to_group("procedural")
						node.position.x += x * step.x
						node.position.y += y * step.y
						node.position.z += z * step.z
						if show_node:
							var tree = get_tree()
							if tree and tree.edited_scene_root:
								node.owner = get_tree().edited_scene_root
