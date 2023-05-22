extends StaticBody2D

@onready var marker = $Marker2D

func get_start_pos():
	return marker.global_position
