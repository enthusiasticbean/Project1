extends Node2D


@export var texture = Texture2D:
	set(value):
		texture = value
		queue_redraw()

func _draw():
	draw_circle(Vector2(0, 0), 300, Color.DARK_SEA_GREEN)
