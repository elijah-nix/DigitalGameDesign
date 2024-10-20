extends Node2D

var currentCardAmt
var maxCardAmt
var isPlayerTurn
var startOfEnemyTurnTimer
var endOfEnemyTurnTimer
var turnSequenceLabel
var timerWaitTime
var debugLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxCardAmt = 5
	currentCardAmt = 0
	isPlayerTurn = true
	startOfEnemyTurnTimer = get_node("StartOfEnemyTurnTimer")
	endOfEnemyTurnTimer = get_node("EndOfEnemyTurnTimer")
	turnSequenceLabel = get_node("TurnSequenceLabel")
	timerWaitTime = 2.5
	debugLabel = get_node("DebugLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	debugLabel.text = "Start of enemy timer: " + str(startOfEnemyTurnTimer.time_left) + "End timer: " + str(endOfEnemyTurnTimer.time_left)
	
func pickUpCard() -> void:
	if(currentCardAmt < 5):
		currentCardAmt+=1
	else:
		print("Already have max cards!")
		
func getCurrentCardAmt() -> int:
	return currentCardAmt
	
func isEnemyTurn() -> void:
	isPlayerTurn = false
	turnSequenceLabel.text = "Their Turn"
	startOfEnemyTurnTimer.wait_time = timerWaitTime
	startOfEnemyTurnTimer.start()

func _on_start_of_enemy_turn_timer_timeout() -> void:
	enemyGroupAction()
	endOfEnemyTurnTimer.wait_time = timerWaitTime
	endOfEnemyTurnTimer.start()
	
func _on_end_of_enemy_turn_timer_timeout() -> void:
	turnSequenceLabel.text = "Go On"
	isPlayerTurn = true
	endOfEnemyTurnTimer.stop()
	
func enemyGroupAction() -> void:
	#include timers for each enemy event
	pass
