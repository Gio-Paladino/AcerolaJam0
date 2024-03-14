extends Node2D

@onready var t = get_node("Timer")
var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_campfire_next_level():
	if count == 0:
		t.start()
		count += 1
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/world_3.tscn")
	pass # Replace with function body.
