extends StaticBody2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("hui")
		body.velocity.y = -1500
		print(body.velocity)
