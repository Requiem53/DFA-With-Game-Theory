extends Node
class_name NPCPlayer

var stratName: String
#For decisions:
#0 - Cooperate
#1 - Cheatar decisionToken: int
var decisionToken: int
var decisionTable: Array
var decisionDecider: Array
var enemyDecision: int
var currentState: int

var start: bool

var dfaStatus: Array
#Index 0: Current State
#Index 1: Enemy Decision

func readyVars():
	start = true
	dfaStatus = [0,0]
	decisionDecider = [0,1]
	currentState = 0

func initializeStrat(strat: String):
	readyVars()
	stratName = strat
	if stratName == "Copycat":
		CopycatDecision()
	elif stratName == "AlwaysCooperates":
		AlwaysCooperateDecision()
	elif stratName == "AlwaysCheats":
		AlwaysCheatDecision()
	elif stratName == "Grudger":
		GrudgerDecision()
	elif stratName == "Detective":
		DetectiveDecision()
	elif stratName == "Copykitten":
		CopykittenDecision()
	elif stratName == "Simpleton":
		SimpletonDecision()
	dfaStatus.append(stratName)

func cooperate():
	decisionToken = 0

func cheat():
	decisionToken = 1

func chosenDecision():
	return decisionToken

func makeDecision():
	#start condition
	if !start:
		currentState = decisionTable[currentState][enemyDecision]
	start = false
	if decisionDecider[currentState] == 0:
		cooperate()
	else:
		cheat()

func CopycatDecision():
	decisionTable = [[0,1],[0,1]]

func AlwaysCooperateDecision(): 
	decisionTable = [[0,0],[1,1]]

func AlwaysCheatDecision():
	decisionDecider = [1,0]
	decisionTable = [[0,0],[1,1]]

func GrudgerDecision():
	decisionTable = [[0,1],[1,1]]

func DetectiveDecision():
	decisionDecider = [0,1,0,0,1,0,1,0,0,1]
	decisionTable = [[6,1],[2,2],[3,3],[5,4],[5,4],[5,4],[7,2],[8,3],[9,4],[9,9]]

func CopykittenDecision():
	decisionDecider = [0,0,1]
	decisionTable = [[0,1],[0,2],[0,2]]

func SimpletonDecision():
	decisionTable = [[0,1],[1,0]]

func update_dfaStatus(enemyDecision):
	dfaStatus[0] = currentState
	dfaStatus[1] = enemyDecision
	print(stratName+": ",dfaStatus)

func get_dfaStatus():
	return dfaStatus
