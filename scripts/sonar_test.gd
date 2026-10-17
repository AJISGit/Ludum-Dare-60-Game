extends TextureRect


func _ready() -> void:
	var sub_viewport: SubViewport = %SubViewport
	texture = sub_viewport.get_texture()
