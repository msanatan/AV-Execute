extends Node2D

export (PackedScene) var basic_virus
export (int) var start_time
var score : int

func _ready():
	randomize()
	new_game()


func new_game():
	score = 0
	$player.set_start_position($PlayerStartPosition.position)
	$hud.update_score(score)
	$hud.update_player_health($player.health)
	$hud.update_countdown(start_time)
	$StartTimer.start()


func _on_VirusTimer_timeout():
	$VirusPath/VirusSpawnLocation.set_offset(randi())
	# TODO: work out probabilities of adding different virus types
	var virus = basic_virus.instance()
	add_child(virus)
	virus.connect("virus_died", self, "on_virus_died", [virus])
	var virus_angle = $VirusPath/VirusSpawnLocation.rotation + PI / 2
	var virus_position = $VirusPath/VirusSpawnLocation.position
	virus.set_start_position(virus_position)
	virus.rotation = virus_angle
	virus.set_target(virus.get_global_position(), $player.get_global_position())


func on_virus_died(virus):
	score += virus.points
	$hud.update_score(score)
	global.player_score = score


func _on_player_player_hit():
	$hud.update_player_health($player.health)


func _on_StartTimer_timeout():
	start_time -= 1
	if start_time == 0:
		$hud/GUI/VBoxContainer/CenterContainer/Countdown.hide()
		$VirusTimer.start()
		$StartTimer.stop()
	$hud.update_countdown(start_time)


func _on_player_player_died():
	$hud.fade_hud()
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://scenes/game_over.tscn")


func _on_player_player_moved():
	for child in get_children():
		if child.has_node("identifier"):
			var identifier = child.get_node("identifier")
			if identifier.game_id == "basic_virus":
				child.set_target(child.get_global_position(), $player.get_global_position())
