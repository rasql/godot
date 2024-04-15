extends Tree

@export var debug = false
var items
var _title
var doc = "TreeContainer with filter"


func set_list(list: Array, title="", _clear=true, show_size=true):
	items = list
	_title = title
	if _clear:
		self.clear()
	self.column_titles_visible = false
	if title:
		self.column_titles_visible = true
		if show_size:
			title +=  " (%d)" % list.size()
		self.set_column_title(0, title)
		self.set_column_title_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
	self.create_item()
	self.hide_root = true
	for i in list:
		var item = self.create_item()
		item.set_text(0, i)	


func _ready():
	if debug:
		var classes = ClassDB.get_class_list()
		self.set_list(classes, 'Classes')


func _on_filter_text_changed(new_text):
	clear()
	var root = create_item()
	var i = 0
	if !items:
		return
	for item in items:
		var filter_empty = $Filter.text.is_empty()
		var filter_match = $Filter.text.to_lower() in item.to_lower()
		if (filter_empty or filter_match):
			var child = create_item(root)
			child.set_text(0, item)
			i += 1
	column_titles_visible = true
	set_column_title(0, _title + " (%d)" % i)

