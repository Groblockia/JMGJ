extends StateInterface

class_name FallState

var character: CharacterBody3D

func enter(prev_state: String = "") -> void:
	character = state_machine.owner
	print("entering fall state")
	

func physics_update(delta) -> void:
	print("tomber dans le vide vide")
	character.velocity.y -= character.gravity * delta
	
	character.velocity.x = lerp(character.velocity.x, 
	character.direction.x * character.SPEED, delta * character.AIR_DECCELERATION_SPEED)
	
	character.velocity.z = lerp(character.velocity.z, 
	character.direction.z * character.SPEED, delta * character.AIR_DECCELERATION_SPEED)
	
	character.move_and_slide()

	if character.is_on_floor():
		#if trying to move:
		if Input.get_vector("forward", "backward", "left", "right") != Vector2.ZERO:
			state_machine.change_state("move")
		else:
			state_machine.change_state("idle")
