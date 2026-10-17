class_name SonarSpinnyThing
extends Area2D


const BLIP_RESOURCE: PackedScene = preload("res://scenes/sonar_blip.tscn")


func _ready() -> void:

	connect("area_entered", _on_area_entered)
	connect("body_entered", _on_body_entered)

func _process(delta: float) -> void:
	position = %PhysicalSub.position
	position.y += 2
	rotation_degrees += 180 * delta

func spawn_blip(pos: Vector2):

	var blip: SonarBlip = BLIP_RESOURCE.instantiate()
	blip.position = pos
	blip.og_pos = pos
	blip.og_trans = blip.transform
	blip.camera = %PhysicalSub/Camera2D
	blip.plr = %PhysicalSub
	blip.setup()
	$"../".add_child(blip)

func _on_area_entered(area: Area2D) -> void:
	spawn_blip(area.position)

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "PhysicalSub"): return
	spawn_blip(body.position)
