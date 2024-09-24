extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

@export var jump_speed: int = -400
signal hit_floor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	velocity.y += get_gravity().y*delta
	
	if Input.is_action_just_pressed("jump"):
		animation_player.play("jump")
		velocity.y = jump_speed
		
	move_and_slide()
	
	if is_on_floor():
		animated_sprite_2d.stop()
		hit_floor.emit()
