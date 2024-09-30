extends Node2D

@onready var character_body_2d = $CharacterBody2D/AnimatedSprite2D
@export var pipes_scene: PackedScene
@onready var spawn_marker_l = $Marker2D
@onready var spawn_marker_u = $Marker2D2
@onready var pipes_container = $PipesContainer
@onready var pipe_spawn_timer = $PipeSpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.has_died.connect(has_died)
	spawn_pipe()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#480x854
func _on_timer_timeout():
	spawn_pipe()

func spawn_pipe() -> void:
	var pipes = pipes_scene.instantiate()
	pipes.position = Vector2(550,randf_range(spawn_marker_u.position.y, spawn_marker_l.position.y))
	
	pipes_container.add_child(pipes)
	
func has_died():
	pipe_spawn_timer.stop()
	
