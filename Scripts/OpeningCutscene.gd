extends Node2D

@onready var Fire : AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var FadeOut : Sprite2D = get_node("FadeOut")
@onready var FireTimer : Timer = get_node("EndFiretimer")
@onready var SwitchSceneTimer : Timer = get_node("SwitchSceneTimer")
# Called when the node enters the scene tree for the first time.
func _ready():
	Fire.play("default")
	var tween = get_tree().create_tween()
	tween.tween_property(Fire, "modulate:a", 255, 3).set_trans(Tween.TRANS_LINEAR)
	FireTimer.timeout.connect(end)
	FireTimer.start()
	SwitchSceneTimer.timeout.connect(end_scene)
	SwitchSceneTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func end():
	var tween = get_tree().create_tween()
	tween.tween_property(FadeOut, "modulate:a", 255, 2).set_trans(Tween.TRANS_LINEAR)

func end_scene():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
