extends CanvasLayer

onready var ScoreLabel = $GUI/VBoxContainer/TopHUD/ScoreLabel
onready var HPLabel = $GUI/VBoxContainer/TopHUD/HealthBars/HealthLabel
onready var HPGauge = $GUI/VBoxContainer/TopHUD/HealthBars/Gauge
onready var Countdown = $GUI/VBoxContainer/CenterContainer/Countdown

func _ready():
	pass


func update_player_health(health: int):
	HPLabel.text = "HP:   " + str(health)
	HPGauge.value = health


func update_score(score: int):
	ScoreLabel.text = "Score:" + str(score)
	

func update_countdown(seconds: int):
	Countdown.text = str(seconds)
