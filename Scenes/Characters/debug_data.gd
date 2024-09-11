extends Control

@onready var char_data: PeopleCharacter = $".."
@onready var faction_color: ColorRect = $FactionColor
@onready var has_achievement: ColorRect = $HasAchievement

func _ready() -> void:
	if not OS.is_debug_build():
		visible = false
	
	if char_data.faction == Global.FACTION.GOOD:
		faction_color.set_color(Color.LIME_GREEN)
	elif char_data.faction == Global.FACTION.BAD:
		faction_color.set_color(Color.DARK_RED)
	
	if char_data.achievement:
		has_achievement.set_visible(true)
	else:
		has_achievement.set_visible(false)
