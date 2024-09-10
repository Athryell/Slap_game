class_name PeopleCharacter extends BaseCharacter

@onready var sprite_normal: Sprite2D = $CharacterSpriteNormal
@onready var sprite_faint: Sprite2D = $CharacterSpriteFaint

func _defeat():
	super()
	
	sprite_normal.set_visible(false)
	sprite_faint.set_visible(true)
