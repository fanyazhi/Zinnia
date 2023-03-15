extends PanelContainer


const PHONE_ENTRY_LEFT = preload("res://code_source/phone/PhoneEntryLeft.tscn")
const PHONE_ENTRY_RIGHT = preload("res://code_source/phone/PhoneEntryRight.tscn")
const TIME_STAMP = preload("res://code_source/phone/TimeStamp.tscn")


export (int) var max_lines_remembered := 30
var max_scroll_length = 0

onready var scroll = $ScrollContainer
onready var scrollbar = scroll.get_v_scrollbar()

onready var history_rows = $ScrollContainer/VBoxContainer_History

func _ready() -> void:
	scrollbar.connect("changed", self, "_handle_scrollbar_changed")
	max_scroll_length = scrollbar.max_value


##### PUBLIC #####
func create_left_entry(text: String):
	var entry = PHONE_ENTRY_LEFT.instance()
	# tip: add the input response instance to game before setting text, 
	# otherwise can't call queue_free() on the input lebel in response.set_text()
	_add_response_to_game(entry)
	entry.set_text(text)
	
func create_right_entry(text: String):
	var entry = PHONE_ENTRY_RIGHT.instance()
	# tip: add the input response instance to game before setting text, 
	# otherwise can't call queue_free() on the input lebel in response.set_text()
	_add_response_to_game(entry)
	entry.set_text(text)
	
	
func create_time_stamp(text: String):
	var entry = TIME_STAMP.instance()
	# tip: add the input response instance to game before setting text, 
	# otherwise can't call queue_free() on the input lebel in response.set_text()
	_add_response_to_game_one_above(entry)
	entry.set_text(text)
	
func clear_phone_screen():
		for n in history_rows.get_children():
			history_rows.remove_child(n)
			n.queue_free()

##### PRIVATE #####
func _handle_scrollbar_changed():
	if (max_scroll_length != scrollbar.max_value):
		scroll.scroll_vertical = scrollbar.max_value
		max_scroll_length = scrollbar.max_value


func _delete_history_beyond_limit():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()


func _add_response_to_game(response: Control):
	history_rows.add_child(response)
	
func _add_response_to_game_one_above(response: Control):
	history_rows.add_child(response)
	history_rows.move_child(response, history_rows.get_child_count()-2)
