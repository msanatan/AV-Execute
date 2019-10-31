extends KinematicBody2D

export (int) var health
export (int) var speed
export (float) var angle
var can_shoot: bool

func _ready():
	rotation = angle


func set_start_position(start_pos: Vector2):
	position = start_pos
