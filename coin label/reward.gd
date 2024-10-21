extends Area2D


@onready var Coin_label = $"../coin label"
@onready var reward_given = false
@export var prize1: int = 0
@onready var reward = 0
@onready var timer = $Timer

enum {
	IDLE,
	GIVING
}

var state = IDLE

func _input(_event):
	if Input.is_action_just_pressed("spin"):
		reward_given = false
		timer.start()
		await timer.timeout
		if state == GIVING:
			if not reward_given:
				reward += prize1
				Coin_label.set_text("%s coins" % [reward])
				reward_given = true


func _on_reward_sensor_area_entered(_area: Area2D) -> void:
	state = GIVING


func _on_reward_sensor_area_exited(_area: Area2D) -> void:
	state = IDLE