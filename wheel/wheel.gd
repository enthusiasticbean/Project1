extends Sprite2D

var tween_has_run = false
var prize = null

func _input(_event):
	#if not tween_has_run:
	if Input.is_action_just_pressed("spin"):
		var spinner = create_tween()
		spinner.tween_property(self, "rotation_degrees", randf_range(360, 1200), 1).as_relative()
		spinner.tween_property(self, "rotation_degrees", randf_range(1, 360), 1).as_relative()
		tween_has_run = true
