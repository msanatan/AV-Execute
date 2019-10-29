extends Node2D

export (PackedScene) var virus1
var score : int

func _ready():
	randomize()
	new_game()

func new_game():
	score = 0
	$player.set_start_position($PlayerStartPosition.position)
	$VirusTimer.start()


func _on_VirusTimer_timeout():
	$VirusPath/VirusSpawnLocation.set_offset(randi())
	# TODO: work out probabilities of adding different virus types
	var virus = virus1.instance()
	add_child(virus)
	var direction = $VirusPath/VirusSpawnLocation.rotation + PI / 2
	var virus_position = $VirusPath/VirusSpawnLocation.position
	direction += rand_range(-PI / 4, PI / 4)
	virus.set_start_position(virus_position)
	virus.set_direction(direction)
