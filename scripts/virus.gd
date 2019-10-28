extends RigidBody2D

export (int) var health
export (int) var min_speed
export (int) var max_speed
var direction : int

func _ready():
	pass


func set_start_position(start_pos: Vector2):
	position = start_pos


func set_direction(dir: int):
	direction = dir
