extends AudioStreamPlayer2D

@export var deathSound : AudioStream

func _on_keen_on_click():
	stream = deathSound
	play()
