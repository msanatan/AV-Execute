extends CanvasLayer

func _ready():
	pass


func update_score(score: int):
	$ScoreLabel.text = "Score: " + str(score)
