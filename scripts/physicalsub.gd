class_name PhysicalSub
extends CharacterBody2D


@export var sub_data: SubmarineData
@export var speed: float = 100.0
@export var max_velocity: float = 1000.0

var last_velocity: Vector2


func move_up(delta: float):
	velocity.y -= speed * delta
func move_left(delta: float):
	velocity.x -= speed * delta
func move_down(delta: float):
	velocity.y += speed * delta
func move_right(delta: float):
	velocity.x += speed * delta


func _ready() -> void:
	print("Hey")

func _physics_process(delta: float) -> void:
	velocity = last_velocity
	$OrbitPoints.rotation += PI * 0.1 * delta

	if (Input.is_action_pressed("phys_sub_up")):
		move_up(delta)
	if (Input.is_action_pressed("phys_sub_left")):
		move_left(delta)
	if (Input.is_action_pressed("phys_sub_down")):
		move_down(delta)
	if (Input.is_action_pressed("phys_sub_right")):
		move_right(delta)

	velocity.x = clampf(velocity.x, -max_velocity, max_velocity)
	velocity.y = clampf(velocity.y, -max_velocity, max_velocity)

	last_velocity = velocity

	move_and_slide()

	if (position.x > 3825):
		position.x = -3825
	if (position.x < -3825):
		position.x = 3825
	if (position.y < -2000):
		position.y = 2000
	if (position.y > 2000):
		position.y = -2000
