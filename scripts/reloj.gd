extends Control

# referencias a nodos
@onready var reloj_label: Label = $RelojLabel
@onready var timer: Timer = $Timer
@onready var tick_player: AudioStreamPlayer = $TickPlayer

# configurables desde el Inspector
@export var hora_inicio: int = 8
@export var minuto_inicio: int = 0
@export var am_inicio: bool = true   # true = AM, false = PM

@export var hora_fin: int = 12
@export var minuto_fin: int = 0
@export var am_fin: bool = true

# cada cuántos minutos avanza el reloj por tick
@export var minutos_por_tick: int = 5
# cada cuántos segundos reales ocurre un tick
@export var segundos_por_tick: float = 5.0
# cada cuántos ticks se reproduce un sonido normal
@export var ticks_por_sonido: int = 2

# alerta: tiempo antes de fin para activar modo alerta
@export var horas_alerta: int = 0
@export var minutos_alerta: int = 30

# estado interno
var hora_actual: int
var minuto_actual: int
var es_am: bool
var tick_contador: int = 0
var en_alerta: bool = false

func _ready() -> void:
	hora_actual = hora_inicio
	minuto_actual = minuto_inicio
	es_am = am_inicio
	tick_contador = 0
	en_alerta = false

	actualizar_label()

	timer.wait_time = max(0.01, segundos_por_tick)
	timer.one_shot = false
	timer.start()

	# al inicio siempre estado normal
	gblVarEdoMusica.estado_musica = 0

func _on_Timer_timeout() -> void:
	avanzar_tiempo()
	actualizar_label()

	verificar_alerta()
	_reproducir_tick()

	if _hora_terminada():
		timer.stop()

func avanzar_tiempo() -> void:
	minuto_actual += minutos_por_tick
	while minuto_actual >= 60:
		minuto_actual -= 60
		hora_actual += 1

		if hora_actual > 12:
			hora_actual = 1

		# cambio AM/PM al dar las 12:00
		if hora_actual == 12 and minuto_actual == 0:
			es_am = !es_am

func actualizar_label() -> void:
	var sufijo = "AM" if es_am else "PM"
	reloj_label.text = "%02d:%02d %s" % [hora_actual, minuto_actual, sufijo]

func _reproducir_tick() -> void:
	if en_alerta:
		# ticks acelerados: cada tick del reloj
		if tick_player.stream:
			tick_player.play(4.3)
	else:
		# ticks normales (según configuración)
		tick_contador += 1
		if tick_contador >= ticks_por_sonido:
			if tick_player.stream:
				tick_player.play(4.3)
			tick_contador = 0

func verificar_alerta() -> void:
	if not en_alerta:
		var total_actual = _hora_a_minutos(hora_actual, minuto_actual, es_am)
		var total_fin = _hora_a_minutos(hora_fin, minuto_fin, am_fin)

		# convertimos el tiempo de alerta en minutos totales
		var minutos_totales_alerta = horas_alerta * 60 + minutos_alerta
		var diferencia = total_fin - total_actual

		if diferencia <= minutos_totales_alerta:
			en_alerta = true
			gblVarEdoMusica.estado_musica = 1   # cambiamos a modo alerta

func _hora_terminada() -> bool:
	var total_actual = _hora_a_minutos(hora_actual, minuto_actual, es_am)
	var total_fin = _hora_a_minutos(hora_fin, minuto_fin, am_fin)
	return total_actual >= total_fin

func _hora_a_minutos(hora: int, minuto: int, es_am_local: bool) -> int:
	var h24 = hora % 12
	if not es_am_local:
		h24 += 12
	return h24 * 60 + minuto
