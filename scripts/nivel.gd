extends Control
@onready var click: AudioStreamPlayer = $sndClick
#@onready var musica: AudioStreamPlayer = $studyTime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#_music()


# Reemplaza _delta por delta si añades codigo al _process
func _process(_delta: float) -> void:
	pass

# --- Música del nivel ---
#var musicaNivel = preload("res://sonidos/musica/studyTime.wav")
# Función para reproducir la música
#func _music() -> void:
#	musica.stream = musicaNivel
#	musica.play()
#	musica.finished.connect(_on_music_finished)
# Función para repetir la música
#func _on_music_finished():
#	musica.play()


func _on_texture_button_pause_pressed() -> void:
	print("Boton de Pausa Presionado")
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout
	$CanvasLayer/menuPausa.pause()
