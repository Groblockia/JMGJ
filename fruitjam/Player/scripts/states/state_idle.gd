extends StateInterface

class_name IdleState

var character: CharacterBody3D

func enter(prev_state: String = "") -> void:
	character = state_machine.owner
	print("entering idle state")
	
func physics_update(delta) -> void:
	character.velocity.x = lerp(character.velocity.x, 0.0,
	delta * character.DECCELERATION_SPEED)
	
	character.velocity.z = lerp(character.velocity.z, 0.0, 
	delta * character.DECCELERATION_SPEED)
	
	character.move_and_slide()
	
	if !character.is_on_floor():
		state_machine.change_state("fall")

func handle_input(event) -> void:
	if Input.get_vector("forward", "backward", "left", "right") != Vector2.ZERO:
		state_machine.change_state("move")
	
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jump")
