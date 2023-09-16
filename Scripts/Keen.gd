extends RigidBody2D

@export var bump_force : float
@export var x_bump_scale : float
@export var game_gravity_scale : float
@export var label : Label

var _mouse_over = false
var _bounce_count = 0

signal on_click
	
func _input(event):
	if event.is_action_pressed("Mouse0") and _mouse_over:
		_bounce_count += 1
		label.text = str(_bounce_count)
		on_click.emit()
		gravity_scale = game_gravity_scale
		linear_velocity = Vector2.ZERO
		
		var rng = RandomNumberGenerator.new()
		var randomAngle = rng.randf_range(-30, 30);
		var clickOffset = position - get_global_mouse_position();
		var direction = Vector2(clickOffset.x * x_bump_scale, -bump_force)
		linear_velocity = (direction)
		
	
func _on_mouse_entered():
	_mouse_over = true


func _on_mouse_exited():
	_mouse_over = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	var scene : DialogBox = preload("res://Scenes/DialogBox.tscn").instantiate()
	add_child(scene)
	scene.reveal(_bounce_count)
	
