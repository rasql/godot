extends Control

@onready var tree = $MainPanel/HSplitContainer/VSplitContainer/Lists/VBoxContainer/HBoxContainer/VBoxContainer2/Tree

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = tree.create_item()
	root.set_text(0, "Tree - Root")
	var child1 = tree.create_item(root)
	child1.set_text(0, "Tree - Child 1")
	var child2 = tree.create_item(root)
	child2.set_text(0, "Tree - Child 2")
	var subchild1 =  tree.create_item(child1)
	subchild1.set_text(0, "Tree - Subchild 1")


func _on_option_button_item_selected(index):
	print('option button ', index)
	
func _on_item_list_item_selected(index):
	print('item list selected', index)


func _on_item_list_item_activated(index):
	print('item list activated ', index)
