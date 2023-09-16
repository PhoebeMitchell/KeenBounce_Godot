extends Sprite2D

@export var sprites : Array[Texture]

func _on_keen_on_click():
	var rng = RandomNumberGenerator.new()
	texture = sprites[rng.randi_range(0, 1)]
