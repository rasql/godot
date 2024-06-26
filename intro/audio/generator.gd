extends Node

var sample_hz = 44100.0 # Keep the number of samples to mix low, GDScript is not super fast.
var pulse_hz = 440.0
var phase = 0.0


var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().
@onready var wave_type = $CenterContainer/WaveType

func _fill_buffer():
	var increment = pulse_hz / sample_hz

	var to_fill = playback.get_frames_available()

	# to_fill = 256/512 * 60Hz = 22 kH
	while to_fill > 0:
		match wave_type.selected:
			0 : playback.push_frame(Vector2.ONE * sin(phase * TAU)) # Audio frames are stereo.
			1 : playback.push_frame(Vector2.ONE * phase) # triangle
			2 : playback.push_frame(Vector2.ONE * (0 if phase < 0.5 else 1)) # square
				
		phase = fmod(phase + increment, 1.0)
		to_fill -= 1


func _process(_delta):
	_fill_buffer()	

func _ready():
	# Setting mix rate is only possible before play().
	$Player.stream.mix_rate = sample_hz
	$Player.play()
	playback = $Player.get_stream_playback()
	# `_fill_buffer` must be called *after* setting `playback`,
	# as `fill_buffer` uses the `playback` member variable.
	# first fill 16383, later 256/512
	print(playback.get_frames_available())
	_fill_buffer()
	print($Player.stream.mix_rate)
	print($Player.stream.buffer_length)

func _on_frequency_h_slider_value_changed(value):
	%FrequencyLabel.text = "%d Hz" % value
	pulse_hz = value
	playback.clear_buffer()


func _on_volume_h_slider_value_changed(value):
	# Use `linear_to_db()` to get a volume slider that matches perceptual human hearing.
	%VolumeLabel.text = "%.2f dB" % linear_to_db(value)
	$Player.volume_db = linear_to_db(value)


func _on_option_button_item_selected(index: int) -> void:
	print(index)
