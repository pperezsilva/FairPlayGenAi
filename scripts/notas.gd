extends Sprite2D

#var medida = ["################################################################################################################################################################################################################################"]
var paginas = ["La energía solar es una forma de energía renovable que aprovecha la radiación proveniente del sol. Esta radiación puede transformarse en electricidad mediante paneles fotovoltaicos", 
"Los avances tecnológicos han transformado la energía solar en una de las más eficientes y económicas del sector de las renovables. Esta es una fuente renovable y limpia.",
"A diferencia de otras fuentes, no requiere combustión ni genera residuos tóxicos. Su funcionamiento depende principalmente de la captación de luz, no del viento ni del calor directo.",
"La energía solar tiene una gran importancia ambiental y social. Al no depender de combustibles fósiles, contribuye a reducir las emisiones de gases de efecto invernadero.",
"Su mantenimiento es bajo, y los paneles tienen una larga vida útil. Aunque su instalación inicial puede ser costosa, a largo plazo genera ahorros significativos y beneficios para el planeta.",
"Las aplicaciones de la energía solar son muy amplias y abarcan desde el ámbito doméstico hasta el industrial y científico.",
"En las casas, los paneles solares generan electricidad o calientan agua. En zonas rurales, se usan para bombear agua o alimentar sistemas de riego sin necesidad de combustibles.",
"Las empresas los utilizan para reducir su huella de carbono y disminuir costos energéticos.",
"Los satélites y sondas espaciales dependen de paneles solares para obtener energía, ya que el sol es la única fuente disponible en el espacio."]

var pag = 0

var parafraseados = [
" La energía solar es una fuente renovable que utiliza la radiación del sol para generar energía. Esta puede convertirse en electricidad a través de paneles solares fotovoltaicos.",
"Los desarrollos tecnológicos han convertido la energía solar en una de las más rentables y productivas dentro del campo renovable. Es una fuente limpia y sostenible.",
"A diferencia de otras energías, no necesita quemar materiales ni produce contaminantes. Su operación se basa en captar luz solar, no en el viento ni en el calor directo.",
"La energía solar posee un gran valor ambiental y social. Al no usar combustibles fósiles, ayuda a disminuir la emisión de gases que provocan el cambio climático.",
"Su mantenimiento resulta sencillo, y los paneles duran muchos años. Aunque el costo inicial es alto, con el tiempo ofrece importantes ahorros y ventajas ecológicas.",
"Las aplicaciones de la energía solar son variadas, desde el uso doméstico y comercial hasta sectores industriales y de investigación científica.",
"En los hogares, los sistemas solares producen electricidad o calientan agua. En comunidades rurales, sirven para bombear agua o hacer funcionar sistemas de riego sin combustibles.",
"Las compañías aprovechan esta tecnología para bajar su impacto ambiental y reducir sus gastos energéticos anuales.",
"Los satélites y misiones espaciales dependen de paneles solares como fuente de energía, ya que el sol es el único recurso disponible fuera de la Tierra."
];


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
	$"../Buttonchange".hide()
	$"../Buttonchange2".hide()
	$"../Buttonchange3".hide()
	
	$"../GenaNivel/GloboTexto".hide()
	$"../GenaNivel/ButtonGenerate".hide()
	
	if $BotonEscribir.visible == false and $BotonEscribir2.visible == false and $BotonEscribir3.visible == false:
		global.seleccionado = parafraseados[pag]
		#print(global.seleccionado)
	
		if global.usuarioOcupado == false:
			if global.parrafos[0] == 0:
				$BotonEscribir.show()
			else:
				$Edit.show()
			if global.parrafos[1] == 0:
				$BotonEscribir2.show()
			else:
				$Edit2.show()
			if global.parrafos[2] == 0:
				$BotonEscribir3.show()
			else:
				$Edit3.show()
	else:
		global.seleccionado = ""
		$BotonEscribir.hide()
		$BotonEscribir2.hide()
		$BotonEscribir3.hide()
		$Edit.hide()
		$Edit2.hide()
		$Edit3.hide()
	
