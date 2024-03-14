extends Control

@onready var FadeOut : Sprite2D = get_node("FadeOut")
@onready var Timer1 : Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(FadeOut, "modulate:a", 255, 2).set_trans(Tween.TRANS_LINEAR)
	Timer1.start()
	pass # Replace with function body.



func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/opening_cutscene.tscn")
	pass # Replace with function body.
