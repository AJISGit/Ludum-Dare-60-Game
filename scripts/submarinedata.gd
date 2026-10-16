class_name SubmarineData
extends Node


class Subsystem:

	var max_value: int = 100
	var value: int = max_value:
		set(new_value):
			if (new_value > max_value):
				value = max_value
				return
			value = new_value


func _ready() -> void:

	var test_system: Subsystem = Subsystem.new()
	test_system.value = 1
	print(test_system.value)

