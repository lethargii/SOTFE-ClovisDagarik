extends Node

var max_health = 3 : set = set_max_health
var health = max_health : set = set_health
signal no_health
signal health_changed
signal max_health_changed

func set_max_health(value):
	max_health = value
	emit_signal("max_health_changed", max_health)
	
func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")
	emit_signal("health_changed", health)
