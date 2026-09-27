extends CharacterBody2D
class_name FallingObject

@export var minDropSpeed: int
@export var maxDropSpeed: int
@export var objectType: String

@onready var mouseArea: Area2D = $mouseArea

var rng := RandomNumberGenerator.new()
var dropSpeed: int

var currentlyDragging
var topZ = 0
var dragging = false
var mouseOver = false

func _ready():
	mouseArea.input_event.connect(_on_mouse_area_input)
	dropSpeed = rng.randi_range(minDropSpeed, maxDropSpeed)
	add_to_group(objectType)

func _process(delta: float):
	if dragging:
		global_position = get_global_mouse_position()

func _physics_process(_delta: float):
	velocity.y = dropSpeed
	move_and_slide()

func _on_mouse_area_input(viewport, event, int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if currentlyDragging != null:
				return
			
			currentlyDragging = self
			dragging = true
			
			z_index = topZ + 1
			topZ += 1
			
			get_viewport().set_input_as_handled()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if currentlyDragging == self:
				dragging = false
				currentlyDragging = null
