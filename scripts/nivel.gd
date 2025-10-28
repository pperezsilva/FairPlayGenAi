extends Control
@onready var click: AudioStreamPlayer = $sndClick
var textos = ["La energía solar es una forma de energía renovable que se obtiene al aprovechar la radiación del sol mediante paneles o celdas fotovoltaicas.", 
"La energía solar es la energía que se obtiene del calor del viento y se transforma en electricidad mediante turbinas solares.",
"La energía solar se produce al quemar gases del sol en plantas generadoras ubicadas en la Tierra."]
var textos2 = ["La energía solar es importante porque reduce la dependencia de los combustibles fósiles, disminuye la contaminación y promueve el desarrollo sostenible.",
"La energía solar es importante porque produce más contaminación que otras energías, pero es más barata.",
"La energía solar solo funciona en países fríos y es la principal causa del calentamiento global."]
var textos3 = ["La energía solar se utiliza en la generación de electricidad, calentamiento de agua, iluminación y sistemas de riego.",
"La energía solar se usa principalmente para enfriar el aire y crear energía nuclear.",
"La energía solar se usa para almacenar la luz del sol dentro de baterías de gas y crear fuego artificial."]
var textoNuevo = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Buttonchange.hide()
	$Buttonchange2.hide()
	$Buttonchange3.hide()
	
	$LineaScan.hide()
	$LineaScan2.hide()
	$LineaScan3.hide()
	
	$AnimationGenaNivel.play("flyup")
	
	global.parrafos = [0,0,0]
	global.seleccionado = ""
	

# Reemplaza _delta por delta si añades codigo al _process
func _process(_delta: float) -> void:
	pass

func _on_texture_button_pause_pressed() -> void:
	print("Boton de Pausa Presionado")
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout
	$CanvasLayer/menuPausa.pause()


func _on_buttonchange_pressed() -> void:
	$LineaScan.show()
	$AnimationPlayerScaner.play("scaner")
	$AnimationScanerButton.play("ScanerButton")
	$AnimationGenaNivel.play("GenaGenerating")
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
	$AnimationGenaNivel.play("default")
	$LineaScan.hide()
	textoNuevo = textos.pick_random()
	while textoNuevo == $Buttontext.text:
		textoNuevo = textos.pick_random()
	$Buttontext.text = textoNuevo
	$Buttonchange.hide()

func _on_buttontext_pressed() -> void:
	$GenaNivel/GloboTexto.hide()
	$GenaNivel/ButtonGenerate.hide()
	
	$Buttonchange2.hide()
	$Buttonchange3.hide()
	if $Buttonchange.visible == false:
		$Buttonchange.show()
	else:
		$Buttonchange.hide()


func _on_button_text_2_pressed() -> void:
	$GenaNivel/GloboTexto.hide()
	$GenaNivel/ButtonGenerate.hide()
	
	$Buttonchange.hide()
	$Buttonchange3.hide()
	if $Buttonchange2.visible == false:
		$Buttonchange2.show()
	else:
		$Buttonchange2.hide()


func _on_buttonchange_2_pressed() -> void:
	$LineaScan2.show()
	$AnimationPlayerScaner.play("scaner")
	$AnimationScanerButton.play("ScanerButton2")
	$AnimationGenaNivel.play("GenaGenerating")
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
	$AnimationGenaNivel.play("default")
	$LineaScan2.hide()
	textoNuevo = textos.pick_random()
	while textoNuevo == $ButtonText2.text:
		textoNuevo = textos.pick_random()
	$ButtonText2.text = textoNuevo
	$Buttonchange2.hide()


func _on_button_text_3_pressed() -> void:
	$GenaNivel/GloboTexto.hide()
	$GenaNivel/ButtonGenerate.hide()
	
	$Buttonchange2.hide()
	$Buttonchange.hide()
	if $Buttonchange3.visible == false:
		$Buttonchange3.show()
	else:
		$Buttonchange3.hide()


