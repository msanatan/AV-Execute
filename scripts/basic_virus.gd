extends "res://scripts/virus.gd"

export (PackedScene) var basic_virus_laser
var can_move: bool
var velocity: Vector2

func _ready():
	can_move = true


func _process(delta):
	var move_vector = Vector2()
	if can_move:
		move_vector = Vector2(speed, 0).rotated(angle)
		can_move = false
		$MoveTimer.start()

	position += move_vector

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


func _on_virus_area_entered(area):
	if area.get("node_type"):
		if area.node_type == "player_laser":
			health -= area.damage
			area.queue_free()
			if health <= 0:
				emit_signal("virus_died")
				queue_free()
