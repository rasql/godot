@tool
extends Node3D
class_name Circular
## Duplicates nodes in a circular fashion.  
##
## The radius is taken from the distance to the origin.  
## The angle and count is given as an attribute.

		
@export var count := 8:	## Number of items.
	set(x):
		count = x
		create()
		
@export var angle := 45: ## Rotation angle between items.
	set(x):
		angle = x
		create()
		
@export var show_node := false: ## Show nodes in the scene tree.
	set(x):
		show_node = x
		create()
		
## Button callback function to create the nodes.
@export_tool_button("Create", "BoxMesh") var action := create

## Creates the circular nodes after the node has entered the scene tree.
func _ready():
	#if Engine.is_editor_hint():
	create()

## Creates the circular nodes.
func create():
	# 1. Safety check: ensure we are in the tree before manipulating nodes
	if not is_inside_tree(): return

	# 2. Clean up previous procedural nodes
	for child in get_children():
		if child.is_in_group("procedural"):
			child.free()
	
	# 3. Get child node or create dummy one
	var node
	if get_child_count() == 0:
		node = MeshInstance3D.new()
		node.mesh = BoxMesh.new()
		node.position.x = 3
		add_child(node)
		node.add_to_group("procedural")
	else:
		node = get_child(0)
		
	if not node: return

	# 4. Duplicate loop (Start from 1 because 0 is the base)
	for i in range(1, count):
		var new_node = node.duplicate()
		add_child(new_node)
		new_node.add_to_group("procedural")
		var basis = Basis(Vector3.UP, deg_to_rad(angle) * i)
		new_node.position = basis * new_node.position
		new_node.rotation.y = deg_to_rad(angle) * i
		
		# 5. Make visible in Scene Tree dock
		if show_node and get_tree().edited_scene_root:
			new_node.owner = get_tree().edited_scene_root
