extends Node2D

var doc = """These icons are animated with position, rotation, scale and skew."""
# Three icons are animated during 10s : positoin, rotation, scale
# The animated icons show a position, rotation and scale label.
# The labels are updated within the _process() function.


func _process(delta):
	$Icon/Label.text = 'position = ' + str(round($Icon.position))
	$Icon2/Label.text = 'rotation = ' + str(round($Icon2.rotation_degrees))
	$Icon3/Label.text = 'scale = ' + str(round($Icon3.scale.x * 100))
	$Icon4/Label.text = 'skew = ' + str(round($Icon4.skew * 100))
