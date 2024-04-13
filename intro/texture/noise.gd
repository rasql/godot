extends Control

var doc = """NoiseTexture and a type selector."""


var noise_types = ['simplex', 'simplex_smooth', 'cellular',
		'perlin', 'cubic', 'value']

# Called when the node enters the scene tree for the first time.
func _ready():	
	$Tree.set_column_title(0, 'Noise Type')
	$Tree.column_titles_visible = true
	$Tree.create_item()
	$Tree.hide_root = true
	for n in noise_types:
		print(n)
		$ItemList.add_item(n)
		var item = $Tree.create_item()
		item.set_text(0, n)


func _on_item_list_item_selected(index):
	#printt(index, $ItemList.get_item_text(index))
	$TextureRect.texture.noise.noise_type = index

func _on_frequency_value_changed(value):
	$TextureRect.texture.noise.frequency = value

func _on_seed_value_changed(value):
	$TextureRect.texture.noise.seed = value
