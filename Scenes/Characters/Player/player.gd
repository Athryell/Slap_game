class_name Player extends CharacterBody2D

@export var sprite_offset_flip = 12

const SPEED = 200.0
var direction: Vector2
var is_facing_right := true
var is_performing_slap := false

@onready var hand: Hand = %HandArea
@onready var player_sprites: Node2D = $Sprites
@onready var player_anim: AnimationPlayer = %PlayerAnimations
@onready var slap_anim: AnimationPlayer = %SlapAnimation

func _ready() -> void:
	hand.slap_ended.connect(func(): is_performing_slap = false)
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("slap_basic") and not is_performing_slap:
		is_performing_slap = true
		hand.slap()

	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if direction:
		velocity = direction * SPEED
		update_sprite()
		
		player_anim.play("walk")
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))
		
		player_anim.play("idle")
		if not is_performing_slap:
			slap_anim.play("idle")

	move_and_slide()


func update_sprite() -> void:
	if not is_performing_slap:
		slap_anim.play("walk")
	if direction.x < 0 and is_facing_right:
		player_sprites.scale.x = -player_sprites.scale.x
		is_facing_right = false
	elif direction.x > 0 and not is_facing_right:
		player_sprites.scale.x = -player_sprites.scale.x
		is_facing_right = true
