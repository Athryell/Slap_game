class_name Hand extends Area2D

signal slap_ended

@onready var player: Player = $"../../../.."

@onready var anim: AnimationPlayer = %SlapAnimation
@onready var audio_slap: AudioStreamPlayer = $"../SlapAudioStreamPlayer"

@onready var follow_cam: CameraShake = %FollowCam


func slap() -> void:
	if anim.is_playing():
		anim.stop()
		
	var r = randi() % 2
	anim.play("slap" if r else "slap_reverse")


func _on_area_entered(area: Area2D) -> void:
	if area is BaseCharacter:
		audio_slap.play()
		follow_cam.start_shake(0.15, 3.0)
		area.deal_slap()
	elif area is Fountain:
		follow_cam.start_shake(0.10, 1.5)


func slap_is_completed():
	slap_ended.emit()
