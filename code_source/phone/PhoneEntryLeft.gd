extends MarginContainer

onready var input_label = $HBoxContainer/PanelContainer2/TextEntry

func set_text(text: String = ""):	
	input_label.text = text
