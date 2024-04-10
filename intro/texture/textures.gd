extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print(CameraServer)
	print("feed count: ", CameraServer.get_feed_count())
	for feed in CameraServer.feeds(): 
		print()
		print(feed)
		print(feed.get_name())
		print('active: ', feed.feed_is_active)
		print('id: ', feed.get_id())
		print('data type: ', feed.get_datatype())
		print('position on device: ', feed.get_position())
		
	#CameraServer.add_feed(0)

	
	var g = Gradient.new()
	print(g)
	printt(g.colors, g.offsets)
	g.add_point(0.5, Color.ORANGE)
	printt(g.colors, g.offsets)
	
	var gt = GradientTexture1D.new()
	gt.gradient = g
	print(gt)
	
	$TextureRect.texture = gt
	var t = $TextureRect
	print(t)
	print(t.texture)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
