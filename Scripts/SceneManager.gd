extends Node2D

var transitionButton
var backButton
var screen1v1

# Called when the node enters the scene tree for the first time.
func _ready():
	#$"1v1Screen".hide()
	#$"PickWhoToPlayWith".hide()
	print("Called")
	transitionButton = $"Swap"
	transitionButton.pressed.connect(switchTo1v1)
	
func switchTo1v1():
	#get_tree().root.add_child(screen1v1)
	#$"PickWhoToPlayWith".hide()
	get_tree().change_scene_to_file("res://Scenes/Screens//1v1Screen.tscn")



