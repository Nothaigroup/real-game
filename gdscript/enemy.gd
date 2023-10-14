extends CharacterBody2D

@export var movement_speed  = 200.0
var alive  = true
var hp = 5
var cantakedmg = true
var weaponname = ''
var weapondmg = 0

@onready var playerr = get_tree().get_first_node_in_group('huh')

func _physics_process(_delta):
	var directionn = global_position.direction_to(playerr.global_position)
	velocity = directionn*movement_speed
	move_and_slide()
	update_hpbar()
	
	
func damage():
	if cantakedmg:
		if hp > 0:
			hp -= weapondmg
			if hp <= 0:
				alive =false
				if not alive:
					queue_free()
		elif hp > 0:
			print(hp)
			


func _on_area_2d_area_entered(_area):
	weaponname = 'ak'
	weapondmg = 1
	damage()

func update_hpbar():
	var hpbar = $hp_bar
	hpbar.value = hp
	
	if hp >= 10:
		hpbar.visible = false
	else:
		hpbar.visible = true
	
	
	
func enemy():
	pass
