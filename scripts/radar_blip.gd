class_name SonarBlip
extends Sprite2D


@export var die_speed: float = 100.0
var camera: Camera2D
var og_pos: Vector2
var og_trans: Transform2D
var plr: PhysicalSub
var distance: float
var node2d_thing: Node2D


func setup():
	distance = position.distance_to(plr.position)
	node2d_thing = Node2D.new()
	plr.add_child(node2d_thing)
	node2d_thing.global_position = global_position


func _process(delta: float) -> void:

	modulate.a -= die_speed * delta
	position = node2d_thing.global_position
	
	if (modulate.a <= 0):
		node2d_thing.queue_free()
		queue_free()		
