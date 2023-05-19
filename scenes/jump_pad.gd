extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

func player_jump():
	animated_sprite.play("jump")
