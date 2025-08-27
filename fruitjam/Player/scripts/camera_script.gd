extends Node3D

@export_group("camera variables")
@export var XAxisSensibility : float = .008
@export var YAxisSensibility : float = .008
@export var maxUpAngleView : float = -85.0
@export var maxDownAngleView : float = 85.0

@onready var camera : Camera3D = $Camera3D
@onready var player : Player = $".."

@export_group("input variables")
var mouseInput : Vector2 
@export var mouseInputSpeed : float 

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		player.rotate_y(-event.relative.x * XAxisSensibility)
		camera.rotate_x(-event.relative.y * YAxisSensibility)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(maxUpAngleView), deg_to_rad(maxDownAngleView))
		#player.rotation.y = rotation.y

func _ready() -> void:
	pass
