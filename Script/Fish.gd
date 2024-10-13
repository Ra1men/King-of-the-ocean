extends Node2D
class_name Fish

var starting_position : Vector2
var size : int
var direction : Vector2
var state : String = "move_right"
@export var move_speed = 100.0
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D


func turn():
	if(direction.x < 0):
		animation.play("move_left")
	elif(direction.x > 0):
		animation.play("move_right")
