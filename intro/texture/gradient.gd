extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = """Displays GradientTexture1D and GradientTexture2D."""
	# Create GradientTexture1D
	var g = Gradient.new()
	g.add_point(0.5, Color.CHARTREUSE)
	g.add_point(0.75, Color.HOT_PINK)
	print(g)
	var gt = GradientTexture1D.new()
	gt.gradient = g
	$TextureRect.texture = gt
	
	var gt2 = GradientTexture2D.new()
	gt2.gradient = g
	gt2.fill_from = Vector2(0, 0)
	gt2.fill_to = Vector2(1, 1)
	$TextureRect2.texture = gt2
	
	var gt3 = GradientTexture2D.new()
	gt3.gradient = g
	gt3.fill_from = Vector2(0.5, 0.5)
	gt3.fill = GradientTexture2D.FILL_RADIAL
	$TextureRect3.texture = gt3
