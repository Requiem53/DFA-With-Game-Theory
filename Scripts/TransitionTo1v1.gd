extends GridContainer

func _ready():
	for child in get_children():
		var chosenChara = child.get_child(0)
		chosenChara.gui_input.connect(accessClicked.bind(chosenChara))

func accessClicked(event, node):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		print(node.name)


