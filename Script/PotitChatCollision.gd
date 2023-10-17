extends StaticBody2D

var icon = Sprite.new()


#func loseGame():
#	if $"../../../Line2D".distance < 450 :
#		icon.name = "cross"
#		icon.position = $"../../../Cursor".position
#		icon.texture = preload("../Assets/cross.png")
#		icon.scale = Vector2(0.5, 0.5)
#		icon.z_index=2
#		$"../../..".add_child(icon)
#		print("Perdu")
#
#		yield(get_tree().create_timer(3.0), "timeout")
#		get_tree().reload_current_scene()
		
