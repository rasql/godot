@tool
extends Node3D
class_name Random
## Arranges nodes randomly.
##
## Places copies of the child nodes in a random fashion in 3D space.
## The distribution can be : normal (std-dev) or uniform (-max to +max)


@export var limits = Vector3i(10, 0, 5): ## The limits (max or std-dev)
	set(x):
		limits = x
		create()
		
@export_enum("integer", "float", "normal") var type: String = "float": ##
	set(x):
		type = x
		create()

@export var count = 20: ## Number of repetitons.
	set(x):
		count = x
		create()

@export var show_node = false: # Display the nodes in the scene tree.
	set(x):
		show_node = x
		create()

## Button action to create nodes in a random fashion.
@export_tool_button("Create", "BoxMesh") var action := create


func _ready():
	create()
	
## Creates duplicates of the node in a random fashion.
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
		
	var rand_pos = Vector3()
	for i in count-1:
		match type :
			"integer":
				rand_pos.x = randi_range(-limits.x, limits.x)
				rand_pos.y = randi_range(-limits.y, limits.y)
				rand_pos.z = randi_range(-limits.z, limits.z)
			"float":
				rand_pos.x = randf_range(-limits.x, limits.x)
				rand_pos.y = randf_range(-limits.y, limits.y)
				rand_pos.z = randf_range(-limits.z, limits.z)
			"normal":
				rand_pos.x = randfn(0, limits.x)
				rand_pos.y = randfn(0, limits.y)
				rand_pos.z = randfn(0, limits.z)
				
		for node in children:
			node = node.duplicate()
			add_child(node)
			node.add_to_group("procedural")
			node.position += rand_pos
			if show_node:
				var tree = get_tree()
				if tree and tree.edited_scene_root:
					node.owner = get_tree().edited_scene_root
