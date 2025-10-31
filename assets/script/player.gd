extends CharacterBody2D
var input_order:Array
var speed: int = 15000
var knockback_timer:float
var knockback:Vector2
var direction
var facing_dir:String = "right"
var largest
signal touched_ground
var remote = RemoteTransform2D.new()
var star = preload("res://assets/scene/area_2d.tscn")
func _ready() -> void:
	$Sprite2D.frame = 5
	add_child(remote)
	remote.set_remote_node("enemy")
	remote.use_global_coordinates = true
	
func _physics_process(delta: float) -> void:
	attack_point()
	#print(remote.global_position)
	print(remote.get_remote_node())
	
	remote.set_update_position(true)
	if Input.is_action_just_pressed("left click"):
		#spawn_star()
		pass
	if knockback_timer > 0:
		print(knockback_timer)
		$".".velocity = -knockback
		knockback_timer -= delta 
	else:
		if $"State Machine".current_state == $"State Machine/idle" :
			velocity.x = 0
		

	
	if Input.is_action_just_pressed("left"):
		input_order.append(-1)
		
	if Input.is_action_just_pressed("right"):
		input_order.append(1)
		facing_dir = "right"
	if Input.is_action_just_released("left"):
		input_order.erase(-1)
	if Input.is_action_just_released("right"):
		input_order.erase(1)
	if input_order.is_empty() == false:	
		if input_order.back() == -1:
			$Sprite2D.flip_h = true
		if  input_order.back() == 1:
			$Sprite2D.flip_h = false
		

	if velocity.y > 0:
		velocity.y += get_gravity().y * 2 * delta
	elif velocity.y <=0:
		velocity.y += get_gravity().y * delta
	
	
	
	move_and_slide()



	
	
func apply_knockback(direction:Vector2,force:int,duration:float):

	knockback = direction * force
	
	knockback_timer = duration




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		direction = Vector2(area.global_position - global_position).normalized()
		
		apply_knockback(direction,400,0.12)


func _on_area_2d_body_entered(body: Node2D) -> void:
		#if body.is_in_group("ground"):
		#	touched_ground.emit()
		pass
func spawn_star():
	for i in range(5):
		
		
		var Star = star.instantiate()
		add_child(Star)
		Star.top_level = true
		Star.velocity.y += -1000
		Star.global_position = global_position
		Star.scale = Vector2(0.5 ,0.5 )
func attack_point():
	if $Sprite2D.flip_h:
		$"attack point".position.x = -10
	else:
		$"attack point".position.x = 10
