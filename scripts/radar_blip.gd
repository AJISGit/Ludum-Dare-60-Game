class_name SonarBlip
extends Sprite2D


@export var die_timer: Timer


func _ready() -> void:

	die_timer.connect("timeout", _on_die_timer_timeout)

func _on_die_timer_timeout():
	queue_free()

