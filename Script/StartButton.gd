extends Button

func _ready():
	var texture = preload("res://Assets/start.png")
	set_button_texture(texture)

func _on_StartButton_mouse_entered():
	var texture = preload("res://Assets/startHover.png")
	set_button_texture(texture)
	print(icon.resource_name)

func _on_StartButton_mouse_exited():
	var texture = preload("res://Assets/start.png")
	set_button_texture(texture)
	
func set_button_texture(texture):
	icon = texture


func _on_StartButton_pressed():
	$"../Start".play()
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://lit.tscn")


func _on_StartButton2_mouse_exited():
	pass # Replace with function body.
