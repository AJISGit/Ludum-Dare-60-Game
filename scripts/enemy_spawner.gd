extends Node
class_name EnemySpawner


@export var enemy_resource: PackedScene
@export var enemy_count: int = 5
@export var enemy_distance: float = 1000.0
@export var rounds_till_change: int = 5

@export_group("Delay")
@export var wait_for_spawner: bool = false
@export var rounds: int

var enemies_left: int = 0
var rounds_spawned: int = 0
var next_change: int = rounds_till_change

func on_enemy_killed():
	enemies_left -= 1


func spawn_enemy(position: Vector2):
	var enemy = enemy_resource.instantiate()
	$"..".add_child(enemy)
	enemy.setup()
	enemy.position = position
	enemy.connect("tree_exiting", on_enemy_killed)
	enemy.look_at(%PhysicalSub.position)


	return enemy

func spawn_enemies(nodes: int, distance: float) -> void:

	var nodesDesired : int = nodes
	var a : float = (2.0 * PI) / float(nodesDesired)

	var max_distance: float = distance
	var radius: float = max_distance

	for i in nodesDesired:

		var pos := Vector2(cos(i * a) * radius, sin(i * a) * radius)

		pos.x += %PhysicalSub.position.x
		pos.y += %PhysicalSub.position.y

		
		var enemy = spawn_enemy(pos)
		var enemy_distance: float = enemy.position.distance_to(%PhysicalSub.position)

		if (enemy_distance < max_distance):
			enemy.position += enemy.position.rotated(enemy.rotation_degrees) * (max_distance - enemy_distance)


	enemies_left = nodesDesired




func _process(_delta: float) -> void:

	if (enemies_left <= 0):
		rounds_spawned += 1

		if (rounds_spawned >= next_change):
			enemy_count += 1
			next_change += rounds_till_change

		spawn_enemies(enemy_count, enemy_distance)
