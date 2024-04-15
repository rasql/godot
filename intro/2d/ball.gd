extends RigidBody2D

var doc = "Rigid body ball whith gravity and a collision sound"


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$AudioStreamPlayer.play()
