class_name SonarSpinnyThing
extends Area2D


const BLIP_RESOURCE: PackedScene = preload("res://scenes/sonar_blip.tscn")
const sub_blip_tex: Texture2D = preload("res://sprites/SonarBlipSub.png")
const sub_blip_torp: Texture2D = preload("res://sprites/SonarBlipTorp.png")


func _ready() -> void:

	connect("area_entered", _on_area_entered)
	connect("body_entered", _on_body_entered)

func _process(delta: float) -> void:
	position = %PhysicalSub.position
	position.y += 2
	rotation_degrees += 360 * delta

func spawn_blip(pos: Vector2, is_sub: bool):

	var blip: SonarBlip = BLIP_RESOURCE.instantiate()
	blip.position = pos
	blip.og_pos = pos
	blip.og_trans = blip.transform
	blip.camera = %PhysicalSub/Camera2D
	blip.plr = %PhysicalSub

	if (is_sub):
		blip.texture = sub_blip_tex
	else:
		blip.texture = sub_blip_torp

	blip.setup()
	$"../".add_child(blip)

func _on_area_entered(area: Area2D) -> void:
	if (area as Torpedo):
		spawn_blip(area.position, false)
	else:
		spawn_blip(area.position, true)

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "PhysicalSub"): return
	spawn_blip(body.position, true)
