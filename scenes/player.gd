extends CharacterBody2D

@export var gravity = 600
@export var speed = 100
@export var jumpforce = 200
@onready var animated_sprite = $AnimatedSprite2D
var freeze = false

func _physics_process(delta):
	velocity.y += gravity * delta
	if velocity.y > 500 && !is_on_floor():
		velocity.y = 500
	var direction = 0
	if !freeze:
		if Input.is_action_just_pressed("jump"): 
			jump(jumpforce)
		
		direction = Input.get_axis("left", "right")
	velocity.x = direction * speed * delta * 100
	
	if direction!=0:
		animated_sprite.flip_h = direction==-1

	handle_movement_anim(direction)	
	move_and_slide()

func jump(force):
	velocity.y = -force

func handle_movement_anim(direction):
	if direction == 0 && is_on_floor():
		animated_sprite.play("idle")
	if direction!=0 && is_on_floor():
		animated_sprite.play("run")
	if velocity.y>0 && !is_on_floor():
		animated_sprite.play("fall")
	if velocity.y<0 && !is_on_floor():
		animated_sprite.play("jump")
	
