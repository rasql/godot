extends Node

var doc = """Instantiate ColorRect with Button."""

# Called when the node enters the scene tree for the first time.
func _ready():
	var cr = ColorRect.new()
	cr.set_anchors_preset(Control.PRESET_FULL_RECT)
	cr.color = Color.HOT_PINK
	self.add_child(cr)
	
	var bt = Button.new()
	bt.text = "Button"
	bt.size = Vector2(200, 100)
	self.add_child(bt)
	
