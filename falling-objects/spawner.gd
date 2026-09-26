extends Node2D

@export var leavesScene: PackedScene
@export var chestnutScene: PackedScene
@export var acornScene: PackedScene
@export var beechNutsScene: PackedScene
@export var spawnArea: CollisionShape2D

var rng := RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	spawnObjects(leavesScene)
	spawnObjects(chestnutScene)
	spawnObjects(acornScene)
	spawnObjects(beechNutsScene)

func spawnObjects(scene):
	for i in range(5):
		var object = scene.instantiate()
		var spawnPos = getRandomPosition()
		addObject.call_deferred(object, spawnPos)
		
		object.global_position = getRandomPosition()

func addObject(object, spawnPos):
	get_tree().current_scene.add_child(object)
	object.global_position = spawnPos

func getRandomPosition():
	var area = spawnArea.shape as RectangleShape2D
	var size = area.size
	
	var x = rng.randf_range(-size.x / 2.0, size.x / 2.0)
	var y = rng.randf_range(-size.y / 2.0, size.y / 2.0)
	
	var localPos = Vector2(x, y)
	return spawnArea.to_global(localPos)
