extends AnimatedSprite2D

@onready var Tim : Timer = get_node("Timer")
@onready var Tim2 : Timer = get_node("Timer2")
# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_camera_timer_timeout():
	Tim.start()
	pass # Replace with function body.


func _on_timer_timeout():
	play("Idle")
	Tim2.start()
	pass # Replace with function body.


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	pass # Replace with function body.
