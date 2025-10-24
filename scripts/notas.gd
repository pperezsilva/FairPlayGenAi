extends Sprite2D

#var medida = ["################################################################################################################################################################################################################################"]
var paginas = ["El helio, un gas con el que, de una u otra forma, todos hemos estado en contacto. Ya sea en una fiesta o celebración en la que hay globos que flotan en el aire o inhalando el propio helio para que muestra voz suene mucho mas aguda", 
"El helio no es renovable y, a diferencia de otros recursos del planeta que se pueden regenerar o encontrar con facilidad, tiene un proceso de creación muy lento respecto al consumo actual del mismo.",
"Sus reservas naturales se están agotando, y es que la mayoría del que tenemos en la Tierra ha sido creado mediante la desintegración radiactiva de elementos como el uranio, los cuales liberan pequeñas cantidades de helio a lo largo de miles de años. ",
"El helio tiene aplicaciones de enorme importancia en campos como la ciencia, y es que es utilizado en la investigación criogénica debido a que alcanza temperaturas extremadamente bajas sin llegar a congelarse.",
"Por esto, es un refrigerante ideal para mantener fríos los imanes superconductores, los cuáles entre sus aplicaciones tienen a los escáneres de imágenes de resonancia magnética de los hospitales, los cuáles se enfrían con helio.",
"La importancia de este gas también destaca en la industria espacial, donde es utilizado para presurizar y purgar los tanques de combustibles de cohetes, así como en la fabricación de semiconductores."]

var pag = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BotonTextoNotas.text = paginas[pag]
	$LabelNumeroPagina.text = "Pagina " + str(pag + 1)
	$AnteriorPagina.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_siguiente_pagina_pressed() -> void:
	pag += 1
	$BotonTextoNotas.text = paginas[pag]
	$LabelNumeroPagina.text = "Pagina " + str(pag + 1)
	
	if pag + 1 >= paginas.size():
		$SiguientePagina.hide()
	
	if pag >= 1:
		$AnteriorPagina.show()


func _on_anterior_pagina_pressed() -> void:
	pag -= 1
	$BotonTextoNotas.text = paginas[pag]
	$LabelNumeroPagina.text = "Pagina " + str(pag + 1)
	
	if pag <= 0:
		$AnteriorPagina.hide()
	
	if pag + 1 < paginas.size():
		$SiguientePagina.show()


func _on_boton_texto_notas_pressed() -> void:
	global.seleccionado = paginas[pag]
	print(global.seleccionado)
	
	if global.parrafos[0] == 0:
		$BotonEscribir.show()
	
	if global.parrafos[1] == 0:
		$BotonEscribir2.show()
	
	if global.parrafos[2] == 0:
		$BotonEscribir3.show()
