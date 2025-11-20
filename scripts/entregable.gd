extends Node2D
@onready var reloj = get_parent().get_node("InterfaceTop/Reloj")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$topic1.text = "Ventaja ambiental"
	$topic2.text = "Retos / Limitaciones"
	$topic3.text = "Aplicacion Practica"
	
	$btnEnviarTarea.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.paragraph[0] == 1 and global.paragraph[1] == 1 and global.paragraph[2] == 1:
		$btnEnviarTarea.disabled = false
	else:
		$btnEnviarTarea.disabled = true

func _on_btn_escribir_pressed() -> void:
	$Escribiendo.show()
	$AnimationEscribiendo.play("Escribiendo")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_btn_escribir_2_pressed() -> void:
	$Escribiendo2.show()
	$AnimationEscribiendo.play("Escribiendo2")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_btn_escribir_3_pressed() -> void:
	$Escribiendo3.show()
	$AnimationEscribiendo.play("Escribiendo3")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_animation_escribiendo_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Escribiendo":
		$Escribiendo.hide()
		
		$parrafo1.text = global.select["texto"]
		$parrafo1.show()
		
		global.paragraph[0] = 1
		global.paragraph_data[0]["texto"] = global.select["texto"]
		global.paragraph_data[0]["requerimiento"] = global.select["requerimiento"]
		global.paragraph_data[0]["correcta"] = global.select["correcta"]
		print(global.paragraph_data[0])
		global.action = false
		
	if anim_name == "Escribiendo2":
		$Escribiendo2.hide()
		
		$parrafo2.text = global.select["texto"]
		$parrafo2.show()
		
		global.paragraph[1] = 1
		global.paragraph_data[1]["texto"] = global.select["texto"]
		global.paragraph_data[1]["requerimiento"] = global.select["requerimiento"]
		global.paragraph_data[1]["correcta"] = global.select["correcta"]
		print(global.paragraph_data[1])
		global.action = false
	
	if anim_name == "Escribiendo3":
		$Escribiendo3.hide()
		
		$parrafo3.text = global.select["texto"]
		$parrafo3.show()
		
		global.paragraph[2] = 1
		global.paragraph_data[2]["texto"] = global.select["texto"]
		global.paragraph_data[2]["requerimiento"] = global.select["requerimiento"]
		global.paragraph_data[2]["correcta"] = global.select["correcta"]
		print(global.paragraph_data[2])
		global.action = false


func _on_parrafo_1_pressed() -> void:
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()
	
	if global.action == false:
		if $btnBorrar.visible == false:
			$btnBorrar.show()
			
			$btnBorrar2.hide()
			$btnBorrar3.hide()
		else:
			$btnBorrar.hide()
	else:
		$sndError.play()


func _on_parrafo_2_pressed() -> void:
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()
	
	if global.action == false:
		if $btnBorrar2.visible == false:
			$btnBorrar2.show()
			
			$btnBorrar.hide()
			$btnBorrar3.hide()
		else:
			$btnBorrar2.hide()
	else:
		$sndError.play()


func _on_parrafo_3_pressed() -> void:
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()
	
	if global.action == false:
		if $btnBorrar3.visible == false:
			$btnBorrar3.show()
			
			$btnBorrar.hide()
			$btnBorrar2.hide()
		else:
			$btnBorrar3.hide()
	else:
		$sndError.play()


func _on_btn_borrar_pressed() -> void:
	$parrafo1.text = ""
	global.paragraph[0] = 0
	global.paragraph_data[0]["requerimiento"] = ""
	global.paragraph_data[0]["correcta"] = false
	$parrafo1.hide()
	$btnBorrar.hide()
	$isIA.hide()


func _on_btn_borrar_2_pressed() -> void:
	$parrafo2.text = ""
	global.paragraph[1] = 0
	global.paragraph_data[1]["requerimiento"] = ""
	global.paragraph_data[1]["correcta"] = false
	$parrafo2.hide()
	$btnBorrar2.hide()
	$isIA2.hide()


func _on_btn_borrar_3_pressed() -> void:
	$parrafo3.text = ""
	global.paragraph[2] = 0
	global.paragraph_data[2]["requerimiento"] = ""
	global.paragraph_data[2]["correcta"] = false
	$parrafo3.hide()
	$btnBorrar3.hide()
	$isIA3.hide()


func _on_btn_enviar_tarea_pressed() -> void:
	var hora_final = reloj.hora_actual
	var minuto_final = reloj.minuto_actual
	var sufijo = "AM" if reloj.es_am else "PM"
	
	var hora_texto = "%02d:%02d %s" % [hora_final, minuto_final, sufijo]
	
	global.tiempoFinal = hora_texto
	print("Hora final:", hora_texto)
	
	var minutos_finales = reloj._hora_a_minutos(hora_final, minuto_final, reloj.es_am)
	global.valorTiempoFinal = minutos_finales
	print("Tiempo numérico:", minutos_finales)



	get_tree().change_scene_to_file("res://escenas/resultados.tscn")
