class_name CollectibleCharacter extends BaseCharacter

@export var type : Global.TYPE

func _defeat():
	super()
	
	GameProgressManager.update_collectible(type)
	
	# TODO: Play explosion
	queue_free()
