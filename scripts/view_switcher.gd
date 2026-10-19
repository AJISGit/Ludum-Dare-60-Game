class_name ViewSwitcher
extends Node


enum View { crew, control, none }
var current_view: View = View.none
@export var start_view: View

func switch_to(new_view: View):

	if (new_view == current_view):
		return
	if (new_view == View.none):
		return

	current_view = new_view
	if (new_view == View.control):
		$"../CrewWorld/Camera2D".enabled = false
		$"../CrewWorld".visible = false

#		$"../SonarThing".visible = true
		$"../TextureRect2".visible = true
		%SubViewport/GameWorld.visible = true
		%SubViewport/GameWorld/PhysicalSub/Camera2D.enabled = true
	else:
		$"../SonarThing".visible = false
		$"../TextureRect2".visible = false
		%SubViewport/GameWorld.visible = false
		%SubViewport/GameWorld/PhysicalSub/Camera2D.enabled = false

		$"../CrewWorld/Camera2D".enabled = true
		$"../CrewWorld".visible = true


func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("switch_view")):
		if (current_view == View.crew):
			switch_to(View.control)
		else:
			switch_to(View.crew)


func _ready() -> void:
	switch_to(start_view)

