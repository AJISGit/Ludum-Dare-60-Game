class_name Torpedo
extends Area2D


@export var speed: float
var from_plr: bool = true

var spawn_pos: Vector2
@export var bullet_range: float = 1500.0
var physical_sub: PhysicalSub





func _ready() -> void:
	connect("body_entered", _on_body_entered)


func _physics_process(delta: float) -> void:
	position += Vector2(1.0, 0.0).rotated(rotation) * speed * delta

	if (position.distance_to(spawn_pos) > bullet_range):
		queue_free()


func _on_area_entered(body: Node2D):
	if (body == physical_sub):
		if (from_plr): return
		print("boom")
		body.visible = false
		
	else:
		if (!from_plr): return
		if (!(body as Enemy) && !(body as Torpedo)): return
		if (body as Torpedo):
			if (body.from_plr):
				return
		body.queue_free()
	
	queue_free()


func _on_body_entered(body: Node2D):
	if (body == physical_sub):
		if (from_plr): return
		print("boom")
		#body.get_node("Icon").visible = false
