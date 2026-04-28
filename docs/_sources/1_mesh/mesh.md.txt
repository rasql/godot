# Create 3D meshes

A polygon mesh is a collection of vertices, edges and faces that define the surface of a polyhedral object.

![img](images/mesh_overview.png)

The above image shows these basic concepts: 
- a **vertex** is a point in 3D space (`Vector3`)
- an **edge** is a connection between two vertices
- a **face** is a closed set of edges, such as a triangle or a quad (quadrilateral)
- a **polygon** is a flat (coplanar) set of faces
- a **surface** is a grouping of connected polygons

## Explore the MeshInstances3D

Create a new scene with cmd+N, or by clicking on the + sign.
- add a root `Node3D` and rename to `MeshInstance3D`
- add a child node of `MeshInstance3D` class and rename to `BoxMesh`

![img](images/mesh_inspector.png){w=300px}

The **Mesh** attribute in the inspector will be empty.  
You can select among these predefined meshes:

![img](images/mesh_new.png){w=200px}

- select the `BoxMesh`
- then add another `MeshInstance3D` with a `CapsuleMesh` 
- and add finally a node with a `CylinderMesh`

![img](images/mesh1.png)

Add some more mesh instances:

- the `PlaneMesh` is a flat square which can be used as a floor.
- the `QuadMesh` is basically the same thing as the PaneMesh, but vertical.
- the `PrismMesh` is a triangular prism which can be deformed.

![img](images/mesh2.png)

Finally add a:
- `SphereMesh`
- `TextMesh` which displays text in 3D
- `TorusMesh`

![img](images/mesh3.png)

## Add an automatic label

The text on top of each mesh has been added with a `Label3D` child node.

![img](images/mesh_label3d.png){w=300px}

You notice the blue script icon.
In fact the text of the label is automatically set to be the parent's name.

```{literalinclude} mesh/label_3d.gd
:language: gd
:linenos:
```


## Exercice 1

Create the 3 shapes, which are created from a red cube and a blue sphere

![tree](images/ex1_tree.png){w=300px}

![scene](images/ex1_scene.png)


## Exercice 2

Create these complex shapes, which are combined with a 
- red cube 
- blue sphere
- 3 green cylinders

![tree](images/ex2_tree.png){w=300px}

![scene](images/ex2_scene.png)


