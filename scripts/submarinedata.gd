class_name SubmarineData
extends Node


@export_group("Subsystems")
@export var engines_system: Subsystem
@export var torpedoes_system: Subsystem
@export var oxygen_system: Subsystem
@export var control_system: Subsystem


func _ready() -> void:
	return


# This is some good code. ||||
#	 					  vvvv
func get_subsystem(id: int) -> Subsystem:
	if (id == engines_system.id):
		return engines_system
	elif (id == torpedoes_system.id):
		return torpedoes_system
	elif (id == oxygen_system.id):
		return oxygen_system
	elif (id == control_system.id):
		return control_system
	else:
		return null
