extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.has_died.connect(stop_pipe)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= GameManager.PIPES_SCROLL_SPEED*delta
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func stop_pipe() -> void:
	set_process(false)
