extends SubViewportContainer


func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CursorShape.CURSOR_CROSS)
	print("cross")
func _on_mouse_exited():
	print("arrow")
	Input.set_default_cursor_shape(Input.CursorShape.CURSOR_ARROW)

func _ready() -> void:

	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
