class_name Subsystem
extends Resource

@export var id: int
@export var max_value: float = 100
@export var value: float:
	set(new_value):
		if (new_value > max_value):
			value = max_value
			return
		value = new_value

@export var fix_speed: float = 0
var npcs: int = 0


func get_percent_full() -> float:
	return float(value) / max_value

func get_percent_empty() -> float:
	return float(max_value - value) / max_value

func update(delta: float):

	value += fix_speed * delta * float(npcs)
