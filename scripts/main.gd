extends Node2D

export (PackedScene) var basic_virus
var score : int

func _ready():
	randomize()
	new_game()


func new_game():
	score = 0
	$player.set_start_position($PlayerStartPosition.position)
	$VirusTimer.start()
	$hud.update_score(score)
	$hud.update_player_health($player.health)


func _on_VirusTimer_timeout():
	$VirusPath/VirusSpawnLocation.set_offset(randi())
	# TODO: work out probabilities of adding different virus types
	var virus = basic_virus.instance()
	add_child(virus)
	virus.connect("virus_died", self, "on_virus_died", [virus])
	var virus_angle = $VirusPath/VirusSpawnLocation.rotation + PI / 2
	var virus_position = $VirusPath/VirusSpawnLocation.position
	virus.set_start_position(virus_position)
	virus.angle = virus_angle


func on_virus_died(virus):
	score += virus.points
	$hud.update_score(score)


func _on_player_player_hit():
	$hud.update_player_health($player.health)
