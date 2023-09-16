extends Node

class_name DialogBox

@onready var label := $Label

func reveal(bounceCount : int):
	label.text = "You bounced Keen %s times!\n\nClick to play again!" % bounceCount

func _input(event):
	if event.is_action_pressed("Mouse0"):
		get_tree().reload_current_scene()
