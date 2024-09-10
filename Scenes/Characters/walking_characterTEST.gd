class_name WalkingCharacter extends BaseCharacter

@export var speed := 75

var path_follow: PathFollow2D


func _ready() -> void:
	path_follow = $".."


func _process(delta: float) -> void:
	path_follow.progress += delta * speed
