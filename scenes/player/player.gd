extends StaticBody2D

export var player1: bool 
var playerVelocity: int = 500


func _process(delta):
	move_Player(delta)
	limit_Move_Player()


func move_Player(delta : float) ->void:
	
	#Move of player one.
	if player1 == true:
		if Input.is_action_pressed("Mov_player1_to_up"):
			position.y -= playerVelocity * delta
		elif Input.is_action_pressed("Mov_player1_to_down"):
			position.y += playerVelocity * delta
			
	#Move of player two.
	else: 
		if Input.is_action_pressed("Mov_player2_to_up"):
			position.y -= playerVelocity * delta
		elif Input.is_action_pressed("Mov_player2_to_down"):
			position.y += playerVelocity * delta

	
func limit_Move_Player() ->void:
	#prevents the player from going over the limit.
	position.y = clamp(position.y, 65, 655)
