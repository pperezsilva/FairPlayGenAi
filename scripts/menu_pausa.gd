extends Control

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	hide()

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()

func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()


func _on_texture_button_exit_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


func _on_texture_button_play_pressed() -> void:
	resume()
	


func _on_texture_button_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
