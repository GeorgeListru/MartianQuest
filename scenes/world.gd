extends Node2D

@onready var player = $Player
@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $DeathZone
@export var next_level:PackedScene = null


func _ready():
	player.global_position = start.get_start_pos()
	death_zone.connect("body_entered", _on_death_zone_body_entered)
	var jump_pads = get_tree().get_nodes_in_group("jump_pads")
	for jump_pad in jump_pads:
		jump_pad.connect("body_entered", jump_pad.player_jump)
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("hit_player", _on_trap_hit_player)
	
func _on_trap_hit_player():
	player.global_position = start.get_start_pos()
	player.velocity = Vector2(0,0)

func _on_death_zone_body_entered(_body):
	player.global_position = start.get_start_pos()
	player.velocity = Vector2(0,0)

func _on_exit_body_entered(_body):
	exit.animate()
	if next_level:
		player.freeze = true
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(next_level)
