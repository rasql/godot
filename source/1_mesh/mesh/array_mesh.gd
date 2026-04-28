@tool
extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)
	print(surface_array)
	print(surface_array.size())
	
	var verts = PackedVector3Array()
	var uvs = PackedVector2Array()
	var normals = PackedVector3Array()
	var indices = PackedInt32Array()
	
	verts = PackedVector3Array([
		  Vector3(0, 0, 0),
		  Vector3(0, 0, 1),
		  Vector3(1, 0, 0),
		  Vector3(0, 2, 0),
		  ])

	uvs = PackedVector2Array([
			  Vector2(0, 0),
			  Vector2(1, 0),
			  Vector2(0, 1),
			  Vector2(1, 1),
		  ])

	normals = PackedVector3Array([
			  Vector3.UP,
			  Vector3.UP,
			  Vector3.UP,
			  Vector3.UP,
		  ])

	indices = PackedInt32Array([
			  0, 2, 1,
			  2, 3, 1,
	  ])

	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_TEX_UV] = uvs
	surface_array[Mesh.ARRAY_NORMAL] = normals
	surface_array[Mesh.ARRAY_INDEX] = indices
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
