extends MarginContainer

onready var input_label = $HBoxContainer/PanelContainer2/TextEntry

func set_text(text: String = ""):	
	if text.length() < 50:
		input_label.align = HALIGN_RIGHT
	else:
		input_label.align = HALIGN_LEFT
	input_label.text = text
