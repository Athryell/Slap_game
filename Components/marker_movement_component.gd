class_name MarkerMovementComponent extends Node

@export var speed := 75.0
@export var wait_time := 3.0

var limit := 1.0
var walk :=  true

var end_point
var start_pos
var end_pos

@onready var parent: BaseCharacter = get_parent()

func _ready() -> void:
	add_to_group("Components")
	
	end_point = get_node_or_null("Marker2D")
	start_pos = parent.position
	
	if !end_point:
		end_pos = start_pos + Vector2(0, 32)
		push_error("Careful, no end point marker for " + parent.name)
		return
	
	end_pos = end_point.global_position


func change_direction():
	var temp_end = end_pos
	end_pos = start_pos
	start_pos = temp_end
	
	walk = false
	await get_tree().create_timer(wait_time).timeout
	walk = true


func _process(delta: float) -> void:
	if parent.position.distance_to(end_pos) < limit:
		change_direction()
		
	if walk:
		var direction = (end_pos - parent.position).normalized()
		parent.position += direction * speed * delta
		#parent.position = parent.position.lerp(end_pos, delta)
	
