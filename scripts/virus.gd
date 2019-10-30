extends KinematicBody2D

export (int) var health
export (int) var speed
var direction: float
var can_shoot: bool

func _ready():
	pass


func set_start_position(start_pos: Vector2):
	position = start_pos


func set_direction(dir: float):
	direction = dir
