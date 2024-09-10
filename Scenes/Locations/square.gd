extends BaseScene

const PLAYER = preload("res://Scenes/Characters/Player/player.tscn")

func _ready() -> void:
	player = get_node_or_null("Player")
	
	if not player:
		SceneManager.player = PLAYER.instantiate()
	
	super()
