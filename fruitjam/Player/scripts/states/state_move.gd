extends StateInterface

class_name MoveState

var character: CharacterBody3D

func enter(prev_state: String = "") -> void:
	character = state_machine.owner
	#print("entering walk state")


func physics_update(delta) -> void:
	#if no movement
	if Input.get_vector("forward", "backward", "left", "right") == Vector2.ZERO:
		state_machine.change_state("idle")

	#move character
	character.velocity.x = lerp(character.velocity.x, 
	character.direction.x * character.SPEED, delta * character.ACCELERATION_SPEED)
	
	character.velocity.z = lerp(character.velocity.z, 
	character.direction.z * character.SPEED, delta * character.ACCELERATION_SPEED)
	
	character.move_and_slide()

	if !character.is_on_floor():
		state_machine.change_state("fall")

func handle_input(event) -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jump")
