extends Node2D
signal hit_player


func _on_area_2d_body_entered(body):
	hit_player.emit()
