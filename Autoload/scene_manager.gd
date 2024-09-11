extends Node

var player: Player
var last_scene_name: String

var scene_dir_path = "res://Scenes/Locations/"

func change_scene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	
	player = from.get_node("Player")
	player.get_parent().remove_child(player)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)


func go_to_scale_scene():
	get_tree().change_scene_to_file("res://Scenes/Windows/end_game_scale.tscn")
	
func _process(_delta: float) -> void:
	if OS.is_debug_build() and Input.is_action_just_pressed("DEBUG_END_GAME"):
		go_to_scale_scene()
