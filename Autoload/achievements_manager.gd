extends Node


func _ready() -> void:
	GameProgressManager.completed_butterflies.connect(update_achievement.bind(Global.ACHIEVEMENT.COMPLETED_BUTTERFLIES))
	GameProgressManager.completed_mosquitoes.connect(update_achievement.bind(Global.ACHIEVEMENT.COMPLETED_MOSQUITOES))


func update_achievement(achievement: Global.ACHIEVEMENT):
	if not achievement:
		return

	var ach_ita = []
	var ach_eng = []
		
	match achievement:
		Global.ACHIEVEMENT.HIT_BABY:
			ach_ita = ["La giustizia è equalitaria",
						"Ma che... perché hai schiaffeggiato un bambino?!"]
			ach_eng = ["Justice is equal ",
						"What the… why did you hit a baby?!"]
		Global.ACHIEVEMENT.COMPLETED_MOSQUITOES:
			ach_ita = ["Yea! Chi ne ha bisogno?"]
			ach_eng = ["Yea! We don't need those!"]
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
		Global.ACHIEVEMENT.COMPLETED_BUTTERFLIES:
			ach_ita = ["Ok, adesso sei felice?"]
			ach_eng = ["Ok, are you happy now?"]
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
			push_error("Didn't set the achievement!!!")

	if ach_eng.is_empty() or ach_ita.is_empty():
		push_error("Need to fill in the localization for " + Global.ACHIEVEMENT.find_key(achievement))
		return
		
	if GameManager.game_language == Global.LANGUAGE.ITA:
		_show_achievement(ach_ita)
	else:
		_show_achievement(ach_eng)


func _show_achievement(title_and_string: Array):		
	if title_and_string.size() > 1:
		print(title_and_string[0] + " --> " + title_and_string[1])
	else:
		print(title_and_string[0])
