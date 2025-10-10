extends Control
#@onready var musica: AudioStreamPlayer = $studyTime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	$CanvasLayer/menuPausa.pause()
