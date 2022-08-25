extends MarginContainer

onready var time_label = $TextEntry

func set_text(text: String = ""):	
	time_label.text = text
