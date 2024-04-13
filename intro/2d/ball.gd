extends RigidBody2D

var doc = """Rigid body ball whith gravity and a collision sound."""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print('body_shape_entered')
	$AudioStreamPlayer.play()
