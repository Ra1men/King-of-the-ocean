extends Fish

signal player_died
@export var player_body : CharacterBody2D
var edge_of_screen := Vector2(2880,1080)
var fish_velocity : Vector2
@export var acceleration = 10


func _ready():
	start()

func _physics_process(delta):
	move_player(delta)
	position.x = clampf(position.x, 0, edge_of_screen.x) 
	position.y = clampf(position.y, 0, edge_of_screen.y)
	
func move_player(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(direction == Vector2.ZERO):
		fish_velocity = fish_velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		fish_velocity = fish_velocity.move_toward(direction * move_speed, acceleration * delta)
		if(direction == Vector2.LEFT  ||
			 Input.is_action_pressed("move_left") && Input.is_action_pressed("move_up") ||
			 Input.is_action_pressed("move_left") && Input.is_action_pressed("move_down")):
			animation.play("move_left")
			state = "move_left"
		elif(direction == Vector2.RIGHT  ||
			 Input.is_action_pressed("move_right") && Input.is_action_pressed("move_up") ||
			 Input.is_action_pressed("move_right") && Input.is_action_pressed("move_down")):
			animation.play("move_right")
			state = "move_right"
		else:
			animation.play(state)
	player_body.velocity = fish_velocity
	player_body.move_and_slide()
	
func grow():
	
	size += 1
	var new_scale = SizeManager.determine_size(size)
	if GameManager.score > GameManager.best_score:
		GameManager.best_score = GameManager.score
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(new_scale.x + 0.1, new_scale.y + 0.1), 0.4)
	tween.tween_property(self, "scale", new_scale, 0.4)
	
func die():
	player_died.emit()
	GameManager.score = size - 5
	queue_free()
	GameManager.game_over()
	
func start():
	show()
	set_process(true)
	size = 5;
	self.scale = SizeManager.determine_size(size)
