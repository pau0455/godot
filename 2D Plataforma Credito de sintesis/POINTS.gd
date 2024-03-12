extends Node
@onready var points_label = %points_label

var points = 0

func add_point():
	points += 1 
	print(points)
	points_label.text = str(points)
