extends Node2D

@onready var anim: AnimationPlayer = $HandAnim
@onready var player_sprite: Sprite2D = $"../PlayerSprite"
@onready var hand_sprite: Sprite2D = $Sprite2D
@onready var audio_slap: AudioStreamPlayer = $SlapAudioStreamPlayer
@onready var follow_cam: CameraShake = $"../FollowCam"


func _ready() -> void:
	visible = false


func slap() -> void:
	if player_sprite.flip_h:
		anim.play("slap_left")
	else:
		anim.play("slap_right")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is BaseCharacter:
		audio_slap.play()
		follow_cam.start_shake(0.15, 3.0)
		area.deal_slap()
	elif area is Fountain:
		#audio_splash.play()
		follow_cam.start_shake(0.10, 1.5)
		if player_sprite.flip_h:
			area.splah_water(global_position - Vector2(70, 0))
		else:
			area.splah_water(global_position - Vector2(-70, 0))
		
		
