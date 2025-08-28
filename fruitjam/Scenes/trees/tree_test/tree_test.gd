extends Interactable

var spawn_points: Array 
var fruits: Array

func _ready() -> void:
	spawn_points = $spawn_points.get_children()

func spawn_fruits() -> void:
	for i in spawn_points:
		if randi_range(0,1): 
			var scene = load("res://Scenes/fruits/fruit_test/fruit_test.tscn")
			var instance = scene.instantiate()
			instance.position = i.position
			add_child(instance)


func _on_interacted(body: Variant) -> void:
	spawn_fruits()
	
