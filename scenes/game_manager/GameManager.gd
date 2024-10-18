extends Node2D

#ball
onready var ball : Area2D = $"../Ball"

#scores
var score_player1 : int = 0
var score_player2 : int = 0

#texts
onready var text1 : Label = $"../UI/ScorePanel/TextScorePlayer1"
onready var text2 : Label = $"../UI/ScorePanel/TextScorePlayer2"

#sound
onready var soundImpactGoal : AudioStreamPlayer = $impactGoal


func _process(delta):
	receive_imputs()


func _on_Goal1_area_entered(area):
	soundImpactGoal.play()
	score_player2 += 1
	text2.text = str(score_player2)
	ball.initialize_timer()

func _on_Goal2_area_entered(area):
	soundImpactGoal.play()
	score_player1 += 1
	text1.text = str(score_player1)
	ball.initialize_timer()
	
	
func receive_imputs() ->void:
	if Input.is_action_just_pressed("Restart_game"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("Close_game"):
		get_tree().quit()
		
#Difference between is_action_just_pressed and is_action_pressed.
#is_action_just_pressed = keycap pressed only one time.
#is_action_pressed = wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww sssssssssssss.
