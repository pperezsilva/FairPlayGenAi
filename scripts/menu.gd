extends Control
@onready var musica: AudioStreamPlayer = $sndMenu
@onready var click: AudioStreamPlayer = $sndClick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_btn_jugar_pressed() -> void:
	print("Comienza el juego")
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout # Esperar a reproducir sonido antes de ejecutar acción
	get_tree().change_scene_to_file("res://escenas/Nivel.tscn")

func _on_btn_opciones_pressed() -> void:
	print("Opciones seleccionado")
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout # Esperar a reproducir sonido antes de ejecutar acción


func _on_btn_salir_pressed() -> void:
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout# Esperar a reproducir sonido antes de ejecutar acción
	get_tree().quit()


func _on_btn_creditos_pressed() -> void:
	print("Creditos seleccionado")
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout# Esperar a reproducir sonido antes de ejecutar acción


# --- Música del nivel ---
var musicaMenu = preload("res://sonidos/musica/menuMusic.wav")
# Función para reproducir la música
func _menu() -> void:
	musica.stream = musicaMenu
	musica.play()
	musica.finished.connect(_on_music_finished)
# Función para repetir la música
func _on_music_finished():
	musica.play()
