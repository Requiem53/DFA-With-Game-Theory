extends Node2D

@export var stepButton:Button

@onready var player1:NPCPlayer
@onready var player2:NPCPlayer

@export var decisionHandler: Node2D

func _ready():
	stepButton.pressed.connect(handleStep)
	
	player1 = NPCPlayer.new()
	player2 = NPCPlayer.new()
	#Assign NPCPlayer to they 
	player1.initializeStrat(GlobalVars.player1)
	player2.initializeStrat(GlobalVars.player2)

func handleStep():
	#Both players make decision
	decisionStep()
	decisionHandler.addDecisionToGUI(player1.chosenDecision(), player2.chosenDecision())

func decisionStep():
	player1.enemyDecision = player2.chosenDecision()
	player2.enemyDecision = player1.chosenDecision()
	
	player1.makeDecision()
	player2.makeDecision()
