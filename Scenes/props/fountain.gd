class_name Fountain extends Area2D

@onready var splash_area: Area2D = $"../Splash"
@onready var collision_shape: CollisionShape2D = $"../Splash/CollisionShape2D"

func _ready() -> void:
	_stop_splash()


func splah_water(position: Vector2):
	splash_area.global_position = position
	_start_splash()
	var timer = get_tree().create_timer(2)
	await timer.timeout
	_stop_splash()
	

func _on_splash_area_entered(area: Area2D) -> void:
	if area is SmokerCharacter:
		area.put_out_smoke()


func _start_splash():
	collision_shape.set_deferred("disabled", false)
	splash_area.set_visible(true) #TODO FIX: Sarà animazione


func _stop_splash():
	collision_shape.set_disabled(true)
	splash_area.set_visible(false) 
