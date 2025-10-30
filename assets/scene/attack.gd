extends State
@export var sprite:AnimatedSprite2D
@export var player:CharacterBody2D
@export var attack_hitbox:Area2D
#var sword_hitbox = preload("res://assets/scene/attack_hitbox.tscn")

func enter():
	#var swordHitBox = sword_hitbox.instantiate()
	#$"../../attack point".add_child(swordHitBox)
	attack_hitbox.show()
	
	
			
	

func update(_delta:float):
	sprite.animation = "attack_mov"

	
func physics_update(delta):
	
	player.velocity.x = lerpf(player.velocity.x,0,0.1)


func _on_sprite_2d_animation_finished() -> void:
		state_machine.change_state("idle")
		attack_hitbox.hide()
