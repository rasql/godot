extends RigidBody2D

var doc = "Beach ball with gravity and collision sound"


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$AudioStreamPlayer.play()
