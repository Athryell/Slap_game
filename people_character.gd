class_name PeopleCharacter extends BaseCharacter

@export var sprite_image_faint: Texture2D

@onready var sprite_faint: Sprite2D = $CharacterSpriteFaint

func _ready() -> void:
	super()
	sprite_faint.texture = sprite_image_faint

func _defeat():
	super()
	
	sprite_base.set_visible(false)
	sprite_faint.set_visible(true)
