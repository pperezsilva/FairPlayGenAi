extends Node2D
var pag = 0
var paginas = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pag = 0
	paginas = {
		0: {
			"texto": "La energía solar ayuda a reducir las emisiones de gases de efecto invernadero.",
			"parafraseo": "El uso de paneles solares contribuye a disminuir la cantidad de dióxido de carbono liberado a la atmósfera, favoreciendo un entorno más limpio y sostenible.",
			"correcta": true,
			"requerimiento": 1
		},
		1: {
			"texto": "Los paneles solares pueden ocupar grandes extensiones de terreno.",
			"parafraseo": "En algunos casos, las instalaciones solares requieren amplias superficies, lo que puede representar un desafío en áreas con espacio limitado o con otros usos del suelo.",
			"correcta": true,
			"requerimiento": 2
		},
		2: {
			"texto": "El almacenamiento de energía solar aún depende de baterías de alto costo.",
			"parafraseo": "Aunque las tecnologías de almacenamiento han mejorado, las baterías necesarias para conservar la energía solar suelen ser costosas y requieren mantenimiento constante.",
			"correcta": false,  # Trampa: es un reto, pero no el principal que se busca
			"requerimiento": 0
		},
		3: {
			"texto": "El viento también es una fuente de energía renovable ampliamente utilizada.",
			"parafraseo": "Al igual que el sol, el viento se considera una fuente natural e inagotable que puede generar electricidad mediante aerogeneradores.",
			"correcta": false,  # Trampa: habla de energía renovable, pero no solar
			"requerimiento": 0
		},
		4: {
			"texto": "Los paneles solares funcionan de forma más eficiente en zonas con alta radiación solar.",
			"parafraseo": "Las regiones con más horas de sol directo suelen obtener un mejor rendimiento energético, aunque esto no siempre garantiza el aprovechamiento máximo.",
			"correcta": false,  # Trampa: parece ventaja, pero es una condición, no una ventaja ambiental
			"requerimiento": 0
		},
		5: {
			"texto": "La energía solar puede aprovecharse para calentar agua en hogares y edificios.",
			"parafraseo": "Los sistemas térmicos solares permiten transformar la radiación solar en calor útil, empleado en duchas, piscinas y procesos industriales.",
			"correcta": true,  # Requerimiento 3
			"requerimiento": 3
		}
	}
	
	$btnTextoNotas.text = paginas[pag]["texto"]
	$numeroPagina.text = "Pagina " + str(pag +1)
	$anteriorPag.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_siguiente_pag_pressed() -> void:
	var btnEscribir = get_parent().get_node("entregable/btnEscribir")
	var btnEscribir2 = get_parent().get_node("entregable/btnEscribir2")
	var btnEscribir3 = get_parent().get_node("entregable/btnEscribir3")
	
	btnEscribir.hide()
	btnEscribir2.hide()
	btnEscribir3.hide()
	
	pag += 1
	$btnTextoNotas.text = paginas[pag]["texto"]
	$numeroPagina.text = "Pagina " + str(pag +1)
	
	if pag + 1 >= paginas.size():
		$siguientePag.hide()
	
	if pag >= 1:
		$anteriorPag.show()


func _on_anterior_pag_pressed() -> void:
	var btnEscribir = get_parent().get_node("entregable/btnEscribir")
	var btnEscribir2 = get_parent().get_node("entregable/btnEscribir2")
	var btnEscribir3 = get_parent().get_node("entregable/btnEscribir3")
	
	btnEscribir.hide()
	btnEscribir2.hide()
	btnEscribir3.hide()
	
	pag -= 1
	$btnTextoNotas.text = paginas[pag]["texto"]
	$numeroPagina.text = "Pagina " + str(pag +1)
	
	if pag <= 0:
		$anteriorPag.hide()
	
	if pag + 1 < paginas.size():
		$siguientePag.show()


func _on_btn_texto_notas_pressed() -> void:
	var opcionesGena = get_parent().get_node("opcionesGena")
	
	if opcionesGena.visible:
		opcionesGena.hide()
	
	
	if global.action == false:
		global.select["texto"] = paginas[pag]["parafraseo"]
		global.select["correcta"] = paginas[pag]["correcta"]
		global.select["requerimiento"] = paginas[pag]["requerimiento"]
		
		var btnEscribir = get_parent().get_node("entregable/btnEscribir")
		var btnEscribir2 = get_parent().get_node("entregable/btnEscribir2")
		var btnEscribir3 = get_parent().get_node("entregable/btnEscribir3")
		
		var btnBorrar = get_parent().get_node("entregable/btnBorrar")
		var btnBorrar2 = get_parent().get_node("entregable/btnBorrar2")
		var btnBorrar3 = get_parent().get_node("entregable/btnBorrar3")
		
		btnBorrar.hide()
		btnBorrar2.hide()
		btnBorrar3.hide()
		
		
		if btnEscribir.visible == false and global.paragraph[0] == 0: 
			btnEscribir.show()
		else:
			btnEscribir.hide()
		
		if btnEscribir2.visible == false and global.paragraph[1] == 0: 
			btnEscribir2.show()
		else:
			btnEscribir2.hide()
			
		if btnEscribir3.visible == false and global.paragraph[2] == 0: 
			btnEscribir3.show()
		else:
			btnEscribir3.hide()
	else:
		$sndError.play()
	
