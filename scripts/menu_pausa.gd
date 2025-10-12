extends Control
@onready var confirmar_salida_menu = $MensajeConfirmacion
@onready var confirmar_reinicio = $ConfirmacionReiniciar
@onready var click: AudioStreamPlayer = $sndClick

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
	resume()
	hide()


# Reemplaza _delta por delta si añades codigo al _process
func _process(_delta: float) -> void:
	testEsc()


func _on_texture_button_exit_pressed() -> void:
	click.play(0.4)
	confirmar_salida_menu.show()

func _on_texture_button_play_pressed() -> void:
	click.play(0.4)
	resume()
	


func _on_texture_button_restart_pressed() -> void:
	click.play(0.4)
	confirmar_reinicio.show()
	#resume()
	#get_tree().reload_current_scene()
