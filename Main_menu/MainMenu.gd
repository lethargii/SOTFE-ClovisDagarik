extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	$VBoxContainer/StartButton.connect("pressed",Callable(self,"start_button"))
	$VBoxContainer/LoadButton.connect("pressed",Callable(self,"load_button"))
	$VBoxContainer/OptionButton.connect("pressed",Callable(self,"option_button"))
	$VBoxContainer/QuitButton.connect("pressed",Callable(self,"quit_button"))

func start_button():
	var root = get_tree().root
	var main_menu = root.get_node("MainMenu")
	root.remove_child(main_menu)
	var level = load("res://Levels/Level314/Level314.tscn").instantiate()
	root.add_child(level)
	var player = load("res://Characters/Player/Player.tscn").instantiate()
	level.layer_1.playerground.add_child(player)
	
func load_button():
	pass
	
func option_button():
	pass
	
func quit_button():
	get_tree().quit()
