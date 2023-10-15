extends Sprite2D

var can_fire = true
var bullet = preload('res://gdscript/bullet.tscn')

func _ready(): set_as_top_level(true)

func _physics_process(_delta):
	position.x = get_parent().position.x-25
	position.y = get_parent().position.y+80
	var mousepo = get_global_mouse_position()
	look_at(mousepo)

	if Input.is_action_pressed("fire") and can_fire:
		var bulletinstance = bullet.instantiate()
		bulletinstance.rotation = rotation
		bulletinstance.global_position = $Marker2D.global_position
		get_parent().add_child(bulletinstance)
		can_fire = false
		await get_tree().create_timer(0.5-(0.07*globalvar.level)).timeout
		can_fire = true
