extends Area2D

func _process(_delta):
	var cursor_position = get_global_mouse_position()
	set_global_position(cursor_position)

