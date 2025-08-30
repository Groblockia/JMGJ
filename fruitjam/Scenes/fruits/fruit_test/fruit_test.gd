extends RigidBody3D

@onready var squished_fruit_test = preload("res://Scenes/fruits/fruit_test/squished_fruit_test.tscn")

func _ready() -> void:
	freeze = true

func _on_body_entered(body: Node) -> void:
	var layer = body.collision_layer
	#if touching ground:
	if layer == 1:
		var instance = squished_fruit_test.instantiate()
		instance.position = global_position
		get_tree().get_root().add_child(instance)
		queue_free()
	
	
	#if touching basket:
	if layer == 6:
		pass

func fall():
	$AnimationPlayer.play("shake_before_fall")
	await $AnimationPlayer.animation_finished
	freeze = false
