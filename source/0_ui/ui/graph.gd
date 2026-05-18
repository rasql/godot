extends Control
# Reference
# Using GraphEdit and GraphNode to create flow charts
# https://youtu.be/ZD9X3uvyWmg?si=GHPXb2AiSTLkPXFu

var node_index =0

func _on_add_pressed() -> void:
	var node = GraphNode.new()
	node.title = "node " + str(node_index)
	node.scaling_menus = true
	node.position_offset += (3 + node_index) * Vector2(30, 30)
	node.custom_minimum_size = Vector2(200, 100)
	node.set_slot(0, true, 0, Color('red'), true, 0, Color('blue'))
	var label = TextEdit.new()
	label.custom_minimum_size = Vector2(0, 32)
	node.add_child(label)

	$GraphEdit.add_child(node)
	node_index += 1


func _on_graph_edit_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	$GraphEdit.connect_node(from_node, from_port, to_node, to_port)


func _on_graph_edit_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	$GraphEdit.disconnect_node(from_node, from_port, to_node, to_port)
