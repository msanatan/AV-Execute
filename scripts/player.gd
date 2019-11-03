extends Area2D

signal player_hit
signal player_died

export (PackedScene) var player_laser
export (int) var speed = 300
export (int) var health = 100
export (int) var max_health = 100
var angle: float = 0
var direction: Vector2 = Vector2(0, -1)
var can_shoot: bool = true

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
		angle = PI
		down = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		if up:
			angle -= PI / 4
		elif down:
			angle += PI / 4
		else:
			angle = -(PI / 2)
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		if up:
			angle += PI / 4
		elif down:
			angle -= PI / 4
		else:
			angle = PI / 2
	
	if velocity.length() != 0:
		direction = velocity
	velocity = velocity.normalized()
	
	rotation = angle
	position += velocity * speed * delta
	
	if Input.is_action_pressed("ui_accept") and can_shoot:
		var laser = player_laser.instance()
		laser.set_start_position($CanonPosition.global_position)
		laser.velocity = direction
		laser.set_rotation(angle)
		get_tree().get_root().add_child(laser)
		can_shoot = false
		$ShootTimer.start()


func set_start_position(start_position : Vector2):
	position = start_position


func _on_ShootTimer_timeout():
	can_shoot = true


func _on_player_body_entered(body):
	emit_signal("player_hit")
	body.queue_free()
	if body.damage:
		health -= body.damage


func _on_player_area_entered(area):
	emit_signal("player_hit")
	area.queue_free()
	if area.damage:
		health -= area.damage


func _on_player_player_hit():
	if health <= 0:
		emit_signal("player_died")
