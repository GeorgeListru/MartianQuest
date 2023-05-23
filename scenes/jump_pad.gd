extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@export var jump_force = 300


func player_jump(body):
	body.jump(jump_force)
	animated_sprite.play("jump")
