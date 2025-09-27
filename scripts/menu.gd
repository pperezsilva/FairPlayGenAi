extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_jugar_pressed() -> void:
	print("Comienza el juego")


func _on_btn_opciones_pressed() -> void:
	print("Opciones seleccionado")


func _on_btn_salir_pressed() -> void:
	get_tree().quit()


func _on_btn_creditos_pressed() -> void:
	print("Creditos seleccionado")


# Música del nivel
@onready var musica: AudioStreamPlayer = $AudioStreamPlayer

var musicaMenu =  preload("res://sonidos/musica/sndMenu.wav")

func _menu() -> void:
	musica.stream = musicaMenu
	musica.play()
	musica.finished.connect(_on_music_finished)

func _on_music_finished():
	musica.play()
