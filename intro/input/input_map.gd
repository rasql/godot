extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = $HBoxContainer/Tree
	var actions = InputMap.get_actions()
	tree.set_list(actions, 'Actions')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tree_item_selected():
	var item = $HBoxContainer/Tree.get_selected()
	var i = item.get_index()
	var action = item.get_text(0)
	var events = InputMap.action_get_events(action)
	events = events.map(func(x): return str(x))
	
	$HBoxContainer/Tree2.set_list(events, 'Events')
