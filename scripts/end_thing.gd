extends Sprite2D


func _process(_delta: float) -> void:
	
	if (position.distance_to(%PhysicalSub.position) <= 100):
		get_parent().get_parent().get_parent().get_parent().queue_free()
