extends Node


signal room_changed(new_room)
signal room_updated(current_room)

var current_room = null
var player = null


func initialize(starting_room, player):
	self.player = player

	

func help() -> String:
	return PoolStringArray([
		"You can use these commands： ",
		" go   " + Types.wrap_location_text("[location]"),
		" take " + Types.wrap_item_text("[item]"),
		" drop " + Types.wrap_item_text("[item]"),
		" use  " + Types.wrap_item_text("[item]"),
		" talk " + Types.wrap_npc_text("[npc]"),
		" give " + Types.wrap_item_text("[item]"),
		" inventory",
		" help"
	]).join("\n")
