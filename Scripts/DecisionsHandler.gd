extends Node2D

@export var p1ActionsContainer: HBoxContainer
@export var p2ActionsContainer: HBoxContainer
@export var actionsContainer: HBoxContainer

@export var p1ScoreLabel: Label
@export var p2ScoreLabel: Label

@export var decisionNode: CenterContainer
@export var scrollContainer: ScrollContainer

var p1Score: int
var p2Score: int

func _ready():
	scrollContainer.get_h_scroll_bar().changed.connect(scrollbar_change)
	p1Score=0
	p2Score=0

func addDecisionToGUI(decision1: int, decision2: int):
	var new1 = decisionNode.duplicate()
	var new2 = decisionNode.duplicate()
	if decision1 == 0:
		new1.get_child(0).set_text("Cooperate")
	elif decision1 == 1:
		new1.get_child(0).set_text("Cheat")
	new1.show()
	p1ActionsContainer.add_child(new1)
	
	if decision2 == 0:
		new2.get_child(0).set_text("Cooperate")
	elif decision2 == 1:
		new2.get_child(0).set_text("Cheat")
	new2.show()
	p2ActionsContainer.add_child(new2)
	
	siga_siga(decision1, decision2)

@export var CoopCoop: Label
@export var CoopCheat: Label
@export var CheatCoop: Label
@export var CheatCheat: Label

func siga_siga(decision1: int, decision2: int):
	var new3 = decisionNode.duplicate()
	CoopCoop.set("theme_override_colors/font_color", Color("black"))
	CoopCheat.set("theme_override_colors/font_color", Color("black"))
	CheatCoop.set("theme_override_colors/font_color", Color("black"))
	CheatCheat.set("theme_override_colors/font_color", Color("black"))
	
	if decision1 == 0 and decision2 == 0:
		CoopCoop.set("theme_override_colors/font_color", Color("purple"))
		new3.get_child(0).set_text("+2/+2")
		p1Score+=2
		p2Score+=2
	elif decision1 == 0 and decision2 == 1:
		CoopCheat.set("theme_override_colors/font_color", Color("purple"))
		new3.get_child(0).set_text("-1/+3")
		p1Score-=1
		p2Score+=3
	elif decision1 == 1 and decision2 == 0:
		CheatCoop.set("theme_override_colors/font_color", Color("purple"))
		new3.get_child(0).set_text("+3/-1")
		p2Score-=1
		p1Score+=3
	elif decision1 == 1 and decision2 == 1:
		CheatCheat.set("theme_override_colors/font_color", Color("purple"))
		new3.get_child(0).set_text("0/0")
	p1ScoreLabel.set_text(str(p1Score))
	p2ScoreLabel.set_text(str(p2Score))
	new3.show()
	actionsContainer.add_child(new3)

func updateDFA(p1DFAStatus: Array, p2DFAStatus: Array):
	
	pass

func scrollbar_change():
	scrollContainer.set_h_scroll(scrollContainer.get_h_scroll_bar().max_value)
