extends CanvasLayer

@onready var health_bar = $HealthBar/HealthBar
@onready var controller = get_parent().get_node("Controller")

func _ready():
	controller.stats.connect("health_changed",Callable(self,"health_changed"))
	controller.stats.connect("max_health_changed",Callable(self,"max_health_changed"))

func health_changed(health):
	health_bar.value = health
	
func max_health_changed(max_health):
	health_bar.size.x = max_health * 16
