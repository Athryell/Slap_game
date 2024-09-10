class_name BaseCharacter extends Area2D

@export var faction: Global.FACTION
@export var type: Global.TYPE
@export var achievement: Global.ACHIEVEMENT
@export var max_amount_slap: int = 1

@onready var slap_taken: int = 0
@onready var sprite_normal: Sprite2D = $CharacterSpriteNormal
@onready var sprite_faint: Sprite2D = $CharacterSpriteFaint
@onready var collider: CollisionShape2D = $CollisionShape2D

func deal_slap():
	slap_taken += 1
	if slap_taken >= max_amount_slap:
		defeat()
		

func defeat():
	GameProgressManager.update_progress(faction, type)
	AchievementsManager.update_achievement(achievement)
	
	if type == Global.TYPE.BUTTERFLY or type == Global.TYPE.MOSQUITO:
		# TODO: Play explosion
		queue_free()
	
	collider.set_deferred("disabled", true)
	sprite_normal.set_visible(false)
	sprite_faint.set_visible(true)
	
	var children = get_children()
	for c in children:
		if c.is_in_group("Components"):
			c.queue_free()

	# TODO: Play animation, maybe a little knockback slide
