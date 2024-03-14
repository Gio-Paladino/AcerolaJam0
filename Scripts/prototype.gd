extends Node2D

@onready var nextleveltim : Timer = get_node("NextLevelTimer")

var count = 0 

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_campfire_next_level():
	print("end timer started")
	if count == 0:
		nextleveltim.start()
		count += 1
	pass # Replace with function body.


func _on_next_level_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/world_2.tscn")
	pass # Replace with function body.
