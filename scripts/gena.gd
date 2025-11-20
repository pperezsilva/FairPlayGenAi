extends Control
var dialogos = [
	"¡HOLA, BIENVENIDO!",
	"SOY GENA, TU ASISTENTE IA",
	"VAYA, TIENES UNA NUEVA TAREA",
	"ESTA TAREA SE ENTREGA A LAS 1:00PM",
	"SI TRABAJAMOS JUNTOS PODREMOS TERMINAR A TIEMPO",
	"¡MANOS A LA OBRA!"
]

var cdialogos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cdialogos = 0
	get_tree().paused = true
	$AnimationGena.play("Elevacion")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if cdialogos < dialogos.size():
		if cdialogos <= 1:
			$AnimationGena.play("ChecklistDefault")
		if cdialogos == 2:
			$AnimationGena.play("nuevaTarea")
			$Gena.flip_h = true
			$TablonTareas.show()
			$sndTarea.play()
			$AnimationInterface.play("EntradaTablonTareas")
		if cdialogos == 3:
			$AnimationGena.play("ChecklistDefault")
			
		if cdialogos == 4:
			$AnimationGena.play("VeryHappy")
			
		if cdialogos == 5:
			$Gena.flip_h = false
			$AnimationGena.play("ChecklistDefault")
			
			
		$AnimationTextBox.play("show")
		$TextBox/Label.text = dialogos[cdialogos]
		cdialogos += 1
	elif cdialogos >= dialogos.size():
		$Gena.flip_h = false
		$TextBox.hide()
		$AnimationGena.play("FliyingAway")

func _on_animation_gena_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Elevacion":
		$AnimationGena.play("ChecklistDefault")
		$TextBox/Label.text = dialogos[cdialogos]
		cdialogos += 1
		$TextBox.show()
		$AnimationTextBox.play("show")
	
	if anim_name == "FliyingAway":
		get_tree().paused = false
		queue_free()


func _on_animation_interface_animation_finished(anim_name: StringName) -> void:
	
	# ESTO DA ERROR SI SE EJECUTA EL NODO GENA INDIVIDUALMENTE, YA QUE NO ENCUENTRA LAS VARIABLES
	var tablon = get_parent().get_node("TablonTareas2")
	var notas = get_parent().get_node("Notas")
	var entregable = get_parent().get_node("entregable")
	
	if anim_name == "EntradaTablonTareas":
		tablon.show()
		notas.show()
		entregable.show()
