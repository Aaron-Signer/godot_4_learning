extends Node2D

const EXPLODE = preload("res://assets/explode.wav")

@export var gem_scene: PackedScene

@onready var score_label: Label = $Score
@onready var gem_spawner: GemSpawner = $GemSpawner
@onready var audio_stream_player = $AudioStreamPlayer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var _score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func stop_everything() -> void:
	gem_spawner.stop()
	var children_list = get_children()
	for child in children_list:
		child.set_process(false)

func play_game_over_sound() -> void:
	audio_stream_player.stop()
	audio_stream_player_2d.stop()
	audio_stream_player_2d.stream = EXPLODE
	audio_stream_player_2d.play()

func game_over() -> void:
	play_game_over_sound()
	stop_everything()

func _on_gem_spawner_timeout():
	print("in spawner")
	var gem: Gem = gem_scene.instantiate()
	var random_x = randf_range(50, 1000)
	gem.position = Vector2(random_x, -50)
	gem.on_gem_off_screen.connect(game_over)
	add_child(gem)


func _on_paddle_area_entered(area):
	_score += 1
	score_label.text =  "%05d" % _score
	audio_stream_player_2d.position = area.position
	audio_stream_player_2d.play()
	area.queue_free()
