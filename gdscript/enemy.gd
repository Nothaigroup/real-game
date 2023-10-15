extends CharacterBody2D
class_name enemyy

@export var movement_speed  = 200.0
var alivee  = true
var cantakedmg = true
var weaponname = ''
var weapondmg = 0
var hp = globalvar.hpp+globalvar.level
@onready var player = get_tree().get_first_node_in_group('player')

func _physics_process(_delta):
	var direction = global_position.direction_to(player.position)
	velocity = direction * movement_speed
	move_and_slide()
	update_hpbar()
	
func damage():
	if cantakedmg:
		if hp > 0:
			hp -= weapondmg
			if hp <= 0:
				alivee = false
				if not alivee:
					globalvar.exp += 1
					queue_free()
					
		elif hp > 0:
			print(hp)


func update_hpbar():
	var hpbar = $hp_bar
	hpbar.value = hp
	
	if hp >= 5:
		hpbar.visible = false
	else:
		hpbar.visible = true



func _on_enemy_hitbox_area_entered(_area):
	if _area is bullet :
		weaponname = 'ak'
		weapondmg = 1
		damage()
