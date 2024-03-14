extends Node2D

@onready var FadeOut : Sprite2D = get_node("FadeOut")
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(FadeOut, "modulate:a", 0, 1).set_trans(Tween.TRANS_LINEAR)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
