extends MarginContainer

onready var input_label = $HBoxContainer/PanelContainer2/TextEntry

func set_text(text: String = ""):	
	if text.length() < 40:
		input_label.align = HALIGN_RIGHT
	input_label.text = text
