extends Camera2D

@onready var Background : Sprite2D = get_node("Background")
@onready var switchTrail : GPUParticles2D = get_node("TrailParticles")
@onready var Player1 = get_node("/root/World3/Player")
@onready var Player2 = get_node("/root/World3/Robot")
@onready var CameraLock = Player1

var cameraYOffset = 50

func _ready():
	
	self.position.x = CameraLock.position.x
	self.position.y = CameraLock.position.y - cameraYOffset
	
	switchTrail.emitting = false
	switchTrail.position.y += cameraYOffset
	pass

func _process(delta):
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
		if (CameraLock == Player1):
			CameraLock = Player2
		else:
			CameraLock = Player1

