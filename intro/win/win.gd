extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var wins = get_viewport().get_embedded_subwindows()
	print(wins)
	for w in wins:
		$Inspector/TextEdit.text += str(w) + "\n"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inspector_close_requested():
	print('close')
	$Inspector.hide()
