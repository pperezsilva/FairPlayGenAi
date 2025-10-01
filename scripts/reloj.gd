extends Control

# referencias a nodos
@onready var reloj_label: Label = $RelojLabel
@onready var timer: Timer = $Timer

# configurables desde el Inspector
@export var hora_inicio: int = 8
@export var minuto_inicio: int = 0
@export var am_inicio: bool = true   # true = AM, false = PM

@export var hora_fin: int = 12
@export var minuto_fin: int = 0
@export var am_fin: bool = true

# velocidad del reloj: cuantos minutos avanza por cada tick del Timer
@export var minutos_por_tick: int = 5
# cada cuántos segundos de tiempo real se ejecuta un tick
@export var segundos_por_tick: float = 5.0

# estado interno
var hora_actual: int
var minuto_actual: int
var es_am: bool

func _ready() -> void:
	# inicializar hora
	hora_actual = hora_inicio
	minuto_actual = minuto_inicio
	es_am = am_inicio

	actualizar_label()

	# configurar timer
	timer.wait_time = max(0.01, segundos_por_tick)
	timer.one_shot = false
	timer.start()

func _on_Timer_timeout() -> void:
	avanzar_tiempo()
	actualizar_label()

	# condición de fin
	if _hora_terminada():
		timer.stop()
		# opcional: emitir señal o ejecutar acción
		# emit_signal("tiempo_terminado")

func avanzar_tiempo() -> void:
	minuto_actual += minutos_por_tick
	while minuto_actual >= 60:
		minuto_actual -= 60
		hora_actual += 1

		if hora_actual > 12:
			hora_actual = 1

		# el cambio AM/PM ocurre al llegar a las 12 en punto
		if hora_actual == 12 and minuto_actual == 0:
			es_am = !es_am


func actualizar_label() -> void:
	var sufijo = "AM" if es_am else "PM"
	reloj_label.text = "%02d:%02d %s" % [hora_actual, minuto_actual, sufijo]

func _hora_terminada() -> bool:
	# compara en minutos absolutos en formato 24h
	var total_actual = _hora_a_minutos(hora_actual, minuto_actual, es_am)
	var total_fin = _hora_a_minutos(hora_fin, minuto_fin, am_fin)
	return total_actual >= total_fin

func _hora_a_minutos(hora: int, minuto: int, es_am_local: bool) -> int:
	var h24 = hora % 12
	if not es_am_local:
		h24 += 12
	return h24 * 60 + minuto
