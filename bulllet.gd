extends Area2D

@export var speed = 2000

func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation) * delta
	
func _physics_process(delta):
	await get_tree().create_timer(0.01)
	set_physics_process(false)
	
	
	
func is_on_screen():
	queue_free()
	
	
func _on_bullet_body_entered(body):
	queue_free
