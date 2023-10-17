extends Button

func _ready():
	var texture = preload("res://Assets/quit.png")
	set_button_texture(texture)

func _on_StartButton2_mouse_entered():
	var texture = preload("res://Assets/quitHover.png")
	set_button_texture(texture)
	print(icon.resource_name)

func _on_StartButton2_mouse_exited():
	var texture = preload("res://Assets/quit.png")
	set_button_texture(texture)

func _on_StartButton2_pressed():
	get_tree().quit()
	
func set_button_texture(texture):
	icon = texture
	
	



