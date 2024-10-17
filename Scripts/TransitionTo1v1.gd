extends GridContainer

func _ready():
	for child in get_children():
		child.gui_input.connect(accessClicked.bind(child.name))

func accessClicked(event, name):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		print(name)


