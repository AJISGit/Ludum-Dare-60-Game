class_name SonarSpinnyThing
extends Area2D


const BLIP_RESOURCE: PackedScene = preload("res://scenes/sonar_blip.tscn")
const sub_blip_tex: Texture2D = preload("res://sprites/SonarBlipSub.png")
const sub_blip_torp: Texture2D = preload("res://sprites/SonarBlipGoodTorp.png")
const sub_blip_torp_good: Texture2D = preload("res://sprites/SonarBlipTorp.png")
var control_sys: Subsystem 


func _ready() -> void:

	connect("area_entered", _on_area_entered)
	connect("body_entered", _on_body_entered)

func _process(delta: float) -> void:
	control_sys = get_parent().get_parent().get_parent().get_parent().get_node("SubmarineData").control_system
	position = %PhysicalSub.position
	position.y += 2
	if (control_sys.value < control_sys.max_value):

		visible = false
		%PhysicalSub.visible = false
		$"../CanvasLayer/Error".visible = true

		return
	else:
		visible = true
		%PhysicalSub.visible = true
		$"../CanvasLayer/Error".visible = false


	rotation_degrees += 540 * delta

func spawn_blip(pos: Vector2, is_sub: bool, plr_torp: bool):

	if (control_sys.value < control_sys.max_value): return

	var blip: SonarBlip = BLIP_RESOURCE.instantiate()
	blip.position = pos
	blip.og_pos = pos
	blip.og_trans = blip.transform
	blip.camera = %PhysicalSub/Camera2D
	blip.plr = %PhysicalSub

	if (is_sub):
		blip.texture = sub_blip_tex
	else:
		if (!plr_torp):
			blip.texture = sub_blip_torp_good
		else:
			blip.texture = sub_blip_torp

	blip.setup()
	$"../".add_child(blip)

func _on_area_entered(area: Area2D) -> void:
	if (area as TorpedoTarget): return
	if (area as Torpedo):
		if (area.from_plr):
			spawn_blip(area.position, false, true)
		else:
			spawn_blip(area.position, false, false)
	else:
		spawn_blip(area.position, true, false)

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "PhysicalSub"): return
	spawn_blip(body.position, true, false)
