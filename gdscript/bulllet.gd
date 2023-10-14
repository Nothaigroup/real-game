extends Area2D

@export var speed = 2000

func _ready(): set_as_top_level(true)

func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation) * delta
	
func _physics_process(_delta):
	await get_tree().create_timer(0.01).timeout
	set_physics_process(false)
	
	
	
func is_on_screen():
	queue_free()
	
	
func _on_bullet_body_entered(_body):
	queue_free()
