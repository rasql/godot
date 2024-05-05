class_name Spectrum
extends Node2D

@export var max_freq = 11025

@export var n := 32:
	set(value):
		n = value
		data.resize(n)
		data.fill(0.0)

var data := []	# size=bin_count, value 0..1
var spectrum : AudioEffectInstance
const min_db = 60

func _ready() -> void:
	var parent = get_parent().name
	print('parent=', parent)
	
	if parent == 'root':
		var player = AudioStreamPlayer.new()
		player.stream = load("res://audio/maldita.ogg")
		add_child(player)
		player.play()
		
	spectrum = AudioServer.get_bus_effect_instance(0, 0) # bus=0, effect=0
	print(spectrum)
	data.resize(n)
	data.fill(0.0)

func _process(delta: float) -> void:
	for i in range(n):
		var f0 = i * max_freq / n
		var f1 = (i + 1) * max_freq / n
		var magnitude = spectrum.get_magnitude_for_frequency_range(f0, f1).length()
		var energy = clampf((min_db + linear_to_db(magnitude)) / min_db, 0, 1)
		if energy > data[i]:
			data[i] = energy
		else:
			data[i] = lerp(energy, data[i], 0.1)
		
	$Plot.data = data.duplicate().map(func(x): return 400 * x)		
	$Plot.queue_redraw()
