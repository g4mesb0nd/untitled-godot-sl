extends CharacterBody2D

const SPEED = 200.0
const CENTER = Vector2(0, 0)
const RADIUS = 450.0

func _physics_process(_delta):
	var input = Vector2.ZERO
	if Input.is_action_pressed("move_right"): input.x += 1
	if Input.is_action_pressed("move_left"):  input.x -= 1
	if Input.is_action_pressed("move_down"):  input.y += 1
	if Input.is_action_pressed("move_up"):    input.y -= 1
	input = input.normalized()

	velocity = input * SPEED
	move_and_slide()

	var offset = global_position - CENTER
	if offset.length() > RADIUS:
		global_position = CENTER + offset.normalized() * RADIUS
		# Optional: slow down when hitting edge
		velocity = velocity.slide(offset.normalized())

	global_position = global_position.round()
