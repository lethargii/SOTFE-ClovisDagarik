extends Control

func _ready():
	var game = get_parent()
	$VBoxContainer/StartButton.grab_focus()
	$VBoxContainer/StartButton.connect("pressed",Callable(self,"start_button"))
	$VBoxContainer/LoadButton.connect("pressed",Callable(self,"load_button"))
	$VBoxContainer/OptionButton.connect("pressed",Callable(self,"option_button"))
	$VBoxContainer/QuitButton.connect("pressed",Callable(self,"quit_button"))

func start_button():
	game.ChangeLevel("res://Characters/Player/Player.tscn")
	queue_free()
	
func load_button():
	pass
	
func option_button():
	pass
	
func quit_button():
	get_tree().quit()
