extends Node2D

var transitionButton
var screen1v1

# Called when the node enters the scene tree for the first time.
func _ready():
	#$"1v1Screen".hide()
	#$"PickWhoToPlayWith".hide()
	transitionButton = $"PickWhoToPlayWith/Swap"
	transitionButton.pressed.connect(switchTo1v1)

func switchTo1v1():
	screen1v1 = preload("res://Scenes/Screens/1v1Screen.tscn").instantiate()
	get_tree().root.add_child(screen1v1)
	$"PickWhoToPlayWith".hide()




