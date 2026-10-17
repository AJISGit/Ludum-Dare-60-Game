class_name Subsystem
extends Resource

@export var id: int
@export var max_value: int = 100
@export var value: int = max_value:
	set(new_value):
		if (new_value > max_value):
			value = max_value
			return
		value = new_value

@export var fix_speed: int = 0


