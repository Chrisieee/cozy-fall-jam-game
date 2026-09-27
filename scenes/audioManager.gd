extends Node

@onready var musicPlayer = AudioStreamPlayer.new()
@onready var ambientPlayer = AudioStreamPlayer.new()

func _ready():
	add_child(musicPlayer)
	add_child(ambientPlayer)

func play_music(stream: AudioStream):
	musicPlayer.volume_db = -25
	musicPlayer.stream = stream
	musicPlayer.play()

func stop_music():
	musicPlayer.stop()

func play_sound(stream: AudioStream, db: int):
	var player = AudioStreamPlayer.new()
	player.volume_db = db
	player.stream = stream
	add_child(player)
	player.play()

	player.finished.connect(func():
		player.queue_free()
	)
