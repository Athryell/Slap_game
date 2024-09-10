class_name BaseCharacter extends Area2D

@export var faction: Global.FACTION
@export var achievement: Global.ACHIEVEMENT
@export var max_amount_slap: int = 1

@export var sprite_image_base: Texture2D

@onready var sprite_base: Sprite2D = $CharacterSpriteNormal
@onready var slap_taken: int = 0
@onready var collider: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	sprite_base.texture = sprite_image_base #TODO NEXT: CHECK THIS


func deal_slap():
	slap_taken += 1
	if slap_taken >= max_amount_slap:
		_defeat()
		

func _defeat(): # Added behaviours through inheritance
	GameProgressManager.update_ending_progress(self)
	AchievementsManager.update_achievement(achievement)
	
	collider.set_deferred("disabled", true)

	var children = get_children()
	for c in children:
		if c.is_in_group("Components"):
			c.queue_free()

	# TODO: Play animation, maybe a little knockback slide
