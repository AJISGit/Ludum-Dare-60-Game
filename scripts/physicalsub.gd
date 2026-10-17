class_name PhysicalSub
extends Area2D


@export var sub_data: SubmarineData


func _ready() -> void:
	print("Hey")

func _physics_process(delta: float) -> void:
	$OrbitPoints.rotation += PI * 0.1 * delta

