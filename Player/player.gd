extends CharacterBody2D


const SPEED = 300.0
@export var side = 'p1'


func _physics_process(delta):
	var direction
	if side == 'p1':
		direction = get_input(KEY_W, KEY_S)
	else:
		direction = get_input(KEY_UP, KEY_DOWN)
	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	position.y = clamp(position.y, 90, 560)

	move_and_slide()

func get_input(up, down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1
	


func _on_area_2d_body_entered(body):
	if body.get_collision_layer() == 2:
		body.direction.x *= -1
		Main.side = side
		if side == 'p1':
			body.modulate = Color.BLUE
		elif side == 'p2':
			body.modulate = Color.RED
	


#func _on_area_2d_2_body_entered(body):
#	body.direction.y *= -1
#	Main.side = side
