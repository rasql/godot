extends Control
# Display an audio file list and play a sound file when clicking.

var doc = """Display a sound list."""

var files
var path = "res://assets/kenney_sci-fi-sounds/Audio/"


func _input(event):
	if event is InputEventKey and event.is_pressed():
		var key = event.as_text_key_label()
		match key:
			'Space' : $AudioStreamPlayer.playing = not $AudioStreamPlayer.playing


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = """Display a Tree with audio files."""
	var files = DirAccess.get_files_at(path)
	var _files = []
	for f in files:
		if not f.get_extension() == 'import':
			_files.append(f)
	$Files.set_list(_files, 'Files')


func _on_files_item_selected():
	var item = $Files.get_selected()
	var i = item.get_index()
	var file  = item.get_text(0)
	$File.text = path + file
	$AudioStreamPlayer.stream = load(path + file)
	$AudioStreamPlayer.play()


func _on_volume_value_changed(value):
	$AudioStreamPlayer.volume_db = value
