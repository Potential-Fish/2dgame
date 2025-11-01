extends CharacterBody2D
var enemy = Enemy.new()
@export var stats:Enemy1_stats

var direction_1 = 1
@onready var ray_cast_left: RayCast2D = $"RayCast left"
@onready var ray_cast_right: RayCast2D = $"RayCast right"
func ready():
	pass
func _process(delta: float) -> void:

	if enemy.health == 0:
		queue_free()
func _physics_process(delta: float) -> void:
	if enemy.knockback_timer > 0:
		velocity = -enemy.knockback
		enemy.knockback_timer -= delta 
		if enemy.knockback_timer <= 0:
			enemy.knockback = Vector2.ZERO 
	else:
			velocity.y += get_gravity().y * delta
			velocity.x = 10000 * delta * direction_1
			
	
			if ray_cast_left.is_colliding() == false:
				direction_1 = 1
			if ray_cast_right.is_colliding() == false:
				direction_1 = -1
		

	move_and_slide()
	
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("attackHB"):
		var player = area.get_parent().get_parent()
		var damage = player.weapon.current_weapon.damage
		enemy.direction = Vector2(area.global_position - global_position).normalized()
		take_damage(damage)
		
		enemy.apply_knockback(enemy.direction,400,0.18)
func take_damage(damage:int):
	stats.health -= damage
	if stats.health <= 0:
		queue_free()
