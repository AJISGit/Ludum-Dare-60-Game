class_name SubsystemVisual
extends Area2D


@onready var sub_data: SubmarineData = $"../../SubmarineData"
@export var sys_id: int = 0
var sys: Subsystem
var mouse_inside: bool = false

func on_mouse_entered():
	mouse_inside = true
func on_mouse_exited():
	mouse_inside = false

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("mouse_click") && mouse_inside):

		for npc in $"../Npcs".get_children():
			if (npc.mouse_inside):
				return

		print("Room click")

func _ready() -> void:
	sys = sub_data.get_subsystem(sys_id)
	connect("mouse_entered", on_mouse_entered)
	connect("mouse_exited", on_mouse_exited)

func _process(_delta: float) -> void:
	modulate.g = sys.get_percent_full() * 1.0
	modulate.b = sys.get_percent_full() * 1.0
