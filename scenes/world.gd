extends Node2D

@onready var player = $Player
@onready var jump_pad = $JumpPad
@onready var start = $Start
@onready var exit = $Exit
func _ready():
	player.global_position = start.get_start_pos()

func _on_jump_pad_body_entered(body):
	jump_pad.player_jump()
	body.jump(300)

func _on_trap_hit_player():
	player.global_position = start.get_start_pos()
	player.velocity = Vector2(0,0)

func _on_death_zone_body_entered(_body):
	player.global_position = start.get_start_pos()
	player.velocity = Vector2(0,0)


func _on_exit_body_entered(_body):
	exit.animate()
