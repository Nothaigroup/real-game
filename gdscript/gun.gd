extends Sprite2D

var can_fire = true
var bullet = preload('res://bullet.tscn')

func _physics_process(_delta):
	position.x = get_parent().position.x-25
	position.y = get_parent().position.y+80
	var mousepo = get_global_mouse_position()
	look_at(mousepo)

	if Input.is_action_pressed("fire") and can_fire:
		var bulletinstance = bullet.instantiate()
		bulletinstance.rotation = rotation
		bulletinstance.position = $Marker2D.position
		get_parent().add_child(bulletinstance)
		can_fire = false
		get_tree().create_timer(0.2)
		can_fire = true
