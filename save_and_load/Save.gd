extends Node2D

const SAVE_DIR = "user://saves/"
const SAVE_SLOT = preload("res://save_and_load/SaveSlot.tscn")

onready var save_slot_rows = $CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/Console/ScrollContainer/VBoxContainer
onready var console_label = $CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/ConsoleLabel

var current_selected_save = ""

signal player_loaded()

func _ready() -> void:
	# make 20 empty save slots
	for i in range(20):
		var save_path = SAVE_DIR + "save_" + str(i) + ".dat"
		var new_save_slot = SAVE_SLOT.instance()
		save_slot_rows.add_child(new_save_slot)
		
		# check if the file slot has been saved
		var file = File.new()
		if (file.file_exists(save_path)):
			var error = file.open_encrypted_with_pass(save_path, File.READ, "polyfization")
			if error == OK:
				var player_data = file.get_var()
				file.close()
				new_save_slot.set_slot(save_path, "Day " + str(player_data.current_day), str(player_data.modification_time))
		else:
			new_save_slot.set_slot(save_path, "Empty", "")
		
		new_save_slot.connect("save_slot_selected", self, "_on_save_slot_selected")
		pass
		
func _on_save_slot_selected(save_slot):
	# set current selected save slot
	current_selected_save = save_slot
	# toggle off all other save slots
	for s in save_slot_rows.get_children():
		if s != save_slot:
			s.turn_off_toggle()
	
func _on_SaveButton_pressed():
	if current_selected_save.get_file_name().empty():
		pass # TODO: make hint to select a save slot
	else:
		save_data(current_selected_save)
	
func save_data(var save_slot):
	var save_file_name = save_slot.get_file_name()
	var modificationTime_raw = OS.get_datetime()
	var modification_time = PoolStringArray([str(modificationTime_raw.year),
											str(modificationTime_raw.month), 
											str(modificationTime_raw.day),
											str(modificationTime_raw.hour),
											str(modificationTime_raw.minute),
											str(modificationTime_raw.second)]).join(".")
	
	var data = {
		"modification_time": modification_time,
		"current_day" : GameData.current_day,
	}
	
	# Update Save Slot texts
	save_slot.current_day_label.text = "Day " + str(data.current_day)
	save_slot.system_time_label.text = str(data.modification_time)
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
#	var error = file.open(save_path, File.WRITE)
	var error = file.open_encrypted_with_pass(save_file_name, File.WRITE, "polyfization")
	if error == OK:
		file.store_var(data)
		file.close()
	
	console_write("data saved")

func _on_LoadButton_pressed():
	if current_selected_save.get_file_name().empty():
		pass # TODO: make hint to select a save slot
	else:
		load_data(current_selected_save)
	
func load_data(var save_slot):
	var save_file_name = save_slot.get_file_name()
	var file = File.new()
	if file.file_exists(save_file_name):
#		var error = file.open(save_path, File.READ)
		var error = file.open_encrypted_with_pass(save_file_name, File.READ, "polyfization")
		if error == OK:
			var player_data = file.get_var()
			file.close()
			console_write(player_data)
			GameData.current_day = player_data.current_day
	
	console_write("data loaded")
	
	$LoadSound.play()
	emit_signal("player_loaded")
	
func _on_ContinueButton_pressed() -> void:
	$LoadSound.play()
	emit_signal("player_loaded")

func console_write(value):
	console_label.text = str(value) + "\n"
	
func hide_save_menu():
	$CanvasLayer.visible = false

func show_save_menu():
	$CanvasLayer.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/SaveButton.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/LoadButton.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/ContinueButton.visible = true

func show_save_menu_load_only():
	$CanvasLayer.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/SaveButton.visible = false
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/LoadButton.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/ContinueButton.visible = false
	
func show_save_menu_save_only():
	$CanvasLayer.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/SaveButton.visible = true
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/LoadButton.visible = false
	$CanvasLayer/Control/SaveLoadWindow/Panel/VBoxContainer/HBoxContainer/ContinueButton.visible = true

