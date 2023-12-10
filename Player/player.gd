extends CharacterBody2D


const SPEED = 300.0
@export var side = 'p1'

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


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

	move_and_slide()

func get_input(up, down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1
	


func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	Main.side = side
