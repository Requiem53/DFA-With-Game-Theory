extends GridContainer

var unselectedStyle: StyleBoxFlat = StyleBoxFlat.new()
var selectedStyle: StyleBoxFlat = StyleBoxFlat.new()

var selected: Array
@export var transitionButton: Button

func _ready():
	for child in get_children():
		var chosenChara = child.get_child(0)
		chosenChara.gui_input.connect(accessClicked.bind(chosenChara))
	
	unselectedStyle = preload("res://Scenes/Screens/UnselectedBorder.tres")
	selectedStyle = preload("res://Scenes/Screens/SelectedBorder.tres")
	
	transitionButton.pressed.connect(assignPlayers)

func accessClicked(event, node):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		print(node.name)
		changeSelected(node)
		print(selected)

func changeSelected(node: VBoxContainer):
	if selected.size() < 2 and !selected.has(node.name):
		node.get_parent().add_theme_stylebox_override("panel", selectedStyle)
		selected.append(node.name)
	elif selected.has(node.name):
		node.get_parent().add_theme_stylebox_override("panel", unselectedStyle)
		selected.remove_at(selected.find(node.name))
		
func assignPlayers():
	print(selected)
	GlobalVars.player1 = "None"
	GlobalVars.player2 = "None"
	if selected.size() == 1:
		GlobalVars.player1 = "You"
		GlobalVars.player2 = selected[0]
		GlobalVars.hasUser = true
	if selected.size() > 1:
		GlobalVars.player1 = selected[0]
		GlobalVars.player2 = selected[1]
		GlobalVars.hasUser = false
	selected.clear()
