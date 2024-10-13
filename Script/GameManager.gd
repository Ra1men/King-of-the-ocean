extends Node

const GAME_OVER_SCENE = preload("res://Scenes/GameOverScene.tscn")

var score : int
var best_score : int

func start_game():
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
	check_score()

func exit_game():
	get_tree().quit()

func game_over():
	var scene = GAME_OVER_SCENE.instantiate()
	add_child(scene)

func reset_game():
	get_tree().reload_current_scene()
	check_score()

func check_score():
	var save_file = FileAccess.open("user://save.data", FileAccess.READ)
	if save_file != null:
		best_score = save_file.get_32()
	else:
		best_score = 0
		save_game()

func save_game():
	var save_file = FileAccess.open("user://save.data", FileAccess.WRITE)
	save_file.store_32(best_score)
