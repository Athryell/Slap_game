extends Node

var game_language: Global.LANGUAGE

func _ready() -> void:
	set_language(Global.LANGUAGE.ITA)

func set_language(language: Global.LANGUAGE):
	game_language = language
