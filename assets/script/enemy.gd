extends CharacterBody2D
var enemy = Enemy.new()
@export var stats:Enemy1_stats
var speed:int = 200
var direction = 1
@onready var ray_cast_left: RayCast2D = $"marker left/RayCast left"
@onready var ray_cast_right: RayCast2D = $"marker right/RayCast right"
@onready var ray_cast_right_wall: RayCast2D = $"marker right/RayCast right wall"
@onready var ray_cast_left_wall: RayCast2D = $"marker left/RayCast left wall"
@onready var vision:Area2D = $Area2D2

func ready():
	pass
func _process(delta: float) -> void:
	$Label.text = str(stats.health)

func _physics_process(delta: float) -> void:
	if enemy.knockback_timer > 0:
		velocity = -enemy.knockback
		enemy.knockback_timer -= delta 
		if enemy.knockback_timer <= 0:
			enemy.knockback = Vector2.ZERO 
	else:
			velocity.y += get_gravity().y * delta
			
			
	



	move_and_slide()
	
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("attackHB"):
		var player = area.get_parent().get_parent()
		var damage = player.weapon.current_weapon.damage
		enemy.direction = Vector2(area.global_position - global_position).normalized()
		$CPUParticles2D.direction = -1 * Vector2(area.global_position - global_position).normalized()
		$CPUParticles2D.emitting = true
		take_damage(damage)
		
		enemy.apply_knockback(enemy.direction,400,0.18)
func take_damage(damage:int):
	stats.health -= damage
	Hitstop.hit_stop()
	if stats.health <= 0:
		queue_free()
