extends Button

const GAME = preload("uid://owydjqr501u3")

func _on_pressed() -> void:
	var game = GAME.instantiate()
	$"../..".add_child(game)
	get_parent().queue_free()
