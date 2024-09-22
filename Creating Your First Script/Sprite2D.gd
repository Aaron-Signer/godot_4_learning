extends Sprite2D

var times_clicked: int = 0
var speed: int = 0
var angular_speed: float = 5

signal health_status(health: String)

var label_1: Label

var health: int = 10

func _init():
	print("In Init")

func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(toggle_visibility)
	label_1 = get_node("Label")
	label_1.text = str(health)
	
	

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
		
	if Input.is_action_pressed("ui_up"):
		speed = 500
	else:
		speed = 0

	rotation += angular_speed * direction * delta

	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func take_damage():
	health -= 1
	health_status.emit(str(health))
	
func move(delta):
	var x: int = position.x
	var y: int = position.y
	position.x += delta*speed

func _input(event):
	if event is InputEventKey and event.pressed and OS.get_keycode_string(event.keycode) == "A":
		print("Move Forward")
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			take_damage()
			

func toggle_visibility():
	visible = not visible
	
func _on_timer_timeout():
	visible = not visible

func _on_button_2_pressed():
	set_process(not is_processing())
