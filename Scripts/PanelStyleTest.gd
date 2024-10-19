extends PanelContainer

func _ready():
	var unselectedStyle: StyleBoxFlat = StyleBoxFlat.new()
	unselectedStyle = preload("res://Scenes/Screens/SelectedBorder.tres")
	#self.add_theme_stylebox_override("panel", unselectedStyle)


