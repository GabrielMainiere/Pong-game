extends Area2D

var ballVelocity : int = 500
var startPosition : Vector2 = Vector2(640, 360)
var initialDirection : Vector2 = Vector2(0,0)
var newDirection : Vector2 = Vector2(0,0) #Direction in which the ball will go.

var yMinimun : float = 0
var yMaximun : float = 720

#timer
onready var timer : Timer = $Timer

#sound
onready var soundImpactBorder : AudioStreamPlayer = $impactBorder
onready var soundImpactPlayer : AudioStreamPlayer = $ImpactPlayer


func _ready():
	initialize_timer()
	

func _process(delta):
	move_Ball(delta)
	collid_With_Wall()


func initialize_timer() -> void:
	timer.start()

func reset_Ball() -> void:
	position = startPosition
	choose_Direction_Initial()


func choose_Direction_Initial() -> void:
	#choose the directions randonly
	var xRandom = [-1, 1].pick_random()
	var yRandom = [-1, 1].pick_random()
	
	#Apply the new directions
	initialDirection = Vector2(xRandom, yRandom)
	newDirection = initialDirection
	
	
func move_Ball(delta: float) -> void:
	position = position + newDirection * ballVelocity * delta


func collid_With_Wall() -> void:
	if position.y >= yMaximun:
		newDirection.y *= -1
		
		if position.x >= 0 and position.x <= 1280:
			soundImpactBorder.play()
			
	elif position.y <= yMinimun:
		newDirection.y *= -1
		
		if position.x >= 0 and position.x <= 1280:
			soundImpactBorder.play()

func _on_Ball_body_entered(body):
	if body.is_in_group("players"):
		newDirection.x *= -1
		soundImpactPlayer.play()


func _on_Timer_timeout():
	reset_Ball()
