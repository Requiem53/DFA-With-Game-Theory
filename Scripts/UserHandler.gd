extends Node2D

@export var cooperateButton: Button
@export var cheatButton: Button

@export var decisionHandler: Node2D

@onready var player2:NPCPlayer
func _ready():
	cooperateButton.pressed.connect(cooperateDecision)
	cheatButton.pressed.connect(cheatDecision)
	#print(GlobalVars.player2)
	player2 = NPCPlayer.new()
	player2.initializeStrat(GlobalVars.player2)

func cooperateDecision():
	player2.makeDecision()
	player2.enemyDecision = 0
	player2.update_dfaStatus(0)
	decisionHandler.addDecisionToGUI(0, player2.chosenDecision())
	var temp: Array = [0]
	decisionHandler.updateDFA(temp, player2.get_dfaStatus())


func cheatDecision():
	player2.makeDecision()
	player2.enemyDecision = 1
	player2.update_dfaStatus(1)
	decisionHandler.addDecisionToGUI(1, player2.chosenDecision())
	var temp: Array = [0]
	decisionHandler.updateDFA(temp, player2.get_dfaStatus())
