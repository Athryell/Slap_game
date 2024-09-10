class_name AimMovementComponent extends Node

@export var speed := 50.0

var direction_point
var _starting_pos

@onready var parent: BaseCharacter = get_parent()

func _ready() -> void:
	add_to_group("Components")
	
	_starting_pos = parent.position
	
func _process(delta: float) -> void:
	var direction = (direction_point - _starting_pos).normalized()
	parent.position += direction * speed * delta
