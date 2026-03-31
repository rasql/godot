extends Node2D


func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite, "modulate", Color.RED, 2)
	tween.tween_property($Sprite, "scale", Vector2.ONE * 2, 2)
	tween.tween_property($Sprite, "position", Vector2(600, 200), 2)
	tween.tween_property($Sprite, "rotation", PI, 2)
	#tween.tween_callback($Sprite.queue_free)
