extends Node

@export var mute : bool = false 
@onready var music_start: AudioStreamPlayer = $MusicStart
@onready var button_pressed: AudioStreamPlayer = $ButtonPressed

@onready var music: AudioStreamPlayer = $Music
@onready var eat_fish: AudioStreamPlayer = $EatFish
@onready var lose: AudioStreamPlayer = $Lose
@onready var victory: AudioStreamPlayer = $Victory

func play_music_start():
	if not mute:
		music_start.play()


func play_button_pressed():
	if not mute:
		button_pressed.play()

func play_music():
	if not mute:
		music.play()
		music_start.stop()
		victory.stop()

func play_eat_fish():
	if not mute:
		eat_fish.play()

func play_lose():
	if not mute:
		lose.play()

func play_victory():
	if not mute:
		victory.play()
		music.stop()
