extends StaticBody2D

@onready var animatedSprite : AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var collisionShape : CollisionShape2D = get_node("CollisionShape2D")

@export var Terminal : Terminal

var wasOpen : bool = false
var open : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Terminal.active.connect(toggleOpen)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if open and !wasOpen:
		animatedSprite.play("Opening")
		wasOpen = open
		collisionShape.disabled = true
	elif !open and wasOpen:
		animatedSprite.play("Closing")
		wasOpen = open
		collisionShape.disabled = false
		
func toggleOpen():
	if open:
		open = false
	else:
		open = true
