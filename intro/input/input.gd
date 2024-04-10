extends Control

var doc = """Displays event info (key, mouse)"""

func _input(event):
	$Event.text = str(event)
	$Key.text = str(event).replace(',', '\n')
	
	if event is InputEventKey:
		
		pass
	else:
		$TextEdit.text += event.as_text() + "\n"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
