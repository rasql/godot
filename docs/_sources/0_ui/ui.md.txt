# User interface

## Buttons

Buttons are a primary GUI element to

- start an action
- switch state
- select a color
- open a web site

When you add a button, you see the classe structure. 
There are 8 Button types

![img](images/ui_buttons.png){w=300}

- create a new scene
- add a `Control` node and name it `Button`
- then add these buttons

![img](images/button_tree.png){w=200}

A button can contain text and an icon.

- add a `Button` and add text `Button``
- duplicate the button and add the Godot icon (`icon.svg`)
- duplicate again and remove the text

![img](images/button_scene.png)

## Start an action

Add a `Label` to display a status line.
On the `Signal` tab, right next to the `Inspector` tab, connect these two signals.

![img](images/button_signal.png){w=400}

Then add the code to display a message in the status field.

```
func _on_button_button_down() -> void:
	print('\nButton down')
	
func _on_button_button_up() -> void:
	print('Button up')

func _on_button_pressed() -> void:
	print('Button pressed')

func _on_button_toggled(toggled_on: bool) -> void:
	print('Button toggled')
```

Now observe the console. You will find this

```
Button down
Button toggled
Button pressed
Button up
```

add 3 more buttons

![img](images/ui_checkbox.png){w=200}

The `CheckBox` and `CheckButton` are 2-state toggle buttons.
The state can be read in the `.toggled_on` attribute.

### ColorPickerButton

The `ColorPickerButton` displays a colored rectangle.
When clicking on it, a color dialogue is opend.

![img](images/colorpicker_win.png){w=200}

Connect the `color_changed` signal and add this function in the script.

```
func _on_color_picker_button_color_changed(color: Color) -> void:
	print('Color changed: ', color)
```

Each time you select a new color, this function is called, with the color as the argument.

```
Color changed: (0.0, 0.8902, 0.1391, 1.0)
Color changed: (0.0, 0.8902, 0.1391, 1.0)
Color changed: (0.1145, 0.4375, 0.165, 1.0)
Color changed: (0.1145, 0.4375, 0.165, 1.0)
```

### MenuButton

The `MenuButton` has a permanent title. When clicking on the menu, a popup appears to select a menu item. Add the items in the inspector.

![img](images/button_menu.png){w=150}


The `OptionButton` has no title, but displays the selected option. 
When clicking on the menu, a popup appears to select a menu item. 
Add the options in the inspector.

![img](images/button_option.png){w=150}

This button has 2 signals which allow to react to a chosen item.
Connect these two signals.

![img](images/button_option_signal.png){w=400}

Add the 2 fonctions

```
func _on_option_button_item_focused(index: int) -> void:
	print('Item focused: ', index)
	
func _on_option_button_item_selected(index: int) -> void:
	print('Item selected: ', index)
```

Each time you select an option that item index is transmitted.
You get this in the console.

```
Item selected: 2
Item selected: 0
```

### LinkButton

The `LinkButton` is a hyperlink. 
When you click it, it opens the associated URI in a web browser.
Configure it to open the Godot web page.

![img](images/button_link.png){w=400}


### TextureButton

The `TextureButton` has no text label, only icons or textures.

Configure it to show 2 times a `2DGradient` and the Godot icon.

![img](images/button_texture.png){w=400}

## Containers

A large number of nodes are used for placement of the nodes. 
They are called container nodes, such as 

- Horizontal and Vertical Box containers
- Horizontal and Vertical Flow containers

When adding a new node (cmd+A) you can observe the class hierarchy of nodes.

![img](images/container_nodes.png){w=300}

- create a new scene
- add a `Control` node and name it `Container`
- save the scene as `container.gd`

In order to increase the size of all its children, create a theme and increase the font size.

- in the inspector find `Theme`
- add a new theme
- set the font size to 32

![img](images/container_inspector.png){w=400}

### HBoxContainer

A `HBoxContainer` is a container which arranges its children horizontally.

- add a `HBoxContainer` as a child
- add a `Button` as a child
- set its text to `Button``
- check its `Control > Layout > Container Sizing > Expand` checkbox

![img](images/hbox_container_sizing.png){w=400}

You can duplicate the `Button` with cmd+D

![img](images/hbox_tree.png){w=200}

You get an automatically sized horizontal grid of buttons.

![img](images/hbox_scene.png){w=500}

### VBoxContainer

A `VBoxContainer` is a container which arranges its children vertically.

- add a `VBoxContainer` to create a vertical arrangement
- copy the button from the previous container
- paste it as a child of the `VboxContainer`
- check the `Control > Layout > Container Sizing > Expand` checkbox of the button
- duplicate the `Button` with cmd+D, 2-3 times.

![img](images/vbox_tree.png){w=200}

You get an automatically sized vertical grid of buttons.

![img](images/vbox_scene.png){w=200}

### HFlowContainer

A `HFlowContainer` is a container which arranges its children horizontally.
When a line is full, they they start a new line. The last line is expanded to fill the whole space available.

- add a `HFlowContainer` to create a horizontal arrangement
- copy the button from the previous container
- paste it as a child of the `HFlowContainer`
- duplicate the `Button` with cmd+D, 6-7 times.

![img](images/hflow_tree.png){w=200}

You get an automatically sized horizontal grid of buttons.

![img](images/hflow_scene.png){w=200}