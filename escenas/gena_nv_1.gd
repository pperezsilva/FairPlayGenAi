extends Control
var opcionActual = 0


var dialogos = [
	"Hola, ¡Bienvenido!",
	"Soy Gena, tu asistente de inteligencia artificial Generativa.",
	"Veo que te han asignado tu primera tarea",
	"¿Listo para comenzar?" # Aquí aparecen las opciones
]

var opcion1 = [
	"",
	"",
	""
]

var opcion2 = [
	"",
	"",
	""
]

var opcion3 = [
	"",
	"",
	""
]


var cdialogos = 0

var copcion1 = 0
var copcion2 = 0
var copcion3 = 0

func _ready() -> void:
	cdialogos = 0
	copcion1 = 0
	copcion2 = 0
	copcion3 = 0
	get_tree().paused = true
	$AnimationGena.play("Elevacion")
	$Opcion1.hide()
	$Opcion2.hide()
	$Opcion3.hide()

func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if opcionActual == 0:
		if cdialogos < dialogos.size():
			$AnimationTextBox.play("show")
			$TextBox/Label.text = dialogos[cdialogos]

			# Si estamos en el diálogo que muestra las opciones
			if cdialogos == 3:
				# Mostramos las opciones y les damos texto
				$Opcion1.text = "Empezemos!"
				$Opcion2.text = ""
				$Opcion3.text = "Nada, continuemos."
				$Opcion1.show()
				#$Opcion2.show()
				#$Opcion3.show()
				# Se oculta el boton continuar
				$TextBox/Button.hide()
			else:
				cdialogos += 1
		else:
			$TextBox.hide()
			$AnimationGena.play("FliyingAway")
			
			
			
	elif opcionActual == 1:
		if copcion1 < opcion1.size():
			$AnimationTextBox.play("show")
			$TextBox/Label.text = opcion1[copcion1]
			copcion1 += 1
		
		else:
			opcionActual = 0
			copcion1 = 0
			cdialogos += 1
			$TextBox.hide()
			$AnimationGena.play("FliyingAway")



func _on_animation_gena_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Elevacion":
		$AnimationGena.play("ChecklistDefault")
		$TextBox/Label.text = dialogos[cdialogos]
		cdialogos += 1
		$TextBox.show()
		$AnimationTextBox.play("show")
	elif anim_name == "FliyingAway":
		get_tree().paused = false
		queue_free()


# Estas funciones responderán a las opciones
func _on_opcion_1_pressed() -> void:
	$TextBox/Label.text = "¡Muy bien!"
	$Opcion1.hide()
	$Opcion2.hide()
	$Opcion3.hide()
	$AnimationGena.play("happyGena")
	opcionActual = 1
	$TextBox/Button.show()

func _on_opcion_2_pressed() -> void:
	$TextBox/Label.text = "Te puedo ayudar con tus tareas, soy como un asistente"
	$Opcion1.hide()
	$Opcion2.hide()
	$Opcion3.hide()
	$AnimationGena.play("ChecklistDefault")
	$TextBox/Button.show()

func _on_opcion_3_pressed() -> void:
	$TextBox/Label.text = "Puedo hacerlo solo"
	$Opcion1.hide()
	$Opcion2.hide()
	$Opcion3.hide()
	$AnimationGena.play("happyGena")
	cdialogos += 1
	$TextBox/Button.show()
