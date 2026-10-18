class_name Npc
extends Area2D


var room_id: int = 0
var sub_data: SubmarineData
var mouse_inside: bool = false
@onready var crew_world: CrewWorld = get_parent().get_parent()


func on_mouse_entered():
	mouse_inside = true
func on_mouse_exited():
	mouse_inside = false

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("mouse_click") && mouse_inside):
		print("Npc click")


func _ready() -> void:

	connect("mouse_entered", on_mouse_entered)
	connect("mouse_exited", on_mouse_exited)

	sub_data = crew_world.sub_data
	set_room(0)
	
	


func set_room(id: int):
	var old_sys: Subsystem = sub_data.get_subsystem(room_id)
	room_id = id
	var new_sys: Subsystem = sub_data.get_subsystem(id)

	old_sys.npcs -=1
	new_sys.npcs += 1

	var visual_sys: SubsystemVisual = crew_world.get_subsystem_visual(id)
	position = visual_sys.position

