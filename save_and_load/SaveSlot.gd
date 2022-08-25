extends PanelContainer


onready var current_day_label = $Button/HBoxContainer/CurrentDay
onready var system_time_label = $Button/HBoxContainer/SystemTime

var file_name = ""

signal save_slot_selected(save_slot)



func set_slot(file_name:String, current_day:String, system_time:String):
	self.file_name = file_name
	current_day_label.text = current_day
	system_time_label.text = system_time


func get_file_name():
	return file_name
	
	
func turn_off_toggle():
	$Button.pressed = false


func _on_Button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		emit_signal("save_slot_selected", self)
