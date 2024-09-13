class_name SmokerCharacter extends PeopleCharacter

@export var time_to_lit_sigaret: float = 10.0

var is_smoking := true
var is_avoiding := false

var all_positions: Array[Vector2]

var current_pos: Vector2

@onready var smoke_particles: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	super()
	
	var children = get_children()
	for c in children:
		if c is Marker2D:
			all_positions.append(c.global_position)
	
	current_pos = _get_new_pos()
	position = current_pos
	
	
	_start_smoking()


func deal_slap():
	if is_smoking:
		current_pos = _get_new_pos()
		#TODO: animation smokers_avoid_slap
		position = current_pos
	else:
		super()


func put_out_smoke():
	_stop_smoking()
	var timer = get_tree().create_timer(time_to_lit_sigaret)
	await timer.timeout
	_start_smoking()


func _stop_smoking():
	# TODO: animation _stop_smoking
	smoke_particles.set_emitting(false)
	is_smoking = false


func _start_smoking():
	#TODO: animation _start_smoking
	smoke_particles.set_emitting(true)
	is_smoking = true


func _get_new_pos() -> Vector2:
	if all_positions.size() <= 1:
		return current_pos 
	
	var new_pos: Vector2
	while true:
		new_pos = all_positions.pick_random()
		if new_pos != current_pos:
			break
	
	return new_pos
