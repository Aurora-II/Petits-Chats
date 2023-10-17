extends Line2D

var previous_mouse_position = get_global_mouse_position()
var distance = 0
var canDraw = false

func _ready():
	distance = 0
	clear_points()
	$"../CheckCollision".removeCross()
	previous_mouse_position = get_global_mouse_position()
	canDraw = true
	
func _process(_delta):
	drawLine()

#Draw the line
func drawLine() :
	var current_mouse_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("left_mouse_click") :
		clear_points()
		distance = 0
		$"../CheckCollision".removeCross()
		
	if distance < 450 and current_mouse_position != previous_mouse_position and canDraw :
		if Input.is_action_pressed("left_mouse_click") :
			add_point(get_local_mouse_position())
			distance = getLineLength()
						
	previous_mouse_position = current_mouse_position		
	
#Get the size of the line
func getLineLength():
	var length = 0.0
	var previous_point = null

	for point in points:
		if previous_point:
			length += previous_point.distance_to(point)
		previous_point = point

	return length
