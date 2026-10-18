class_name Npc
extends AnimatedSprite2D


var room_id: int = 0
var sub_data: SubmarineData
@onready var crew_world: CrewWorld = get_parent().get_parent()


func _ready() -> void:

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

