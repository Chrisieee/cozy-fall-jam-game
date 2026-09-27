extends Node2D

@onready var scoreLabel = $scoreLabel

var score = 0

func _ready():
	AudioManager.stop_music()
	AudioManager.play_music(preload("res://scenes/sounds/denis-pavlov-music-autumn-jazz-podcast-acoustic-cozy-relaxing-cafe-606333.mp3"))

func _on_sorting_basket_add_score():
	AudioManager.play_sound(preload("res://scenes/sounds/place.mp3"), -10)
	score += 1 
	scoreLabel.text = str(score)
