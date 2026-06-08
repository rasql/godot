extends Control


@onready var text: TextEdit = $HBoxContainer/Text
@onready var result: TextEdit = $HBoxContainer/Result
@onready var tree: Tree = $HBoxContainer/Tree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tree.columns = 2
	tree.column_titles_visible = true
	tree.set_column_title(0, 'pattern')
	tree.set_column_title(1, 'meaning')
	tree.set_column_expand_ratio(1, 2)
	
	var root = tree.create_item()
	tree.hide_root = true
	for i in 10:
		var item = tree.create_item(root)
		item.set_text(0, "[a-z]")
		item.set_editable(0, true)
		item.set_text(1, "lower-case letters")
		item.set_editable(1, true)
	

func _on_pattern_text_submitted(pattern: String) -> void:
	var regex = RegEx.new()
	regex.compile(pattern)
	var results = regex.search_all(text.text)
	print('\npattern: ', pattern)
	print('group count: ', regex.get_group_count())
	print('group names: ', regex.get_names())
	print('results: ', results.size())
	
	result.text = ""
	for r in results.slice(0, 100):
		var s = "%s at \t%s\t%s\n" % [r.get_string(), r.get_start(), r.get_end()]
		result.text += s
		
