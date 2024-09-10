extends Area2D

@export var dialogue: Array[String]
@export var dialogue_eng: Array[String] #TODO: Manage localization

const PAUSE_BETWEEN_SENTENCES := 0.3

var dialogue_line: int = 0

@onready var dialogue_container: CenterContainer = $DialogueContainer
@onready var label: Label = $DialogueContainer/PanelContainer/MarginContainer/Label
@onready var baloon_timer: Timer = $"BaloonTimer"
@onready var pause_timer: Timer = $PauseTimer
@onready var anim: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	add_to_group("Components")
	
	dialogue_container.visible = false


func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:
		_show_dialogue()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_hide_dialogue()


func _show_dialogue():
	label.text = dialogue[dialogue_line]
	
	dialogue_line += 1
	if dialogue_line == dialogue.size():
		dialogue_line = 0
	
	baloon_timer.start()
	
	dialogue_container.visible = true
	
	anim.play("show_dialogue")


func _hide_dialogue():
	anim.play("hide_dialogue")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hide_dialogue":
		label.text = ""
	
		baloon_timer.stop()
		
		dialogue_container.visible = false


func _on_text_timer_timeout() -> void:
	_hide_dialogue()
	
	var timer = get_tree().create_timer(PAUSE_BETWEEN_SENTENCES)
	await timer.timeout
	
	_show_dialogue()
