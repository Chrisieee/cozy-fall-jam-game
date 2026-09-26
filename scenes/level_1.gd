extends Node2D

@onready var scoreLabel = $scoreLabel

var score = 0

func _on_sorting_basket_add_score():
	score += 1 
	scoreLabel.text = str(score)
