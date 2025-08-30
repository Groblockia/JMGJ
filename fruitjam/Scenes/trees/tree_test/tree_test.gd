extends Interactable

var spawn_points: Array 
var fruits: Array

func _ready() -> void:
	spawn_points = $spawn_points.get_children()
	SignalManager.spawn_fruits_on_trees.connect(spawn_fruits)

func spawn_fruits() -> void:
	for i in spawn_points:
		if randi_range(0,1): 
			var scene = load("res://Scenes/fruits/fruit_test/fruit_test.tscn")
			var instance = scene.instantiate()
			fruits.append(instance)
			instance.position = i.position
			instance.freeze = true
			add_child(instance)

func _on_interacted(body: Variant) -> void:
	if !fruits.is_empty():
		for i in fruits:
			i.fall()
		fruits.clear()
	
