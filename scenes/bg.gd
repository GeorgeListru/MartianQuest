extends ParallaxBackground

@export var scroll_speed = 15
@onready var sprite = $ParallaxLayer/Sprite2D
@export var texture:Texture2D = preload("res://textures/bg/Blue.png")
func _ready():
	sprite.texture = texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
