class_name PhysicalSub
extends CharacterBody2D


const TORPEDO_RESOURCE: PackedScene = preload("res://scenes/torpedo.tscn")

@export var sub_data: SubmarineData
@export var speed: float = 100.0
@export var max_velocity: float = 1000.0
var move_rotation: float = 0.0

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
	var engine_sys = get_parent().get_parent().get_parent().get_parent().get_node("SubmarineData").engines_system
	var control_sys = get_parent().get_parent().get_parent().get_parent().get_node("SubmarineData").control_system
	var torpedo_sys = get_parent().get_parent().get_parent().get_parent().get_node("SubmarineData").torpedoes_system

	if (Input.is_action_just_pressed("mouse_click") && visible && (torpedo_sys.value >= torpedo_sys.max_value)):

		var bullet: Torpedo = TORPEDO_RESOURCE.instantiate()
		bullet.position = position

		var target: Vector2 = get_local_mouse_position()

		bullet.look_at(target)
		bullet.from_plr = true
		bullet.spawn_pos = bullet.position
		bullet.physical_sub = self
		bullet.speed = 200.0
		bullet.bullet_range = 5000.0
		bullet.visible = true
		$"..".add_child(bullet)
		print("Pew pew")


	if (engine_sys.value < engine_sys.max_value):
		velocity = Vector2(0.0, 0.0)

		if (control_sys.value >= control_sys.value):
			$"../CanvasLayer/MoveError".visible = true
		else:
			$"../CanvasLayer/MoveError".visible = false

	else:
		$"../CanvasLayer/MoveError".visible = false
	
	if (engine_sys.value < engine_sys.max_value):
		return


	velocity = last_velocity
	$OrbitPoints.rotation += PI * 0.1 * delta

	if (Input.is_action_pressed("phys_sub_up")):
		if (get_parent().visible):
			move_up(delta)
	if (Input.is_action_pressed("phys_sub_left")):
		#move_left(delta)
		if (get_parent().visible):
			move_rotation -= 90.0 * delta
	if (Input.is_action_pressed("phys_sub_down")):
		if (get_parent().visible):
			move_down(delta)
	if (Input.is_action_pressed("phys_sub_right")):
		#move_right(delta)
		if (get_parent().visible):
			move_rotation += 90.0 * delta


	velocity.x = clampf(velocity.x, -max_velocity, max_velocity)
	velocity.y = clampf(velocity.y, -max_velocity, max_velocity)

	last_velocity = velocity
	velocity = velocity.rotated(deg_to_rad(move_rotation))
	$Icon.rotation_degrees = move_rotation

	move_and_slide()

	
