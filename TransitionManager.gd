extends Node

onready var anim = $AnimationPlayer
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func fade_in():
	anim.play("fade_in")
	$FadeInSound.play()
	
func fade_in_silent():
	anim.play("fade_in")
	
	
func fade_out():
	anim.play("fade_out")
	$FadeOutSound.play()
	
func fade_out_silent():
	anim.play("fade_out")
