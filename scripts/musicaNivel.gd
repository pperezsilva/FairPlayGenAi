extends Node

@onready var musica_tranquila: AudioStreamPlayer = $sndMusica
@onready var musica_tension: AudioStreamPlayer = $sndAlerta

var estado_anterior: int = -1

func _ready() -> void:
	# Empezar con música tranquila
	musica_tranquila.play()
	musica_tension.stop()

func _process(delta: float) -> void:
	# Si el estado global cambia, actualizamos la música
	if gblVarEdoMusica.estado_musica != estado_anterior:
		estado_anterior = gblVarEdoMusica.estado_musica
		_actualizar_musica()

func _actualizar_musica() -> void:
	match gblVarEdoMusica.estado_musica:
		0:
			_modo_tranquilo()
		1:
			_modo_tension()
		# Puedes añadir más modos si quieres
		_:
			_modo_tranquilo()

func _modo_tranquilo() -> void:
	if not musica_tranquila.playing:
		musica_tension.stop()
		musica_tranquila.play()

func _modo_tension() -> void:
	if not musica_tension.playing:
		musica_tranquila.stop()
		musica_tension.play()
