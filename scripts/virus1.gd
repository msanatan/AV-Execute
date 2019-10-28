extends "res://scripts/virus.gd"

func _ready():
	pass

func _process(delta):
	rotation = direction
	linear_velocity = Vector2(rand_range(min_speed, max_speed), 0).rotated(direction)