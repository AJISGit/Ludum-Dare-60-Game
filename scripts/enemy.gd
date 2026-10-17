class_name Enemy
extends Area2D


@onready var physical_sub: PhysicalSub = %PhysicalSub
var orbit_point: Node2D
var reached_point: bool = false


func _ready() -> void:
	var rand_point_idx = randi_range(0, 17)
	print("Point: " + str(rand_point_idx))
	orbit_point = physical_sub.get_node("OrbitPoints").get_node("Point" + str(rand_point_idx))


func _physics_process(delta: float) -> void:

	# Code recycled from my last game jam game: https://ajisboss.itch.io/countdown-to-powerdown
	if (!reached_point):
		look_at(orbit_point.global_position)
		position += Vector2(1.0, 0.0).rotated(rotation) * 500.0 * delta
		rotation = 0

		if (position.distance_to(orbit_point.global_position) < 5.0):
			reached_point = true
			print("Locked on")

	else:
		position = orbit_point.global_position

