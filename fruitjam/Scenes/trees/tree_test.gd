extends StaticBody3D

var spawn_points: Array 
var fruits: Array

func _ready() -> void:
	spawn_points = $spawn_points.get_children()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("testing"):
		spawn_fruits()

func spawn_fruits() -> void:
	for i in spawn_points:
		if randi_range(0,1): 
			var scene = load("res://Scenes/fruits/fruit_test/fruit_test.tscn")
			var instance = scene.instantiate()
			instance.position = i.position
			add_child(instance)
