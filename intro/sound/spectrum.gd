extends Node2D

const VU_COUNT = 64 # Volume Unit meter
const FREQ_MAX = 11050.0 # maximum frequency

const WIDTH = 1000 # histogram width
const HEIGHT = 350 # histogram height
const HEIGHT_SCALE = 8.0
const MIN_DB = 60
const ANIMATION_SPEED = 0.1	# 10% decay factor inside 60 Hz loop : half time = 100 ms

var spectrum : AudioEffectInstance
var max_values := []

var count := 0


func _draw() -> void:
	var w : float = WIDTH / VU_COUNT # rect width
	for i in range(VU_COUNT):
		var max_height : int = max_values[i]
		#var height = lerp(0.0, max_height, ANIMATION_SPEED)
		var height : int = max_height / 10

		draw_rect(
				Rect2(w * i, HEIGHT - height, w - 2, height),
				Color.from_hsv(float(VU_COUNT * 0.6 + i * 0.5) / VU_COUNT, 0.5, 0.6)
		)
		draw_line(
				Vector2(w * i, HEIGHT - height),
				Vector2(w * i + w - 2, HEIGHT - height),
				Color.from_hsv(float(VU_COUNT * 0.6 + i * 0.5) / VU_COUNT, 0.5, 1.0),
				4.0,
				true
		)

		# Draw a reflection of the bars with lower opacity.
		draw_rect(
				Rect2(w * i, HEIGHT, w - 2, height),
				Color.from_hsv(float(VU_COUNT * 0.6 + i * 0.5) / VU_COUNT, 0.5, 0.6) * Color(1, 1, 1, 0.125)
		)
		draw_line(
				Vector2(w * i, HEIGHT + height),
				Vector2(w * i + w - 2, HEIGHT + height),
				Color.from_hsv(float(VU_COUNT * 0.6 + i * 0.5) / VU_COUNT, 0.5, 1.0) * Color(1, 1, 1, 0.125),
				2.0,
				true
		)


func _process(_delta: float) -> void:
	var data := []
	var prev_hz := 0

	for i in range(1, VU_COUNT + 1):
		var hz := i * FREQ_MAX / VU_COUNT # frequency step
		var magnitude = spectrum.get_magnitude_for_frequency_range(prev_hz, hz).length()
		var energy = clampf((MIN_DB + linear_to_db(magnitude)) / MIN_DB, 0, 1)
		var height = energy * HEIGHT * HEIGHT_SCALE
		data.append(height)
		prev_hz = hz

	for i in range(VU_COUNT):
		if data[i] > max_values[i]:
			max_values[i] = data[i]
		else:
			max_values[i] = lerp(max_values[i], data[i], ANIMATION_SPEED)
			
	$Plot.data = max_values.duplicate()
	for i in len($Plot.data):
		$Plot.data[i] *= 0.1
	$Plot._draw()
	#if count < 10:		
		#print($Plot.data)
		#count += 1
		


	# Sound plays back continuously, so the graph needs to be updated every frame.
	queue_redraw()


func _ready() -> void:
	spectrum = AudioServer.get_bus_effect_instance(0, 0) # bus=0, effect=0
	max_values.resize(VU_COUNT)
	max_values.fill(0.0)
