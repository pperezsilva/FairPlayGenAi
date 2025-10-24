extends Control
@onready var click: AudioStreamPlayer = $sndClick
var textos = ["Conjunto de reglas o principios sobre una materia racionalmente enlazados entre sí.", 
"Conjunto de cosas que relacionadas entre sí ordenadamente contribuyen a determinado objeto.",
"Bienvenido un sistema es un conjunto de normas que son establecidad directamente de la UNM que son los RKS"]
var textos2 = ["Con tu cabello bien humedo aplica Sedal CERAMIDAS en la palma de tus manos para que se distribuya.",
"Para comenzar recomendamos poner una cantidad igual al tamaño de una almendra, esto ayudara positivamente a su desarrollo.",
"Seca tu cabello de manera natural o usando secador, esto ayudara a que tu cabello no se dañe."]
var textos3 = ["Recipiente a presion, no debe ser perforado ni quemado incluso despues de su uso",
"Lea la etiqueta y las intrucciones pertinentes antes de usar este producto. Nunca reutilize el envase.",
"En caso de malestar o entoxicacion, lleve el paciente al medico y entregue la etiqueta o instructivo."]
var textoNuevo = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Buttonchange.hide()
	$Buttonchange2.hide()
	$Buttonchange3.hide()
	
	$LineaScan.hide()
	$LineaScan2.hide()
	$LineaScan3.hide()
	
	#$Buttontext.text = textos.pick_random()
	#$ButtonText2.text = textos2.pick_random()
	#$ButtonText3.text = textos3.pick_random()
	
	$AnimationGenaNivel.play("flyup")



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
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
	$LineaScan.hide()
	textoNuevo = textos.pick_random()
	while textoNuevo == $Buttontext.text:
		textoNuevo = textos.pick_random()
	$Buttontext.text = textoNuevo
	$Buttonchange.hide()

func _on_buttontext_pressed() -> void:
	$Buttonchange2.hide()
	$Buttonchange3.hide()
	if $Buttonchange.visible == false:
		$Buttonchange.show()
	else:
		$Buttonchange.hide()


func _on_button_text_2_pressed() -> void:
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
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
	$LineaScan2.hide()
	textoNuevo = textos.pick_random()
	while textoNuevo == $ButtonText2.text:
		textoNuevo = textos.pick_random()
	$ButtonText2.text = textoNuevo
	$Buttonchange2.hide()


func _on_button_text_3_pressed() -> void:
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
	await get_tree().create_timer(1.0).timeout
	$AnimationPlayerScaner.stop()
	$AnimationScanerButton.stop()
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
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	$Buttontext.show()
	$Buttontext.text = global.seleccionado
	global.seleccionado = ""
	global.parrafos[0] = 1


func _on_boton_escribir_2_pressed() -> void:
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	$ButtonText2.show()
	$ButtonText2.text = global.seleccionado
	global.seleccionado = ""
	global.parrafos[1] = 1


func _on_boton_escribir_3_pressed() -> void:
	$Notas/BotonEscribir.hide()
	$Notas/BotonEscribir2.hide()
	$Notas/BotonEscribir3.hide()
	$ButtonText3.show()
	$ButtonText3.text = global.seleccionado
	global.seleccionado = ""
	global.parrafos[2] = 1
