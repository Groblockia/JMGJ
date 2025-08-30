extends Node3D

func _ready() -> void:
	SignalManager.spawn_fruits_on_trees.emit()
