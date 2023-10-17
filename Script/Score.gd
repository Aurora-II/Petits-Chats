extends Label

var canWin = true
var score

func _ready():
	canWin = true
	text = "Score : " + str(StoreScore.score)

func _process(_delta):
	if $"../Line2D".distance > 450 and canWin:
		canWin = false
		$"../Miaou".play()
		print ("Gagné")
		StoreScore.score = StoreScore.score + 1
		text = "Score : " + str(StoreScore.score)
		$"../Timer".stop()
		$"../Time".stop()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().reload_current_scene()
