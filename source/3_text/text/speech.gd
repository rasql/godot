extends Control

# Pick a voice. Here, we arbitrarily pick the first English voice.
var voice_id = DisplayServer.tts_get_voices_for_language("en")[0]

@onready var tree: Tree = $HBoxContainer/Tree
@onready var text: TextEdit = $HBoxContainer/Text
@onready var volume: HSlider = $HBoxContainer/VBoxContainer/Volume
@onready var pitch: HSlider = $HBoxContainer/VBoxContainer/Pitch
@onready var rate: HSlider = $HBoxContainer/VBoxContainer/Rate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = tree.create_item()
	tree.hide_root = true
	tree.column_titles_visible = true
	tree.set_column_title(0, 'Voices')
	
	for lang in ['fr', 'de', 'en']:
		var parent = tree.create_item(root)
		var voices = DisplayServer.tts_get_voices_for_language(lang)
		parent.set_text(0, "%s (%s)" % [lang, voices.size()])
		for voice in voices:
			var child = tree.create_item(parent)
			child.set_text(0, voice)
		
	var path = "res://books/alice.txt"
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	text.text = content


func _on_pause_pressed() -> void:
	DisplayServer.tts_pause()

func _on_resume_pressed() -> void:
	DisplayServer.tts_resume()

func _on_stop_pressed() -> void:
	DisplayServer.tts_stop()

func _on_speak_pressed() -> void:
	var selection = text.get_selected_text()
	DisplayServer.tts_speak(selection, voice_id, volume.value, 
	pitch.value, rate.value)

func _on_tree_cell_selected() -> void:
	voice_id = tree.get_selected().get_text(0)
	_on_stop_pressed()
	_on_speak_pressed()

func _on_value_changed(x):
	_on_stop_pressed()
	_on_speak_pressed()
