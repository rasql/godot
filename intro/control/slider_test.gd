extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Slider.set_slider('Volume', -60, 0, 5, -20)
	$Slider2.set_slider('Pitch', 0, 2, 0.1, 1)
	$Slider3.set_slider('Rate', 0, 10, 0.2, 1)
	$Slider4.set_slider('Frequency', 10, 1000, 10)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
