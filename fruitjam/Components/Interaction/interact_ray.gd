extends RayCast3D

@onready var label = $Label

func _physics_process(delta: float) -> void:
	
	label.text = ""
	
	if is_colliding():
		var collider = get_collider()
		
		if collider is Interactable:
			label.text = collider.prompt_message
		
		if Input.is_action_just_pressed(collider.prompt_input):
			collider.interact(owner)
