extends Node2D

func _ready():
	if StoreScore.playMusic :
		$Time.stop()
	else : 
		$Time.play()
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_select") :
		
		StoreScore.playMusic = !StoreScore.playMusic
		if StoreScore.playMusic :
			$Time.stop()
		else : 
			$Time.play()
		
	
	var timeLeft = "%.2f" % $Timer.time_left
	$AffichagePosition.text = "Chrono : " + str(timeLeft)
