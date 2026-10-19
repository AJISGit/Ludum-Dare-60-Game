class_name AmbienceStreamPlayer
extends AudioStreamPlayer



func restart_sound() -> void:
	play(70)


func _process(_delta: float) -> void:

	if (get_playback_position() >= 82):
		print("Restart sound")
		play()

