extends CanvasLayer

func _ready():
	get_tree().paused = true
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = false
		queue_free()
