extends Node2D

@onready var anim: AnimationPlayer = $HandAnim
@onready var player_sprite: Sprite2D = $"../PlayerSprite"
@onready var hand_sprite: Sprite2D = $Sprite2D
@onready var audio_slap: AudioStreamPlayer = $SlapAudioStreamPlayer
@onready var follow_cam: Camera2D = $"../FollowCam"


func _ready() -> void:
	visible = false


func slap() -> void:
	anim.play("slap_right")
	#if player_sprite.flip_h:
		#anim.play("slap_left")
		#hand_sprite.flip_h = true
	#else:
		#hand_sprite.flip_h = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is BaseCharacter:
		audio_slap.play()
		follow_cam.start_shake(0.15, 3.0)
		area.deal_slap()
		
