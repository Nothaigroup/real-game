extends Sprite2D

func _physics_process(delta):
	position.x = get_parent().position.x-25
	position.y = get_parent().position.y+80
	var mousepo = get_global_mouse_position()
	look_at(mousepo)
