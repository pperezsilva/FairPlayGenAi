extends Control

var backwards = 0

var respuestas = {
	0: {
		"correcta": {
			"texto": "El uso de energía solar contribuye a disminuir la liberación de gases contaminantes en la atmósfera, reduciendo el impacto ambiental a largo plazo.",
			"requerimiento": 1,
			"correcta": true
		},
		"incorrecta": {
			"texto": "Generado con GENA IA: la energía solar elimina todos los gases de efecto invernadero, incluso el ozonio artificial que producen algunas ciudades modernas.",
			"requerimiento": 1,
			"correcta": false
		}
	},

	1: {
		"correcta": {
			"texto": "Las instalaciones solares requieren áreas amplias para funcionar adecuadamente, lo que puede resultar complicado en zonas donde el espacio es limitado.",
			"requerimiento": 2,
			"correcta": true
		},
		"incorrecta": {
			"texto": "Los paneles solares modernos solo requieren unos pocos centímetros cuadrados para abastecer comunidades enteras, por lo que el espacio nunca es un problema.",
			"requerimiento": 2,
			"correcta": false
		}
	},

	2: {
		"correcta": {
			"texto": "La energía solar puede aprovecharse mediante sistemas térmicos para calentar agua en viviendas y edificios, ofreciendo una alternativa eficiente para uso doméstico.",
			"requerimiento": 3,
			"correcta": true
		},
		"incorrecta": {
			"texto": "Los paneles solares básicamente calientan el agua por sí solos como si fueran una estufa gigante, así que solo los pones y ya salen litros de agua caliente.",
			"requerimiento": 3,
			"correcta": false
		}
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Reinicio de variables globales
	global.action = false
	global.paragraph = [0,0,0]
	global.musicfast = false
	global.valorTiempoLimite = 480
	
	# Activa esta animacion si quieres cuando quieras que Gena se coloque en su posicion base
	$AnimationGena.play("GenaAparece")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.action == true:
		$AnimInterface.play("Time")


func _on_animation_gena_animation_finished(anim_name: StringName) -> void:
	if anim_name == "GenaAparece":
		$AnimationGena.play("GenaFlotando")


func _on_btn_pausa_pressed() -> void:
	print("Boton de Pausa Presionado")
	await get_tree().create_timer(0.2).timeout
	$CanvasLayer/menuPausa.pause()


func _on_snd_tarea_finished() -> void:
	$AnimTablonTareas.play("Entrada")


func _on_btn_gena_nivel_pressed() -> void:
	var btnEscribir = get_node("entregable/btnEscribir")
	var btnEscribir2 = get_node("entregable/btnEscribir2")
	var btnEscribir3 = get_node("entregable/btnEscribir3")
	
	btnEscribir.hide()
	btnEscribir2.hide()
	btnEscribir3.hide()
	
	if global.action == true:
		$SndError.play()
		return
		
	if $opcionesGena.visible:
		$AnimInterface.play_backwards("despliegueOpcionesGena")
		backwards = 1
	else:
		$opcionesGena.show()
		$AnimInterface.play("despliegueOpcionesGena")


func _on_anim_interface_animation_finished(anim_name: StringName) -> void:
	if anim_name == "despliegueOpcionesGena":
		if backwards == 1:
			$opcionesGena.hide()
			backwards = 0

func _on_opcion_generar_pressed() -> void:
	$AnimInterface.play_backwards("despliegueOpcionesGena")
	backwards = 1
	
	var CargaGena = get_node("entregable/CargaGena")
	var AnimationGenerando = get_node("entregable/AnimationGenerando")
	
	var topic1 = get_node("entregable/topic1")
	var topic2 = get_node("entregable/topic2")
	var topic3 = get_node("entregable/topic3")
	
	var parrafo1 = get_node("entregable/parrafo1")
	var parrafo2 = get_node("entregable/parrafo2")
	var parrafo3 = get_node("entregable/parrafo3")
	
	var btnEscribir = get_node("entregable/btnEscribir")
	var btnEscribir2 = get_node("entregable/btnEscribir2")
	var btnEscribir3 = get_node("entregable/btnEscribir3")
	
	var btnBorrar = get_node("entregable/btnBorrar")
	var btnBorrar2 = get_node("entregable/btnBorrar2")
	var btnBorrar3 = get_node("entregable/btnBorrar3")
	
	var isIA = get_node("entregable/isIA")
	var isIA2 = get_node("entregable/isIA2")
	var isIA3 = get_node("entregable/isIA3")
	
	topic1.hide()
	topic2.hide()
	topic3.hide()
	
	parrafo1.hide()
	parrafo2.hide()
	parrafo3.hide()
	
	btnEscribir.hide()
	btnEscribir2.hide()
	btnEscribir3.hide()
	
	btnBorrar.hide()
	btnBorrar2.hide()
	btnBorrar3.hide()
	
	isIA.hide()
	isIA2.hide()
	isIA3.hide()
	
	CargaGena.show()
	
	AnimationGenerando.play("Cargando")
	await get_tree().create_timer(3.0).timeout
	AnimationGenerando.stop()
	CargaGena.hide()
	
	topic1.show()
	topic2.show()
	topic3.show()
	
	parrafo1.show()
	parrafo2.show()
	parrafo3.show()
	
	
	if global.paragraph[0] == 0:
		var n = randi() % 2
		
		isIA.show()
		if n == 0:
			parrafo1.text = respuestas[0]["incorrecta"]["texto"]
			
			global.paragraph_data[0]["texto"] = respuestas[0]["incorrecta"]["texto"]
			global.paragraph_data[0]["requerimiento"] = 1
			global.paragraph_data[0]["correcta"] = false
		else:
			parrafo1.text = respuestas[0]["correcta"]["texto"]
			
			global.paragraph_data[0]["texto"] = respuestas[0]["incorrecta"]["texto"]
			global.paragraph_data[0]["requerimiento"] = 1
			global.paragraph_data[0]["correcta"] = true
		global.paragraph[0] = 1
		print("Parrafo 1: " + str(global.paragraph_data[0]))
	
	if global.paragraph[1] == 0:
		var n = randi() % 2
		
		isIA2.show()
		if n == 0:
			parrafo2.text = respuestas[1]["incorrecta"]["texto"]
			
			global.paragraph_data[1]["texto"] = respuestas[1]["incorrecta"]["texto"]
			global.paragraph_data[1]["requerimiento"] = 2
			global.paragraph_data[1]["correcta"] = false
		else:
			parrafo2.text = respuestas[1]["correcta"]["texto"]
			
			global.paragraph_data[1]["texto"] = respuestas[1]["incorrecta"]["texto"]
			global.paragraph_data[1]["requerimiento"] = 2
			global.paragraph_data[1]["correcta"] = true
		global.paragraph[1] = 1
		print("Parrafo 2: " + str(global.paragraph_data[1]))
	
	if global.paragraph[2] == 0:
		var n = randi() % 2
		
		isIA3.show()
		if n == 0:
			parrafo3.text = respuestas[2]["incorrecta"]["texto"]
			
			global.paragraph_data[2]["texto"] = respuestas[2]["incorrecta"]["texto"]
			global.paragraph_data[2]["requerimiento"] = 3
			global.paragraph_data[2]["correcta"] = false
		else:
			parrafo3.text = respuestas[2]["correcta"]["texto"]
			
			global.paragraph_data[2]["texto"] = respuestas[2]["incorrecta"]["texto"]
			global.paragraph_data[2]["requerimiento"] = 3
			global.paragraph_data[2]["correcta"] = true
		global.paragraph[2] = 1
		print("Parrafo 3: " + str(global.paragraph_data[2]))


func _on_opcion_revisar_pressed() -> void:
	$AnimInterface.play_backwards("despliegueOpcionesGena")
	backwards = 1
	
	$GenaNivel/textBox.show()
	$GenaNivel/textBox/text.text = "Analizando en busca de errores"
	
	var CargaGena = get_node("entregable/CargaGena")
	var AnimationGenerando = get_node("entregable/AnimationGenerando")
	
	var topic1 = get_node("entregable/topic1")
	var topic2 = get_node("entregable/topic2")
	var topic3 = get_node("entregable/topic3")
	
	var parrafo1 = get_node("entregable/parrafo1")
	var parrafo2 = get_node("entregable/parrafo2")
	var parrafo3 = get_node("entregable/parrafo3")
	
	var btnEscribir = get_node("entregable/btnEscribir")
	var btnEscribir2 = get_node("entregable/btnEscribir2")
	var btnEscribir3 = get_node("entregable/btnEscribir3")
	
	var btnBorrar = get_node("entregable/btnBorrar")
	var btnBorrar2 = get_node("entregable/btnBorrar2")
	var btnBorrar3 = get_node("entregable/btnBorrar3")
	
	var isIA = get_node("entregable/isIA")
	var isIA2 = get_node("entregable/isIA2")
	var isIA3 = get_node("entregable/isIA3")
	
	topic1.hide()
	topic2.hide()
	topic3.hide()
	
	parrafo1.hide()
	parrafo2.hide()
	parrafo3.hide()
	
	btnEscribir.hide()
	btnEscribir2.hide()
	btnEscribir3.hide()
	
	btnBorrar.hide()
	btnBorrar2.hide()
	btnBorrar3.hide()
	
	isIA.hide()
	isIA2.hide()
	isIA3.hide()
	
	CargaGena.show()
	
	AnimationGenerando.play("Cargando")
	await get_tree().create_timer(3.0).timeout
	AnimationGenerando.stop()
	CargaGena.hide()
	$GenaNivel/textBox.hide()
	$GenaNivel/textBox/text.text = ""
	
	topic1.show()
	topic2.show()
	topic3.show()
	
	parrafo1.show()
	parrafo2.show()
	parrafo3.show()
	
	if global.paragraph[0] == 1:
		print(parrafo1.text)


func _on_opcion_ayuda_pressed() -> void:
	$AnimInterface.play_backwards("despliegueOpcionesGena")
	backwards = 1