func _on_buttonchange_3_pressed() -> void:
	$LineaScan3.show()
	$AnimationPlayerScaner.play("scaner")
	$AnimationScanerButton.play("ScannerButton3")
	$AnimationGenaNivel.play("GenaGenerating")
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
	$AnimationGenaNivel.play("default")
	$LineaScan3.hide()
	textoNuevo = textos.pick_random()
	while textoNuevo == $ButtonText3.text:
		textoNuevo = textos.pick_random()
	$ButtonText3.text = textoNuevo
	$Buttonchange3.hide()


func _on_animation_gena_nivel_animation_finished(anim_name: StringName) -> void:
	if anim_name == "flyup":
		$AnimationGenaNivel.play("default")


func _on_boton_escribir_pressed() -> void:
	$Escribiendo.show()
	$AnimationEscribiendo.play("Escribiendo")
	
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	global.usuarioOcupado = true
	

func _on_boton_escribir_2_pressed() -> void:
	$Escribiendo2.show()
	$AnimationEscribiendo.play("Escribiendo2")
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	global.usuarioOcupado = true


func _on_boton_escribir_3_pressed() -> void:
	$Escribiendo3.show()
	$AnimationEscribiendo.play("Escribiendo3")
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	global.usuarioOcupado = true

func _on_animation_escribiendo_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Escribiendo":
		$Escribiendo.hide()
		$Buttontext.show()
		$Buttontext.text = global.seleccionado
		global.seleccionado = ""
		global.parrafos[0] = 1
		global.usuarioOcupado = false
	
	if anim_name == "Escribiendo2":
		$Escribiendo2.hide()
		$ButtonText2.show()
		$ButtonText2.text = global.seleccionado
		global.seleccionado = ""
		global.parrafos[1] = 1
		global.usuarioOcupado = false
	
	if anim_name == "Escribiendo3":
		$Escribiendo3.hide()
		$ButtonText3.show()
		$ButtonText3.text = global.seleccionado
		global.seleccionado = ""
		global.parrafos[2] = 1
		global.usuarioOcupado = false
		
	
	


func _on_button_generate_pressed() -> void:
	$Buttontext.hide()
	$ButtonText2.hide()
	$ButtonText3.hide()
	
	$Buttontext.text = textos.pick_random()
	$ButtonText2.text = textos2.pick_random()
	$ButtonText3.text = textos3.pick_random()
	
	$GenaNivel/GloboTexto.hide()
	$GenaNivel/ButtonGenerate.hide()
	
	$AnimationGenaNivel.play("GenaGenerating")
	
	$Carga.show()
	$AnimationScanerButton.play("carga")
	


func _on_animation_scaner_button_animation_finished(anim_name: StringName) -> void:
	if anim_name == "carga":
		$Carga.hide()
		global.parrafos = [1,1,1]
		$Buttontext.show()
		$ButtonText2.show()
		$ButtonText3.show()
		
		$AnimationGenaNivel.play("default")


func _on_edit_pressed() -> void:
	$Escribiendo.show()
	$AnimationEscribiendo.play("Escribiendo")
	
	$Buttontext.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	global.usuarioOcupado = true


func _on_edit_2_pressed() -> void:
	$Escribiendo2.show()
	$AnimationEscribiendo.play("Escribiendo2")
	
	$ButtonText2.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	global.usuarioOcupado = true


func _on_edit_3_pressed() -> void:
	$Escribiendo3.show()
	$AnimationEscribiendo.play("Escribiendo3")
	
	$ButtonText3.hide()
	
	$Notas/Edit.hide()
	$Notas/Edit2.hide()
	$Notas/Edit3.hide()
	
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	
	global.usuarioOcupado = true


func _on_enviar_entregable_pressed() -> void:
	#global.parrafosFinales[0] = String($Buttontext.text)

	get_tree().change_scene_to_file("res://resultados.tscn")
