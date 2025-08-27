extends RefCounted
class_name  StateInterface

var state_machine: StateMachine

func enter(prev_state: String = "") -> void:
	pass

func exit() -> void:
	pass

func update(delta) -> void:
	pass

func physics_update(delta) -> void:
	pass

func handle_input(event)-> void:
	pass
