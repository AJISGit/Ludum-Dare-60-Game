class_name Npc
extends Area2D


var room_id: int = 0
var sub_data: SubmarineData
var mouse_inside: bool = false
var clicked: bool = false
@onready var crew_world: CrewWorld = get_parent().get_parent()
@export var start_room: int = 0
@export var npc_num: int = 1


func on_mouse_entered():
	mouse_inside = true
func on_mouse_exited():
	mouse_inside = false

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("mouse_click")):

		print("Npc click")
		
		if (clicked):

			var clicked_room: SubsystemVisual
			for child in get_parent().get_parent().get_children():
				var room: SubsystemVisual = child as SubsystemVisual
				if (!room):
					continue

				if (!room.mouse_inside):
					continue

				for npc in $"../".get_children():
					if (npc == self):
						continue
					if (npc.mouse_inside):
						clicked = false
						return

				clicked_room = room
				print("Found it")
				break

			if (!clicked_room):
				clicked = false
				print("Never mind")
				return

			print("Room: " + clicked_room.name)
			set_room(clicked_room.sys_id)
			clicked = false

		else:

			if (!mouse_inside): return

			clicked = true





func _ready() -> void:

	connect("mouse_entered", on_mouse_entered)
	connect("mouse_exited", on_mouse_exited)

	sub_data = crew_world.sub_data
	set_room(start_room)

func _process(delta: float) -> void:
	if (clicked):
		modulate = Color(1.5, 1.5, 1.5)
	else:
		modulate = Color(1.0, 1.0, 1.0)


func set_room(id: int):
	print("Next room: " + str(id))
	var old_sys: Subsystem = sub_data.get_subsystem(room_id)
	room_id = id
	var new_sys: Subsystem = sub_data.get_subsystem(id)

	old_sys.npcs -=1
	new_sys.npcs += 1

	var visual_sys: SubsystemVisual = crew_world.get_subsystem_visual(id)
	if (npc_num == 1):
		position = visual_sys.get_node("Npc1").global_position
	else:
		position = visual_sys.get_node("Npc2").global_position

	position.y -= 8.0
