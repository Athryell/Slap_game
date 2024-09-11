extends AudioStreamPlayer2D

@export var area: Area2D
@export var pause_between_audio: float = 0
@export var pause_variation: float = 0


func _ready() -> void:
	add_to_group("Components")
	
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		self.play()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		self.stop()


func _on_finished() -> void:
	print("audio stopped")
	if pause_between_audio == 0:
		self.play()
	else:
		var pause = pause_between_audio + randf_range(-pause_variation, pause_variation)
		var timer = get_tree().create_timer(pause)
		await timer.timeout
		self.play()
