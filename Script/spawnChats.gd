extends Node2D

# Variables to define the spawn area
var spawn_area_rect = Rect2(Vector2(-190, -250), Vector2(375, 450))
var actor_scene = preload("res://PotitChat.tscn") # Replace with the path to your actor scene
var positionInArea = Vector2(200, 100)
var nbChats = 1

func _ready():
	randomize()
	nbChats = ceil((StoreScore.score + 1)/2) + 1
	spawn_actors(nbChats)

func spawn_actors(num_actors):
	for _i in range(num_actors):
		var random_position = Vector2(
			rand_range(spawn_area_rect.position.x, spawn_area_rect.end.x),
			rand_range(spawn_area_rect.position.y, spawn_area_rect.end.y)
		)

		var actor_instance = actor_scene.instance()
		actor_instance.position = random_position
		add_child(actor_instance)
