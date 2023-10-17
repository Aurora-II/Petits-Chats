extends Node2D

var cross = false
var icon = Sprite.new()
var line 

func _process(_delta):
	line = get_node("../Line2D")
	var points = line.points
	var intersections = find_intersections(points)

	# Show intersections somehow
	for pos in intersections:
		if !cross :
			icon.name = "cross"
			icon.position = pos
			icon.texture = preload("../Assets/cross.png")
			icon.scale = Vector2(0.5, 0.5)
			line.add_child(icon)
			cross = true
			$"../Score".canWin = false
		
			$"../Lose".play()
			print("Perdu !")
			$"../Timer".canReload = false
			StoreScore.score = 0
			yield(get_tree().create_timer(1.0), "timeout")
			get_tree().change_scene("res://start.tscn")

func removeCross():
	if icon != null and cross: 
		line.remove_child(icon)
		cross = false

func find_intersections(points):
	var intersections = []

	for i in range(1, len(points)):

		for j in range(1 + i, len(points)):
			if abs(j - i) < 2:
				continue
			var begin0 = points[i - 1]
			var end0 = points[i]

			var begin1 = points[j - 1]
			var end1 = points[j]

			var intersection = get_segment_intersection(begin0, end0, begin1, end1)
			if intersection != null:
				intersections.append(intersection)
				
	return intersections


static func get_segment_intersection(a, b, c, d):
	var cd = d - c
	var ab = b - a
	var div = cd.y * ab.x - cd.x * ab.y

	if abs(div) > 0.001:
		var ua = (cd.x * (a.y - c.y) - cd.y * (a.x - c.x)) / div
		var ub = (ab.x * (a.y - c.y) - ab.y * (a.x - c.x)) / div
		var intersection = a + ua * ab
		if ua >= 0.0 and ua <= 1.0 and ub >= 0.0 and ub <= 1.0:
			return intersection
		return null

	return null
