class_name BaseScene extends Node

@onready var player: Player
@onready var entrance_markers: Node2D = $EntranceMarkers
@onready var follow_cam: Camera2D = get_node_or_null("FollowCam")

func _ready() -> void:
	if SceneManager.player:
		player = SceneManager.player
		add_child(player)
	
	position_player()
	
	if follow_cam:
		#follow_cam.global_position = player.global_position
		#follow_cam.position_smoothing_enabled = true
		follow_cam.follow_node = player

func position_player() -> void:
	var last_scene = SceneManager.last_scene_name
	if last_scene.is_empty():
		last_scene = "Home"
	
	for entrance in entrance_markers.get_children():
		if entrance is Marker2D and entrance.name == "Any" or entrance.name == last_scene:
			player.global_position = entrance.global_position
