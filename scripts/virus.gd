extends Area2D

signal virus_died

export (int) var health
export (int) var speed
export (int) var damage
export (int) var points
var angle: float
var can_shoot: bool

func _ready():
	rotation = angle


func set_start_position(start_pos: Vector2):
	position = start_pos
