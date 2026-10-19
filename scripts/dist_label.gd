extends Label


@onready var game_world: GameWorld = $"../SubViewportContainer/SubViewport/GameWorld"
@onready var sub: PhysicalSub = game_world.get_node("PhysicalSub")
@onready var end: Sprite2D = game_world.get_node("EndThing")

func _process(_delta: float) -> void:
	
	text = "Distance\n" + str(int(end.position.distance_to(sub.position)))
