extends Node

signal completed_butterflies
signal completed_mosquitoes

const BUTTERFLIES_TO_COLLECT = 30
const MOSQUITOES_TO_COLLECT = 20

var butterflies_collected = 0
var mosquitoes_collected = 0

var bad_thing_slapped = 0
var good_thing_slapped = 0


func update_progress(f: Global.FACTION, t: Global.TYPE):
	if f:
		update_ending(f)
	if t:
		update_type(t)
	
	
	print("SLAPPED a " + Global.FACTION.find_key(f) + " -> " + Global.TYPE.find_key(t))


func update_ending(faction: Global.FACTION) -> void:
	match faction:
		Global.FACTION.BAD:
			bad_thing_slapped += 1
		Global.FACTION.GOOD:
			good_thing_slapped += 1


func update_type(type: Global.TYPE) -> void:
	match type:
		Global.TYPE.BUTTERFLY:
			butterflies_collected += 1
		Global.TYPE.MOSQUITO:
			mosquitoes_collected += 1
