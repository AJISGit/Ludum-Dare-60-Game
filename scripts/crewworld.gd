class_name CrewWorld
extends Node2D


@export var sub_data: SubmarineData

func _ready() -> void:
	print(sub_data.name)
	$EngineRoom.sub_data = sub_data
	$TorpedoRoom.sub_data = sub_data
	$OxygenRoom.sub_data = sub_data
	$ControlRoom.sub_data = sub_data

func get_subsystem_visual(id: int) -> SubsystemVisual:

	if (id == $EngineRoom.sys_id):
		return $EngineRoom
	elif (id == $TorpedoRoom.sys_id):
		return $TorpedoRoom
	elif (id == $OxygenRoom.sys_id):
		return $OxygenRoom
	elif (id == $ControlRoom.sys_id):
		return $ControlRoom
	else:
		return null
