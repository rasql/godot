@tool
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var node := Grid.new()
	add_child(node)
	node.owner = get_tree().edited_scene_root
