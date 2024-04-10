extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():	
	$Value.text = str($Slider.value)
	
func set_slider(label, min=0, max=100, step=10, val=50):
	$Label.text = label
	$Slider.min_value = min
	$Slider.max_value = max
	$Slider.step = step
	$Slider.value = val
	$Value.text = str(val)

func _on_h_slider_value_changed(value):
	$Value.text = str(value)
