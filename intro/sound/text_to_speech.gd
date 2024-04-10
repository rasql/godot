extends Control

var doc = """Speaks a text or a selection of it."""

var id # first english voice

# Called when the node enters the scene tree for the first time.
func _ready():
	var voices = DisplayServer.tts_get_voices_for_language('en')
	id = voices[0]
	print(len(voices))
	print(id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_speak_button_down():
	
	DisplayServer.tts_speak($TextEdit.text, id,
	$Volume.value, $Pitch.value, $Rate.value)

func _on_pause_button_down():
	DisplayServer.tts_pause()


func _on_resume_button_down():
	DisplayServer.tts_resume()

func _on_speak_selected_button_down():
	var text = $TextEdit.get_selected_text()
	DisplayServer.tts_speak(text, id,
	$Volume.value, $Pitch.value, $Rate.value)

func _on_stop_button_down():
	DisplayServer.tts_stop()
