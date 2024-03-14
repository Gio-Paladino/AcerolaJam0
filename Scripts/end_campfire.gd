extends Area2D

@onready var animatedSprite : AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var black : Sprite2D = get_node("Sprite2D")

var bodyCount = 0

signal nextLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite.play("On")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if bodyCount == 2:
		print("next level Signal emitted")
		nextLevel.emit()
		var tween = get_tree().create_tween()
		tween.tween_property(black, "modulate:a", 255, 2).set_trans(Tween.TRANS_LINEAR)
	pass

func _on_body_entered(body):
	bodyCount += 1
	print("enter bodycount= " + str(bodyCount))
	pass # Replace with function body.


func _on_body_exited(body):
	bodyCount -= 1
	print("exit bodycount= " + str(bodyCount))
	pass # Replace with function body.

