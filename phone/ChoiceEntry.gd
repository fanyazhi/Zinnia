extends PanelContainer


onready var input_button = $MarginContainer/Button
onready var text = "Error - invalid"

signal choice_selected(choice_text)

func set_button_text(text: String = ""):	
	input_button.text = text


func _on_Button_pressed() -> void:
	emit_signal("choice_selected", text)
