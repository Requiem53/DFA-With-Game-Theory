extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(switchScene)
func switchScene():
	#var menu = preload("res://Scenes/Screens//PickWhoToPlayWith.tscn").instantiate()
	get_tree().change_scene_to_file("res://Scenes/Screens//PickWhoToPlayWith.tscn")
	#var masterScene = self.get_parent()
	#masterScene.get_child()
