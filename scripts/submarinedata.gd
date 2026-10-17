class_name SubmarineData
extends Node


@export_group("Subsystems")
@export var sonar_system: Subsystem
@export var engines_system: Subsystem
@export var flares_system: Subsystem
@export var torpedoes_system: Subsystem
@export var oxygen_system: Subsystem


func _ready() -> void:
	return


# This is some good code. ||||
#	 					  vvvv
func get_subsystem(id: int) -> Subsystem:
	if (id == sonar_system.id):
		return sonar_system
	elif (id == engines_system.ud):
		return engines_system
	elif (id == flares_system.id):
		return flares_system
	elif (id == torpedoes_system.id):
		return torpedoes_system
	elif (id == oxygen_system.id):
		return oxygen_system
	else:
		return null

