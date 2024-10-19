extends GridContainer

var strat_dict: Dictionary
var unselectedStyle: StyleBoxFlat = StyleBoxFlat.new()
var selectedStyle: StyleBoxFlat = StyleBoxFlat.new()

func _ready():
	for child in get_children():
		var chosenChara = child.get_child(0)
		chosenChara.gui_input.connect(accessClicked.bind(chosenChara))
	
	unselectedStyle = preload("res://Scenes/Screens/UnselectedBorder.tres")
	selectedStyle = preload("res://Scenes/Screens/SelectedBorder.tres")

func accessClicked(event, node):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		print(node.name)
		if strat_dict.get(node.name) != null:
			if strat_dict[node.name] == true:
				strat_dict[node.name] = false
			else:
				strat_dict[node.name] = true
		else:
			strat_dict[node.name] = true
		print(strat_dict)
		changeSelected(node)

func changeSelected(node: VBoxContainer):
	if strat_dict[node.name]:
		node.get_parent().add_theme_stylebox_override("panel", selectedStyle)
	else:
		node.get_parent().add_theme_stylebox_override("panel", unselectedStyle)
