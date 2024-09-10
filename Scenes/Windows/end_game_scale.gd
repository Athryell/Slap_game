extends Node2D

@export var falling_people: PackedScene
@export var delay_between_drop := 0.5

@onready var spawn_good: Area2D = $SpawnForGoodPeople
@onready var spawn_bad: Area2D = $SpawnForBadPeople

func _ready() -> void:
	_spawn_people()

func _spawn_people():
	var sprite_and_faction = GameProgressManager.slapped_people
	
	var coll_good = spawn_good.get_node("CollisionShape2D")
	var coll_bad = spawn_bad.get_node("CollisionShape2D")
	
	for data in sprite_and_faction:
		var sprite_data: Sprite2D = data[0]
		var faction_data: Global.FACTION = data[1]
		
		var guy_to_drop = falling_people.instantiate()
		add_child(guy_to_drop)
		
		guy_to_drop.add_child(sprite_data)
		
		var pos
		if faction_data == Global.FACTION.GOOD:
			pos = Vector2(randf_range(spawn_good.position.x, spawn_good.position.x + coll_good.shape.b.x), spawn_good.position.y)
		else:
			pos = Vector2(randf_range(spawn_bad.position.x, spawn_bad.position.x + coll_bad.shape.b.x), spawn_bad.position.y)

		guy_to_drop.global_position = pos
		
		var timer = get_tree().create_timer(delay_between_drop)
		await timer.timeout
