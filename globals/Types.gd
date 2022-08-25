extends Node

signal choice_selected(choice)

enum ItemTypes {
	KEY = 0,
	QUEST_ITEM = 1,
}

const COLOR_NPC = Color("#4B5A20")
const COLOR_ITEM = Color("#DBA40E")
const COLOR_SPEECH = Color(1, 1, 1)
const COLOR_LOCATION = Color("#7E6E13")
const COLOR_SYSTEM = Color("#FF75D8")

func wrap_npc_text(text: String) -> String:
	return "[color=#%s] %s [/color]" % [COLOR_NPC.to_html(), text]
	
func wrap_item_text(text: String) -> String:
	return "[color=#%s] %s [/color]" % [COLOR_ITEM.to_html(), text]
	
func wrap_speech_text(text: String) -> String:
	return "[color=#%s] %s [/color]" % [COLOR_SPEECH.to_html(), text]
	
func wrap_location_text(text: String) -> String:
	return "[color=#%s] %s [/color]" % [COLOR_LOCATION.to_html(), text]
	
func wrap_system_text(text: String) -> String:
	return "[color=#%s] %s [/color]" % [COLOR_SYSTEM.to_html(), text]
