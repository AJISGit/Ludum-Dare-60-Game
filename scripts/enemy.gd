class_name Enemy
extends Area2D


var physical_sub: PhysicalSub
var orbit_point: Node2D
var reached_point: bool = false
const TORPEDO_RESOURCE: PackedScene = preload("res://scenes/torpedo.tscn")


func setup() -> void:
	physical_sub = $"../PhysicalSub"
	var rand_point_idx = randi_range(0, 17)
	print("Point: " + str(rand_point_idx))
	orbit_point = physical_sub.get_node("OrbitPoints").get_node("Point" + str(rand_point_idx))


func _physics_process(delta: float) -> void:

	if (position.distance_to(orbit_point.global_position) < 5):
		pass
	# Code recycled from my last game jam game: https://ajisboss.itch.io/countdown-to-powerdown
	look_at(orbit_point.global_position)
	position += Vector2(1.0, 0.0).rotated(rotation) * 100.0 * delta
	rotation = 0


			

func shoot() -> void:
	var bullet: Torpedo = TORPEDO_RESOURCE.instantiate()
	bullet.position = position
	bullet.position.y -= 32

	var target: Vector2 = physical_sub.position
	
	target += physical_sub.velocity * ( bullet.speed / position.distance_to(physical_sub.position))

	bullet.look_at(target)
	bullet.from_plr = false
	bullet.spawn_pos = bullet.position
	bullet.physical_sub = physical_sub
	bullet.speed = 100.0
	bullet.bullet_range = 5000.0
	$"..".add_child(bullet)


func _on_shoot_timer_timeout() -> void:
	shoot()
