extends CharacterBody2D
class_name FallingObject

@export var minDropSpeed: int
@export var maxDropSpeed: int
@export var objectType: String

var rng := RandomNumberGenerator.new()
var dropSpeed: int

func _ready():
	dropSpeed = rng.randi_range(minDropSpeed, maxDropSpeed)
	#add to group

func _physics_process(_delta: float):
	velocity.y = dropSpeed
	move_and_slide()
