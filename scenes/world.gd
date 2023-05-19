extends Node2D

@onready var player = $Player
@onready var spawn_position = $SpawnPosition
@onready var jump_pad = $JumpPad

func _on_area_2d_body_entered(body):
	player.global_position = spawn_position.global_position
	player.velocity = Vector2(0,0)


func _on_jump_pad_body_entered(body):
	jump_pad.player_jump()
	body.jump(300)



func _on_trap_hit_player():
	player.global_position = spawn_position.global_position
	player.velocity = Vector2(0,0)


