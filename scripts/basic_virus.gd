extends "res://scripts/virus.gd"

export (PackedScene) var basic_virus_laser
var can_move: bool
var velocity: Vector2

func _ready():
	can_move = true

func _process(delta):
	if can_move:
		move_and_collide(Vector2(speed, 0).rotated(angle))
		can_move = false
		$MoveTimer.start()
	else:
		move_and_collide(Vector2())
	
	if can_shoot:
		shoot()

func _on_ShootTimer_timeout():
	can_shoot = true


func _on_MoveTimer_timeout():
	can_move = true


func shoot():
	var rotation_offset: float = 0
	for i in range(4):
		var laser = basic_virus_laser.instance()
		laser.set_start_position(position)
		var laser_angle = rotation + rotation_offset
		laser.velocity = Vector2(0, 1).rotated(laser_angle)
		laser.set_rotation(laser_angle)
		get_tree().get_root().add_child(laser)
		rotation_offset += PI / 2
	can_shoot = false
	$ShootTimer.start()