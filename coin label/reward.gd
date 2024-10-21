extends Area2D

@export var prize1: int = 0
@export var Coin_label: Label # dont reference nodes with ../, just take it as export and it can be configured by the editor

@onready var timer = $Timer  # use @onready only for nodes
@onready var label: Label = $Label
@onready var background: ColorRect = $Background # I created a colorRect to see when the arrow passes over

var reward_given = false # variables don't need on ready
var reward = 0

enum {
	IDLE,
	GIVING
}

var state = IDLE

func _ready() -> void:
	label.text = str(prize1) + " coins" # you can update the value dynamically without using "editable children"
	background.modulate = Color.TRANSPARENT
	
	timer.timeout.connect(_on_timer_end) # this is the way to do something when a signal is called
	area_entered.connect(_on_reward_sensor_area_entered) # area_entered and area_exited are methods of Area2D. Using connect executes functions when the signal is triggered
	area_exited.connect(_on_reward_sensor_area_exited)

func _input(_event):
	if Input.is_action_just_pressed("spin"):
		timer.start() # you only need to start the timer, and when the timer finishes, line 24 will take action

func _on_timer_end():
	if state == GIVING:
		reward += prize1
		Coin_label.set_text("%s coins" % [reward])
		state = IDLE

func _on_reward_sensor_area_entered(_area: Area2D) -> void:
	state = GIVING
	background.modulate = Color.WHITE 


func _on_reward_sensor_area_exited(_area: Area2D) -> void:
	state = IDLE
	background.modulate = Color.TRANSPARENT
