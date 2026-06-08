@tool
extends Control

@onready var text: TextEditLoad = $HBoxContainer/TextEditLoad
@onready var tree: Tree = $HBoxContainer/Tree

var voices = DisplayServer.tts_get_voices_for_language("en")
var voice_id = voices[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var content = text.text
	print("size: ", content.length())
	print("newlines: ", content.count("\n"))
	
	var begin = "[Illustration]"
	var i_begin = content.find(begin) + len(begin) + 4
	content = content.right(-i_begin)
		
	var end = "THE END"
	var i_end = content.find(end)
	content = content.left(i_end)
	
	var stars = "*      *      *      *      *      *      *

    *      *      *      *      *      *

*      *      *      *      *      *      *


"
	content = content.replace(stars, "")
	
	content = content.replace("\n\n", ". ")
	content = content.replace("\n", " ")
	content = content.replace(". ", ".\n")
	content = content.replace("? ", "?\n")
	content = content.replace("! ", "!\n")
	
	text.text = content
	
	#content = content.remove_chars(",;:!?()[]‘’“”*_$0123456789#%=+")
	#
	#content = content.replace("\n", " ")
	#content = content.replace("—", " ")
	#content = content.replace(".", " ")
	#content = content.replace("/", " ")
	#content = content.replace("  ", " ")
	#

	var phrases = content.split("\n")
	print("phrases ", phrases.size())	
	
	var root = tree.create_item()
	tree.hide_root = true
	tree.column_titles_visible = true
	tree.set_column_title(0, "phrases")
	tree.columns = 1
	for phrase in phrases:
		var child = tree.create_item(root)
		child.set_text(0, phrase)


func _on_tree_cell_selected() -> void:
	var selected = tree.get_selected()
	var phrase = selected.get_text(0)
	DisplayServer.tts_stop()
	DisplayServer.tts_speak(phrase, voice_id)
