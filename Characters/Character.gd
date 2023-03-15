extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO
var facing = "Down"
var state = "Idle"
	
func move(vector, speed, acceleration, delta):
	vector = vector.normalized()
	if vector != Vector2.ZERO:
		var angle = 180 - round(rad2deg(vector.angle()))
		if (angle >= 0 and angle < 45) or (angle > 315 and angle < 360):
			facing = "Left"
		elif angle >= 45 and angle <= 135:
			facing = "Down"
		elif angle >= 225 and angle <= 315:
			facing = "Up"
		elif angle > 135 and angle < 225:
			facing = "Right"
	animated_sprite.play(state + facing)
	velocity = velocity.move_toward(vector * speed, delta * acceleration)
	velocity = move_and_slide(velocity)
