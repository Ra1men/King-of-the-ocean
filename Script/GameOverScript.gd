extends Control

func _ready():
	set_score()
	set_best_score()

func _on_restart_pressed():
	GameManager.reset_game()
	queue_free()

func _on_exit_pressed():
	GameManager.exit_game()

func set_score():
	$Score.text = "Score: " + str(GameManager.score)

func set_best_score():
	$Best.text = "Hi-Score: " + str(GameManager.best_score)
	GameManager.save_game()
