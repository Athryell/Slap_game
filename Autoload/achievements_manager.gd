extends Node


func _ready() -> void:
	GameProgressManager.completed_butterflies.connect(func(): _show_achievement("So sad...")) #TODO: Test
	GameProgressManager.completed_mosquitoes.connect(func(): _show_achievement("We don't need those!") )


func update_achievement(achievement: Global.ACHIEVEMENT):  #TODO: Test
	if not achievement:
		return

	var display_text = ""
	
	match achievement:
		Global.ACHIEVEMENT.HIT_BABY:
			_show_achievement("What the… why did you hit a baby?!")
		#Global.ACHIEVEMENT.MOSQUITOES:
			#pass
		Global.ACHIEVEMENT.JOFFREY:
			pass
		Global.ACHIEVEMENT.JOFFREY_2:
			pass
		Global.ACHIEVEMENT.PIDGEON:
			pass
		Global.ACHIEVEMENT.LADY_BUTT:
			pass
		Global.ACHIEVEMENT.FIRST_BUTTERFLY:
			pass
		#Global.ACHIEVEMENT.COMPLETED_BUTTERFLIES:
			#pass
		Global.ACHIEVEMENT.NO_TUTORIAL:
			pass
		Global.ACHIEVEMENT.HORSE:
			pass
		Global.ACHIEVEMENT.SHEEP:
			pass
		Global.ACHIEVEMENT.AVOID_DEATH:
			pass
		Global.ACHIEVEMENT.AVOID_DEATH_2:
			pass
		Global.ACHIEVEMENT.CACTUS:
			pass
		_:
			push_error("Didn't set the achievment!!!")

	_show_achievement(display_text)

func _show_achievement(text: String):
	print(text)
