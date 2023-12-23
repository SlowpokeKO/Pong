extends Node2D

#func _process(delta):

func _ready():
	$Player.modulate = Color.BLUE
	$Player2.modulate = Color.RED


func _on_bottom_body_entered(body):
	if body.get_collision_layer() == 2:
		body.direction.y *= -1


func _on_top_body_entered(body):
	#if body.is_in_group('Ball'):
	if body.get_collision_layer() == 2:
		body.direction.y *= -1


func _on_right_body_entered(body):
	body.queue_free()
	Main.p1_score += 1
	$P1Label.text = str(Main.p1_score)
	if Main.p1_score >= Main.playTo:
		$gameoverLabel.text = "GAME OVER\nP1 WINS!"
		$gameoverLabel.visible = true
		$mainmenuButton.visible = true
		$quitButton.visible = true
	else:
		var e = preload("res://ball.tscn").instantiate()
		add_child(e)
		e.global_position = Vector2(575, 325)



func _on_left_body_entered(body):
	body.queue_free()
	Main.p2_score += 1
	$P2Label.text = str(Main.p2_score)	
	if Main.p2_score >= Main.playTo:
		$gameoverLabel.text = "GAME OVER\nP2 WINS!"
		$gameoverLabel.visible = true
		$mainmenuButton.visible = true
		$quitButton.visible = true
	else:
		var e = preload("res://ball.tscn").instantiate()
		add_child(e)
		e.global_position = Vector2(575, 325)



func _on_mainmenu_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
