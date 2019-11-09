extends CanvasLayer

onready var ScoreLabel = $GUI/VBoxContainer/TopHUD/ScoreLabel
onready var HPLabel = $GUI/VBoxContainer/TopHUD/HealthBars/HealthLabel
onready var HPGauge = $GUI/VBoxContainer/TopHUD/HealthBars/Gauge
onready var Countdown = $GUI/VBoxContainer/CenterContainer/Countdown
onready var tween = $Tween
export (int) var player_max_health
var animated_health : float = 0

func _ready():
	HPGauge.max_value = player_max_health
	animated_health = player_max_health


func _process(delta):
	var rounded_health : int = round(animated_health)
	HPLabel.text = "HP:      " + str(rounded_health)
	HPGauge.value = rounded_health


func update_player_health(health: int):
	tween.interpolate_property(self, "animated_health", animated_health,
		health, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()
	print("health ", health)
	print("animated_health ", animated_health)


func update_score(score: int):
	ScoreLabel.text = "Score: " + str(score)
	

func update_countdown(seconds: int):
	Countdown.text = str(seconds)
