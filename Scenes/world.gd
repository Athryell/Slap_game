extends Node2D
const SQUARE = preload("res://Scenes/Locations/square.tscn")
const PLAYER = preload("res://Scenes/Characters/Player/player.tscn")

func _ready() -> void:
	var player = PLAYER.instantiate()
	
	var startin_lvl = SQUARE.instantiate()
	startin_lvl.add_child(player)
	
	add_child(startin_lvl)
	
