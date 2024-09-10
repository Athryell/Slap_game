extends Node

signal completed_butterflies
signal completed_mosquitoes

const BUTTERFLIES_TO_COLLECT = 30
const MOSQUITOES_TO_COLLECT = 20

var butterflies_collected = 0
var mosquitoes_collected = 0

var bad_thing_slapped = 0
var good_thing_slapped = 0

var slapped_people: Array[Array]

func update_ending_progress(character: BaseCharacter) -> void:
	var faction: Global.FACTION = character.faction
	if not faction:
		return
	
	var sprite = character.get_node("CharacterSpriteNormal").duplicate()
	_add_to_slapped_dict(sprite, faction)
	
	match faction:
		Global.FACTION.BAD:
			bad_thing_slapped += 1
		Global.FACTION.GOOD:
			good_thing_slapped += 1
	
	print("SLAPPED a " + Global.FACTION.find_key(faction))


func update_collectible(type: Global.TYPE) -> void:
	if not type:
		push_error("Forgot to assign TYPE!")
		return
	
	match type:
		Global.TYPE.BUTTERFLY:
			butterflies_collected += 1
		Global.TYPE.MOSQUITO:
			mosquitoes_collected += 1
	
	print("of TYPE -> " + Global.TYPE.find_key(type))


func _add_to_slapped_dict(s: Sprite2D, f: Global.FACTION) -> void:
	var arr := [s, f]
	slapped_people.append(arr)
