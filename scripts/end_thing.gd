extends Sprite2D


func _process(_delta: float) -> void:
	
	if (position.distance_to(%PhysicalSub.position) <= 100):
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Restart").visible = true
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Restart").get_node("Lose").visible = false
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Restart").get_node("Win").visible = true
		get_parent().get_parent().get_parent().get_parent().queue_free()
		get_tree().paused = true
