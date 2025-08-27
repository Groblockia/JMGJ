extends CharacterBody3D

class_name Player

var state_machine: StateMachine
var gravity = 9.8

@export var SPEED: float = 6.0
@export var ACCELERATION_SPEED: float = 6.0
@export var DECCELERATION_SPEED: float = 6.0
@export var AIR_DECCELERATION_SPEED: float = 1.0
@export var JUMP_VELOCITY: float = 5.0
var direction
var input_dir

func _ready() -> void:
	state_machine = StateMachine.new()
	state_machine.owner = self
	
	#create and add states
	state_machine.add_state("idle", IdleState.new())
	state_machine.add_state("move", MoveState.new())
	state_machine.add_state("jump", JumpState.new())
	state_machine.add_state("fall", FallState.new())
	
	state_machine.set_initial_state("idle")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	state_machine.update(delta)
	
	if Input.is_action_just_pressed("mouse_toggle"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	input_dir = Input.get_vector("left", "right", "forward", "backward")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

func _input(event: InputEvent) -> void:
	state_machine.handle_input(event)

func get_current_state() -> String:
	return state_machine.get_current_state_name()
