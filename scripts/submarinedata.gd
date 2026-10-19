class_name SubmarineData
extends Node

@export var break_timer: Timer

@export_group("Subsystems")
@export var engines_system: Subsystem
@export var torpedoes_system: Subsystem
@export var oxygen_system: Subsystem
@export var control_system: Subsystem


func break_stuff():

	var sys: Subsystem = get_subsystem(randi_range(0, 3))
	sys.value -= randi_range(50, 100)


func _on_break_timer_timeout():
	print("uh oh")
	break_stuff()
	break_timer.start(randi_range(10, 30))


func _ready() -> void:
	break_timer.connect("timeout", _on_break_timer_timeout)


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


func _process(delta: float) -> void:
	engines_system.update(delta)
	torpedoes_system.update(delta)
	oxygen_system.update(delta)
	control_system.update(delta)
