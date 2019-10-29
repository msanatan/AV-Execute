extends Area2D

export (Vector2) var velocity
export (int) var angle
export (int) var speed

func _ready():
	pass


func _process(delta):
	position += velocity * speed * delta


func set_start_position(start_position : Vector2):
	position = start_position


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
