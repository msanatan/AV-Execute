extends Area2D

export (int) var SPEED = 300
export (int) var health = 100
var angle : int = 0

func _ready():
	pass


func _process(delta):
	var velocity = Vector2()
	var up : bool = false
	var down : bool = false
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		angle = 0
		up = true
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		angle = 180
		down = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		if up:
			angle -= 45
		elif down:
			angle += 45
		else:
			angle = -90
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		if up:
			angle += 45
		elif down:
			angle -= 45
		else:
			angle = 90
	
	velocity = velocity.normalized()
	rotation_degrees = angle
	position += velocity * SPEED * delta


func set_start_position(start_position : Vector2):
	position = start_position

