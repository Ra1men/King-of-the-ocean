extends Control

@onready var start = $Start
@onready var exit = $Exit

func _on_start_pressed():
	GameManager.start_game()


func _on_exit_pressed() -> void:
	GameManager.exit_game()
