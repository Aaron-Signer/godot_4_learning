extends Label

func _init():
	set_as_top_level(true)
	position.x = 0
	position.y = 0

#func _readY():
#	var sprite_2d = get_node("../Sprite2D")
#	sprite_2d.health_status.connect(set_health)

#func _on_sprite_2d_health_status(health):
#	text = health
	
	
func set_health(health):
	text = health
