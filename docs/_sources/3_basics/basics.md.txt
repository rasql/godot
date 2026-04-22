
# Basics

## World environment

We start by creating the world environment

- configure snap to 0.5
- create a CSGBox3D of 10x1x10
- use collision on
- add environment to scene
- add Sun to scene


## Player

The player is the object representing the user. A camera is attached to the player in order to see the world.

```{image} ./images/player_tree.png
:width: 300px
```

Create the objects as indicated:

- Create a **RigidBody3D** node and name it `Player`
- Add a **MeshInstance3D** and make it a capsule shape
- Add a **CollisionShape3D** via the `Mesh` button (sibling, capsule)
- Add a Node3D and name it `TwistPivot`
- Add a child Node3D and name it `PitchPivot`
- Add a child Camera3D

![Create New Node dialog showing search results for ribo with RigidBody3D selected, displaying class hierarchy and physics simulation description](images/new_node_win.png)

This is the GDScript to move the player.

## This

```{literalinclude} ./basics/player.gd
:language: gd
:start-at: func _input
:end-before: func _ready
```




## All

```{literalinclude} ./basics/player.gd
:language: gd
```

## Creating a box

The following code creates a CSG box programmatically.

The `@tool` directive allows executing the program in the editor.

The `size` of the box and the `material` are exported to the inspector panel.

```{image} ./images/box_inspector.png
:width: 400px
```


The corner of the box is aligned with the origin by offsetting the box by half of its size: 
`box.position = 0.5 * size`

```gd
@tool
extends Node3D
class_name Box
## This class creates a Box.

## The size of the box.
@export var size = Vector3(2, 1, 4):
    set(x):
        size = x
        create()
        
## The box material.
@export var material: BaseMaterial3D		

        
func _ready():
    create()
    
## Creating the box.
func create():
    for child in get_children():
        child.queue_free()
    
    var box	
    box = CSGBox3D.new()
    box.size = size
    box.position = 0.5 * size
    box.material = material
    box.use_collision = true
    add_child(box)
```

![box](images/box.png)


## Staircase

The following shows how to build a staircase. We place a first step.

![stairs](images/stairs_inspector.png)

```gdscript
@tool
extends Node3D
## This class creates a staircase.
class_name Stairs

## Number of steps.
@export var repeat = 18:
    set(x):
        repeat = x
        if is_node_ready():
            create()
        
## Size of a step.
@export var size = Vector3(2, 0.5, 4):
    set(x):
        size = x
        if is_node_ready():
                create()
        
## Transposition vector (offset).
@export var transpose = Vector3(1.3, 0.5, 0):
    set(x):
        transpose = x 
        create()
        
# Euler angles of rotation
@export var rotate_3d = Vector3(0, 20, 0):
    set(x):
        rotate_3d = x
        create()

# Show nodes in scene tree		
@export var show_node = false:
    set(x):
        show_node = x
        create()

# Staircase material		
@export var material: BaseMaterial3D		

        
func _ready():
    create()
    
    
func create():
    for child in get_children():
        child.free()
    
    var box	
    box = CSGBox3D.new()
    box.name = "Step"
    box.size = size
    box.position = 0.5 * size
    box.material = material
    box.use_collision = true
    add_child(box)
    if show_node:
        box.owner = get_tree().edited_scene_root
    
    for i in (repeat):
        box = box.duplicate()
        box.name = "Step" + str(i+1)
        box.translate(transpose)
        box.rotate_x(deg_to_rad(rotate_3d.x))
        box.rotate_y(deg_to_rad(rotate_3d.y))
        box.rotate_z(deg_to_rad(rotate_3d.z))
        add_child(box)
        if show_node:
            box.owner = get_tree().edited_scene_root
```

![img](images/stairs.png)

## Download links

Download a {download}`Godot Script <basics/player.gd>`.

Download a {download}`Godot Scene <basics/player.tscn>`.

Download a {download}`Godot Project <basics.zip>`.
