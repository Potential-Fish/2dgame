extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D
var is_attacking:bool
#var sword_hitbox = preload("res://assets/scene/attack_hitbox.tscn")

func enter():
	#var swordHitBox = sword_hitbox.instantiate()
	#$"../../attack point".add_child(swordHitBox)
	attack_hitbox.show()
	
	
			
	

func update(_delta:float):
	print(sprite.animation)
	if is_attacking == false:
		if player.is_on_floor() == false:
		
			sprite.play("jump attack")
			is_attacking = true
		if player.is_on_floor() == true:
			sprite.animation = "attack_mov"
			is_attacking = true
func physics_update(delta):
	if player.is_on_floor():
		player.velocity.x = lerpf(player.velocity.x,0,0.1)
	

func _on_sprite_2d_animation_finished() -> void:
		state_machine.change_state("idle")
		attack_hitbox.hide()
func exit():
	is_attacking = false
