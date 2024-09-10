extends Area2D

@export var connected_scene: String


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneManager.change_scene(get_owner(), connected_scene)
