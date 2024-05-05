@tool
extends Node

class Key extends ColorRect:
	var pitch := 1.0
	
	# constructor function
	func _init() -> void :
		size = Vector2(50, 300)
		color = Color.WHITE
		
	func _gui_input(event : InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			var audio := AudioStreamPlayer.new()
			add_child(audio)
			audio.stream = preload("res://audio/A440.wav")
			audio.pitch_scale = pitch
			audio.play()
			#color_timer.start()
			await get_tree().create_timer(8.0).timeout
			audio.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x = 0

	for i in 37:
		if (i % 12) in [1, 3, 6, 8, 10]:
			var key = Key.new()
			key.color = Color.BLACK
			key.size = Vector2(40, 150)
			key.position.x = x - 35
			key.pitch = 2 ** (i/12.0)
			key.z_index = 1
			add_child(key)
		else:
			var key = Key.new()
			key.position.x = x
			key.size = Vector2(40, 250)
			x += 52
			key.pitch = 2 ** (i/12.0)
			add_child(key)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
