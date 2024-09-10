extends Camera2D

@export var follow_node: Node2D


func _process(delta: float) -> void:
	global_position = follow_node.global_position
