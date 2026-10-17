class_name SonarSpinnyThing
extends Area2D


const BLIP_RESOURCE: PackedScene = preload("res://scenes/sonar_blip.tscn")


func _ready() -> void:

	connect("area_entered", _on_area_entered)
	connect("body_entered", _on_body_entered)

func _process(delta: float) -> void:
	position = %PhysicalSub.position
	#position.x += 601
	rotation_degrees += 90 * delta

func spawn_blip(pos: Vector2):

	var blip: SonarBlip = BLIP_RESOURCE.instantiate()
	blip.position = pos
	$"..".add_child(blip)

func _on_area_entered(area: Area2D) -> void:
	spawn_blip(area.global_position)
	print("I saw that: " + area.name)

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "PhysicalSub"): return
	spawn_blip(body.global_position)
	print("I saw that: " + body.name)
