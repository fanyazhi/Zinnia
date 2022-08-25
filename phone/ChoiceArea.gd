extends PanelContainer


const CHOICE_ENTRY = preload("res://phone/ChoiceEntry.tscn")

onready var choice_rows = $MarginContainer/HBoxContainer

signal game_on_choice_selected(choice_text)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


##### PUBLIC #####
func create_entry(text: String, short_text := ""):
	var entry = CHOICE_ENTRY.instance()
	# tip: add the input response instance to game before setting text, 
	# otherwise can't call queue_free() on the input lebel in response.set_text()
	_add_entry_to_game(entry)
	entry.text = text
	if short_text.length() != 0:
		entry.set_button_text(short_text + "(...)")
	else:
		entry.set_button_text(text)
	
func clear_all():
	for child in choice_rows.get_children():
		child.queue_free()

##### Signal Listeners #####
# notify game when a choice entry has been selected by a player
func on_choice_selected(choice_text: String) -> void:
	emit_signal("game_on_choice_selected", choice_text)


##### PRIVATE #####
func _add_entry_to_game(response: Control):
	choice_rows.add_child(response)
	response.connect("choice_selected", self, "on_choice_selected" )
	

	
