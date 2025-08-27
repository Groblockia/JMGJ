extends StateInterface

class_name JumpState

var character: CharacterBody3D

func enter(prev_state: String = "") -> void:
	character = state_machine.owner
	print("entering jump state")
	character.velocity.y = character.JUMP_VELOCITY


func physics_update(delta) -> void:
	
	state_machine.change_state("fall")
