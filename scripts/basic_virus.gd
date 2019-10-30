extends "res://scripts/virus.gd"

var can_move: bool
var velocity: Vector2

func _ready():
	can_move = true
	rotation = direction

func _process(delta):
	if can_move:
		move_and_collide(Vector2(speed, 0).rotated(direction))
		can_move = false
		$MoveTimer.start()
	else:
		move_and_collide(Vector2())

func _on_ShootTimer_timeout():
	can_shoot = true


func _on_MoveTimer_timeout():
	can_move = true
