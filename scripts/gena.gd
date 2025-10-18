extends Control
var dialogos = [
	"Hola, Bienvenido!",
	"¡Soy Gena!, Seré tu asistente IA"
]
var cdialogos = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cdialogos = 0
	get_tree().paused = true
	$AnimationGena.play("Elevacion")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_button_pressed() -> void:
	if cdialogos <= 1:
		$AnimationTextBox.play("show")
		$TextBox/Label.text = dialogos[cdialogos]
		cdialogos += 1
	elif cdialogos >= 2:
		$TextBox.hide()
		$AnimationGena.play("FliyingAway")


#CREAR ARRAY PARA LAS ANIMACION Y PARA LOS MENSAJES


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
	
