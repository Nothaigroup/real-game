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
	enemy_attacking()
	update_hp()
	
	if hp <= 0:
		self.queue_free()


var enemyatk_range = false
var enemyatk_cooldown = true
var hp = 10
var player_alive = true

func _on_player_hitbox_body_entered(body):
	if body.has_method('enemy'):
		enemyatk_range = true
		


func _on_player_hitbox_body_exited(body):
	if body.has_method('enemy'):
		enemyatk_range = false
		
func enemy_attacking():
	if enemyatk_range and enemyatk_cooldown == true:
		hp -= 1
		enemyatk_cooldown = false
		$atk_cd.start()
		print(hp)
	
func _on_atk_cd_timeout():
	enemyatk_cooldown = true
	


func update_hp():
	var health = $hpbar
	health.value = hp
	if hp >= 10:
		health.visible = false
	else:
		health.visible = true

func player():
	pass

