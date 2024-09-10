extends Camera2D

var shake_duration
var shake_magnitude

var shake_timer := 0.0
var original_position := Vector2()

func _ready():
	original_position = position
	set_process(false)


func _process(delta):
	if shake_timer > 0:
		shake_timer -= delta
		var shake_offset = Vector2(
			randf_range(-shake_magnitude, shake_magnitude),
			randf_range(-shake_magnitude, shake_magnitude)
			)
		position = original_position + shake_offset
	else:
		position = original_position
		set_process(false)


func start_shake(duration, magnitude):
	shake_duration = duration
	shake_magnitude = magnitude
	shake_timer = shake_duration
	set_process(true)
