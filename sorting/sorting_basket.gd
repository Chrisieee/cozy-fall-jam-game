extends Area2D

@export var type: String
@export var spriteTexture: Texture2D

@onready var sprite = $Sprite2D

signal addScore

func _ready():
	sprite.texture = spriteTexture
	
	add_to_group(type)
	body_entered.connect(_on_body_entered)

func _on_body_entered(node):
	if node.is_in_group(type):
		node.queue_free()
		addScore.emit()
	else:
		AudioManager.play_sound(preload("res://scenes/sounds/freesound_community-wrong-47985.mp3"), -15)
