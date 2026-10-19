class_name TorpedoTarget
extends Area2D


var torp: Torpedo
var plr: PhysicalSub
var node2d_thing: Node2D


func _ready() -> void:

	print("Target")
	connect("area_entered", _on_area_entered)


func _on_torp_die() -> void:
	queue_free()

func setup() -> void:
	torp.connect("tree_exiting", _on_torp_die)
	node2d_thing = Node2D.new()
	plr.add_child(node2d_thing)
	node2d_thing.global_position = global_position

func _process(_delta: float) -> void:
#	$Sprite2D.global_position = node2d_thing.global_position
	pass

func _on_area_entered(area: Area2D):
	if (area as Torpedo):
		var area_torp: Torpedo = area as Torpedo
		if (area_torp == torp):
			print("death to target time yay")
			queue_free()
