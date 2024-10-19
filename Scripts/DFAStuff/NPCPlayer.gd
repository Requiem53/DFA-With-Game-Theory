extends Node
class_name NPCPlayer

var stratName: String
var decision: String
var decisionToken: int
var decisionTable: Array
var decisionDecider: Array
var enemyDecision: int
var currentState: int
var start: bool
#remove later
var decisionHistory: Array

#For decisions:
#0 - Cooperate
#1 - Cheat
func readyVars():
	start = true
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
		decisionDecider = [1,0]
		AlwaysCheatDecision()
	elif stratName == "Grudger":
		GrudgerDecision()
	elif stratName == "Detective":
		decisionDecider = [0,1,0,0,1,0,1,0,0,1]
		DetectiveDecision()
	elif stratName == "Copykitten":
		decisionDecider = [0,0,1]
		CopykittenDecision()
	elif stratName == "Simpleton":
		SimpletonDecision()

func cooperate():
	decisionToken = 0
	decisionHistory.append(decision)

func cheat():
	decision = "Cheat"
	decisionToken = 1
	decisionHistory.append(decision)

func chosenDecision():
	return decisionToken

func makeDecision():
	if !start:
		currentState = decisionTable[currentState][enemyDecision]
	if decisionDecider[currentState] == 0:
		cooperate()
	else:
		cheat()
	print(stratName+": ",decisionHistory)

func CopycatDecision():
	decisionTable = [[0,1],[0,1]]

func AlwaysCooperateDecision(): 
	decisionTable = [[0,0],[1,1]]

func AlwaysCheatDecision():
	decisionTable = [[0,0],[1,1]]

func GrudgerDecision():
	decisionTable = [[0,1],[1,1]]

func DetectiveDecision():
	decisionTable = [[6,1],[2,2],[3,3],[5,4],[5,4],[5,4],[7,2],[8,3],[9,4],[9,9]]

func CopykittenDecision():
	decisionTable = [[0,1],[0,2],[0,2]]

func SimpletonDecision():
	decisionTable = [[0,1],[1,0]]
