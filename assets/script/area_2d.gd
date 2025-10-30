extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var random_x
var random_y

func _ready() -> void:
	random_x = rng.randi_range(-1000,1000)
	random_y = rng.randi_range(2,3)
	

func _process(delta: float) -> void:
	$Ninjastar.rotation_degrees += 2
	
func _physics_process(delta: float) -> void:
	
	if velocity.y > 0:
		velocity.y += get_gravity().y * 0.5 * delta * random_y
	elif velocity.y <=0:
		velocity.y += get_gravity().y * delta * random_y * 0.3
	velocity.x += random_x * delta
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.is_in_group("ground"):
		velocity = Vector2.ZERO
		$CPUParticles2D.emitting = true
		$Ninjastar.hide()
		print(body)
		


func _on_cpu_particles_2d_finished() -> void:
	queue_free()
