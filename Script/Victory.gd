extends Control


func _on_start_pressed():
	GameManager.start_game()
	AudioManager.button_pressed
	queue_free()
	GameManager.reset_score()

func _on_exit_pressed():
	AudioManager.button_pressed
	GameManager.exit_game()
