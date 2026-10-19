class_name DirectionPointer
extends Sprite2D


func _process(_delta: float) -> void:
	look_at(%EndThing.position)
	rotation_degrees += 90

