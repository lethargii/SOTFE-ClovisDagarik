extends Node2D

@onready var layer_1 = $Layer1
@onready var layer_2 = $Layer2
@onready var layer_3 = $Layer3
@onready var level_script = $Script
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		var pause_menu = load("res://UI/PauseMenu.tscn").instantiate()
		get_parent().add_child(pause_menu)
