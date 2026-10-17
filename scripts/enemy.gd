class_name Enemy
extends Area2D


@onready var physical_sub: PhysicalSub = %PhysicalSub


func _physics_process(delta: float) -> void:
	print("Yahoo")
	look_at(physical_sub.position)
	position += Vector2(1.0, 0.0).rotated(rotation) * 100.0 * delta
