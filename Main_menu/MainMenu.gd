extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	$VBoxContainer/StartButton.connect("pressed",self,"start_button")
	$VBoxContainer/LoadButton.connect("pressed",self,"load_button")
	$VBoxContainer/OptionButton.connect("pressed",self,"option_button")
	$VBoxContainer/QuitButton.connect("pressed",self,"quit_button")

func start_button():
	var root = get_tree().root
	var main_menu = root.get_node("MainMenu")
	root.remove_child(main_menu)
	var level = load("res://Levels/Level314/Level314.tscn").instance()
	root.add_child(level)
	var player = load("res://Characters/Player/Player.tscn").instance()
	level.layer_1.playerground.add_child(player)
	
func load_button():
	pass
	
func option_button():
	pass
	
func quit_button():
	get_tree().quit()
