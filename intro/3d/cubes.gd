extends Node3D

var d := 20
var n := 300

func _ready():
	for i in range(n):
		var cube = CSGBox3D.new()
		cube.position.x = randi_range(-d, d)
		cube.position.z = randi_range(-d, d)
		cube.size.x = randi_range(1, 3)
		cube.size.z = randi_range(1, 3)
		cube.position.y = randi_range(0, 2)
		cube.material_override = StandardMaterial3D.new()
		cube.material_override.albedo_color = Color.CHOCOLATE
		add_child(cube)
