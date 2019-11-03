extends Area2D

export (Vector2) var velocity
export (int) var speed
export (int) var damage
export (String) var node_type

func _ready():
	pass


func _process(delta):
	position += velocity * speed * delta


func set_start_position(start_position: Vector2):
	position = start_position


func set_rotation(angle: float):
	rotation = angle


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
