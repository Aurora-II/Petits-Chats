extends StaticBody2D

var icon = Sprite.new()
var canLose = false

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	canLose = true

func _on_Cursor_body_entered(_body):
	if Input.is_action_pressed("left_mouse_click") and canLose:
		loseGame()
		
func loseGame():
	if $"../../../Line2D".distance < 450 :
		icon.name = "cross"
		icon.position = $"../../../Cursor".position
		icon.texture = preload("../Assets/cross.png")
		icon.scale = Vector2(0.5, 0.5)
		icon.z_index=2
		$"../../..".add_child(icon)
		$"../../../Score".canWin = false
		
		$"../../../Lose".play()
		print("Perdu !")
		$"../../../Time".stop()
		$"../../../Timer".stop()
		$"../../../Timer".canReload = false
		StoreScore.score = 0
		yield(get_tree().create_timer(3.5), "timeout")
		get_tree().change_scene("res://start.tscn")





