extends Area2D


@export var Coin_label: Label
@export var prize1: int
@onready var timer = $Timer
@onready var label = $Label

var reward = 0

enum {
	IDLE,
	GIVING
}

var state = IDLE

func _ready() -> void:
	label.text = str(prize1) + " coins"
	
	timer.timeout.connect(_on_timer_end)
	area_entered.connect(_on_reward_sensor_area_entered)
	area_exited.connect(_on_reward_sensor_area_exited)

func _input(_event):
	if Input.is_action_just_pressed("spin"):
		timer.start()

func _on_timer_end():
	if state == GIVING:
		var current_total = int(Coin_label.text)
		Coin_label.set_text("%s coins" % [current_total + prize1])
		state = IDLE


func _on_reward_sensor_area_entered(_area: Area2D) -> void:
	state = GIVING
	


func _on_reward_sensor_area_exited(_area: Area2D) -> void:
	state = IDLE
