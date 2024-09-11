class_name Spawner extends Area2D

@export var butterfly: PackedScene
@export var mosquito: PackedScene

var player: Player
var stop_spawn_bf := false
var stop_spawn_mq := false

@onready var spawn_extent: Vector2 = $CollisionShape2D.shape.extents


func _ready() -> void:
	GameProgressManager.completed_butterflies.connect(func(): stop_spawn_bf = true ) #TODO: Test
	GameProgressManager.completed_mosquitoes.connect(func(): stop_spawn_mq = true )


func _process(_delta: float) -> void:
	if OS.is_debug_build() and Input.is_action_just_pressed("DEBUG_SPAWN"):
		_spawn_insect()


func _spawn_insect():
	if not player:
		player = get_owner().get_node("Player")
	
	var rand_spawnable
	if stop_spawn_bf:
		rand_spawnable = mosquito
	elif stop_spawn_mq:
		rand_spawnable = butterfly
	elif stop_spawn_bf and stop_spawn_mq:
		return 
	else:
		rand_spawnable = choose_random(butterfly, mosquito) as PackedScene
	
	var insect = rand_spawnable.instantiate() as BaseCharacter
	# (customizzare un po' la sprite per randomizzare, magari direttamente nella scena insetto)
	
	insect.position = get_rand_spawn_pos()
	insect.get_node("AimMovementComponent").direction_point = to_local(player.global_position)
	add_child(insect)


func choose_random(option1, option2):
	if randi() % 2 == 0:
		return option1
	else:
		return option2


func get_rand_spawn_pos() -> Vector2:
	var random_side = randi_range(1, 4)
	
	match random_side:
		1: # Top
			return Vector2(randf_range(-spawn_extent.x, spawn_extent.x), -spawn_extent.y)
		2: # Right
			return Vector2(spawn_extent.x, randf_range(-spawn_extent.y, spawn_extent.y))
		3: # Bottom
			return Vector2(randf_range(-spawn_extent.x, spawn_extent.x), spawn_extent.y)
		4: # Left
			return Vector2(-spawn_extent.x, randf_range(-spawn_extent.y, spawn_extent.y))
		_:
			push_error("Error in retreiving random spawn pos")
			return Vector2(randf_range(-spawn_extent.x, spawn_extent.x), -spawn_extent.y)
			


func _on_area_exited(area: Area2D) -> void:
	if area.has_node("AimMovementComponent"):
		area.queue_free()
