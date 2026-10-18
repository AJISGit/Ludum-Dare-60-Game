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
var npcs: int = 0


func get_percent_full() -> float:
	return float(value) / max_value

func get_percent_empty() -> float:
	return float(max_value - value) / max_value

