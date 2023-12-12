extends Node2D

#func _process(delta):



func _on_bottom_body_entered(body):
	if body.get_collision_layer() == 2:
		body.direction.y *= -1
#	elif body.get_collision_layer() == 1:
#		print(body.position)


func _on_top_body_entered(body):
	#if body.is_in_group('Ball'):
	if body.get_collision_layer() == 2:
		body.direction.y *= -1
#	elif body.get_collision_layer() == 1:
#		print(body.position)


func _on_right_body_entered(body):
	body.queue_free()
	var e = preload("res://ball.tscn").instantiate()
	add_child(e)
	e.global_position = Vector2(575, 325)
	Main.p1_score += 1
	$P1Label.text = str(Main.p1_score)


func _on_left_body_entered(body):
	body.queue_free()
	var e = preload("res://ball.tscn").instantiate()
	add_child(e)
	e.global_position = Vector2(575, 325)
	Main.p2_score += 1
	$P2Label.text = str(Main.p2_score)
