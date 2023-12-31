extends CharacterBody2D

@export var speed = 500
@onready var animation = $AnimationPlayer

func handleInput():
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	velocity = direction*speed

func updateanimation():
	if velocity.length() ==0:
		animation.stop()
	else:
		var direction = 'Down'
		if velocity.x < 0:direction = 'Left'
		elif velocity.x > 0:direction = 'Right'
		elif velocity.y < 0 :direction = 'Up'

		animation.play('walk'+direction)

func _physics_process(_delta):
	handleInput()
	move_and_slide() 
	updateanimation()
