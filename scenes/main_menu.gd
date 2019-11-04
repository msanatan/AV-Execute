extends MarginContainer

var scene_path_to_load : String
onready var MenuButtons = $CenterContainer/VBoxContainer/MenuButtons

func _ready():
	MenuButtons.get_child(0).grab_focus()
	for button in MenuButtons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button])


func _on_Button_pressed(button):
	scene_path_to_load = button.scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
