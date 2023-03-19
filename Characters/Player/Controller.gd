extends Node

@onready var player = get_parent()
@onready var stats = player.get_node("Stats")
@onready var cam = player.get_node("Cam")
@onready var animated_sprite = player.get_node("AnimatedSprite2D")

var speed = 80
var jump_speed = 480
var roll_speed = 20
var acceleration = 500
var input_vector = Vector2.ZERO
var weapons = ["Sword", "Spear", "Bow"]
var weapon = weapons[0]

func _ready():
	animated_sprite.connect("animation_finished",Callable(self,"animation_finished"))

func _physics_process(delta):
	match player.state:
		"Roll":
			roll(delta)
		"Jump":
			jump(delta)
		"Sword":
			sword(delta)
		"Spear":
			spear(delta)
		"Bow":
			bow(delta)
		"Death":
			death()
		_:
			move(delta)
			
func animation_finished():
	match player.state:
		"Roll":
			roll_finished()
		"Jump":
			jump_finished()
		"Sword":
			sword_finished()
		"Spear":
			spear_finished()
		"Bow":
			bow_finished()
		"Death":
			death_finished()

func move(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if input_vector == Vector2.ZERO:
		player.state = "Idle"
	else:
		player.state = "Run"
	player.move(input_vector, speed, acceleration, delta)
	if Input.is_action_just_pressed("roll"):
		if input_vector != Vector2.ZERO:
			player.state = "Jump"
	if Input.is_action_just_pressed("attack"):
		player.state = weapon
	if Input.is_action_just_pressed("change_weapon"):
		weapon = weapons[(weapons.find(weapon) + 1) % weapons.size()]
	
func roll(delta):
	player.move(input_vector, roll_speed, acceleration, delta)
	
func roll_finished():
	player.state = "Idle"
	
func jump(delta):
	player.move(input_vector, jump_speed, acceleration, delta)
	
func jump_finished():
	player.state = "Roll"
	
func sword(delta):
	player.move(Vector2.ZERO, speed, acceleration, delta)
	
func sword_finished():
	player.state = "Idle"

func spear(delta):
	player.move(Vector2.ZERO, speed, acceleration, delta)
	
func spear_finished():
	player.state = "Idle"
	
func bow(delta):
	player.move(Vector2.ZERO, speed, acceleration, delta)
	
func bow_finished():
	player.state = "Idle"

func death():
	pass

func death_finished():
	pass
