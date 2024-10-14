extends Control

@onready var start = $Start
@onready var exit = $Exit


func _ready():
	AudioManager.play_music_start()


func _on_start_pressed():
	AudioManager.play_button_pressed()
	GameManager.start_game()


func _on_exit_pressed() -> void:
	AudioManager.play_button_pressed()
	GameManager.exit_game()
