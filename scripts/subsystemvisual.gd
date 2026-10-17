class_name SubsystemVisual
extends Sprite2D


@export var sub_data: SubmarineData
@export var sys_id: int = 0
var sys: Subsystem


func _ready() -> void:
	sys = sub_data.get_subsystem(sys_id)

func _process(_delta: float) -> void:
	modulate.g = sys.get_percent_full() * 1.0
	modulate.b = sys.get_percent_full() * 1.0
