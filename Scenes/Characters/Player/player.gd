class_name Player extends CharacterBody2D

@export var sprite_offset_flip = 12

const SPEED = 300.0
var direction: Vector2

@onready var hand: Node2D = $Hand
@onready var player_sprite: Sprite2D = $PlayerSprite


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("slap_basic"):
		hand.slap()

	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))	
	if direction:
		velocity = direction * SPEED
		update_sprite()
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))

	move_and_slide()


func update_sprite() -> void:
	if direction.x < 0:
		player_sprite.flip_h = true
		player_sprite.position.x = -sprite_offset_flip
	else:
		player_sprite.flip_h = false
		player_sprite.position.x = sprite_offset_flip
