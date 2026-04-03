@tool
extends Node3D
class_name Building

@export var floor_size = Vector3(10, 0.5, 5):
	set(val):
		floor_size = val
		create()

@export var floors = 4:
	set(val):
		floors = val
		create()

@export var floor_height = 4.0:
	set(val):
		floor_height = val
		create()
		
@export var use_collision = true:
	set(val):
		use_collision = val
		create()

@export var material: BaseMaterial3D:
	set(val):
		material = val
		create()

func create():
	# 1. Immediate Cleanup for Editor Stability
	for child in get_children():
		if Engine.is_editor_hint():
			child.free() # 'free' is instant; safer for @tool logic than queue_free
		else:
			child.queue_free()
	
	var total_height = floors * floor_height

	# 2. Generate Floors
	for i in range(floors + 1):
		var floor_node = CSGBox3D.new()
		floor_node.size = floor_size
		floor_node.material = material
		floor_node.use_collision = use_collision
		floor_node.position.y = i * floor_height
		add_child(floor_node)
		
	# 3. Generate Side Walls
	# We use a helper function to avoid repeating code
	_create_wall(Vector3(1, total_height, floor_size.z), Vector3(floor_size.x / 2, total_height / 2, 0))
	_create_wall(Vector3(1, total_height, floor_size.z), Vector3(-floor_size.x / 2, total_height / 2, 0))

func _create_wall(wall_size: Vector3, wall_pos: Vector3):
	var wall = CSGBox3D.new()
	wall.size = wall_size
	wall.position = wall_pos
	wall.material = material
	wall.use_collision = use_collision
	add_child(wall)
