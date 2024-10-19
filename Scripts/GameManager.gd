extends Node2D

@export var player1Name: String
@export var player2Name: String

@export var player1LeaderboardLabel: Label
@export var player2LeaderboardLabel: Label

@export var player1ScoreLabel: Label
@export var player2ScoreLabel: Label

@export var player1GameName: Label
@export var player2GameName: Label

@export var player1Sprite: TextureRect
@export var player2Sprite: TextureRect

@export var player1DFA: TextureRect
@export var player2DFA: TextureRect

@export var userControls: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	player1Name = GlobalVars.player1
	player2Name = GlobalVars.player2
	
	player1LeaderboardLabel.set_text(player1Name)
	player2LeaderboardLabel.set_text(player2Name)
	
	player1ScoreLabel.set_text("0")
	player2ScoreLabel.set_text("0")
	
	player1GameName.set_text(player1Name)
	player2GameName.set_text(player2Name)
	
	var p1Texture = "res://Assets//Characters//" + player1Name + ".png"
	var p2Texture = "res://Assets//Characters//" + player2Name + ".png"
	
	player1Sprite.set_texture(load(p1Texture))
	player2Sprite.set_texture(load(p2Texture))
	
	var p1InitDFA = "res://Assets//DFA_GameTheory//" + player1Name \
	+ "//" + player1Name + "_Initial.png"
	var p2InitDFA = "res://Assets//DFA_GameTheory//" + player2Name \
	+ "//" + player2Name + "_Initial.png"
	player1DFA.set_texture(load(p1InitDFA))
	player2DFA.set_texture(load(p2InitDFA))
	
	if !GlobalVars.hasUser:
		userControls.hide()
