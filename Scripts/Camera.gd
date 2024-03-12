extends Camera2D

@onready var Background : Sprite2D = get_node("Background")
@onready var BlackBackground : Sprite2D = get_node("BlackBackground")
@onready var switchTrail : GPUParticles2D = get_node("TrailParticles")
@onready var Player1 = get_node("/root/World/Player")
@onready var Player2 = get_node("/root/World/Robot")
@onready var CameraLock = Player1

var cameraYOffset = 50

func _ready():
	
	self.position.x = CameraLock.position.x
	self.position.y = CameraLock.position.y - cameraYOffset
	
	switchTrail.emitting = false
	switchTrail.position.y += cameraYOffset
	pass

func _process(delta):
#	if Input.is_action_just_pressed("interact"):
#		var tween = get_tree().create_tween()
#		tween.tween_property(BlackBackground, "modulate:a", 1 , 3).set_trans(Tween.TRANS_LINEAR)
	pass

func _physics_process(delta):
	if(abs(self.position.x - CameraLock.position.x) <= 30):
		switchTrail.emitting = false
	if(abs(self.position.x - CameraLock.position.x) <= 1  and abs(self.position.y - CameraLock.position.y) <= 1):
		self.position.x = CameraLock.position.x
		self.position.y = CameraLock.position.y - cameraYOffset
	else:
		self.position.x = move_toward(self.position.x, CameraLock.position.x, 0.1 * abs(self.position.x - CameraLock.position.x))
		self.position.y = move_toward(self.position.y, CameraLock.position.y - cameraYOffset, 0.1 * abs(self.position.y - CameraLock.position.y))
	if (Input.is_action_just_pressed("switch")):
		switchTrail.emitting = true
		switchTrail.amount = 20 * abs(self.position.x - CameraLock.position.x)
		if (CameraLock == Player1):
			CameraLock = Player2
		else:
			CameraLock = Player1
			
