extends Node2D

var score = 0
var playMusic = false

func get_shared_value():
	return score

func set_shared_value(value):
	score = value
