@tool
extends Node3D

@export var step := Vector3(1, 1, 1):
	set(x):
		step = x
		create()
		
@export var count := 2:
	set(x):
		count = x
		create()
		
@export var show_node := false:
	set(x):
		show_node = x
		create()
		
@export_tool_button("Create", "BoxMesh") var action = create

func _ready():
	if Engine.is_editor_hint():
		create()

func create():
	# 1. Safety check: ensure we are in the tree before manipulating nodes
	if not is_inside_tree(): return

	# 2. Clean up previous procedural nodes
	for child in get_children():
		if child.is_in_group("procedural"):
			child.free()

	# 3. Create the base Mesh if this is the root of the local scene
	# Note: In @tool mode, 'owner' is often null for the root node being edited.
	var base_mesh: MeshInstance3D
	
	if owner == null:
		base_mesh = MeshInstance3D.new()
		base_mesh.mesh = BoxMesh.new()
		base_mesh.mesh.size = Vector3(4, 0.5, 1)
		add_child(base_mesh)
		base_mesh.add_to_group("procedural")
		# Important: If show_node is true, the base needs an owner too
		if show_node:
			base_mesh.owner = get_tree().edited_scene_root
	else:
		# If not root, try to find an existing non-procedural child to duplicate
		for child in get_children():
			if not child.is_in_group("procedural"):
				base_mesh = child
				break

	if not base_mesh: return

	# 4. Duplicate loop (Start from 1 because 0 is the base)
	for i in range(1, count):
		var new_node = base_mesh.duplicate()
		add_child(new_node)
		new_node.add_to_group("procedural")
		new_node.position = base_mesh.position + (step * i)
		
		# 5. Make visible in Scene Tree dock
		if show_node and get_tree().edited_scene_root:
			new_node.owner = get_tree().edited_scene_root
