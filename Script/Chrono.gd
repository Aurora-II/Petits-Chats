extends Timer

var canReload = true

func _on_Timer_timeout():
	if canReload : 
		canReload = false
		$"../Lose".play()
		print("Perdu !")
		$"../Timer".canReload = false
		StoreScore.score = 0
		yield(get_tree().create_timer(3.5), "timeout")
		get_tree().change_scene("res://start.tscn")
