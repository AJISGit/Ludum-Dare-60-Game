class_name GameWorld
extends Node2D


@export var sub_data: SubmarineData
var physical_sub


func _ready() -> void:
	physical_sub = $PhysicalSub
	
	print(get_child_count())
	physical_sub = get_node("./PhysicalSub")
	print(physical_sub)
	physical_sub.sub_data = sub_data
