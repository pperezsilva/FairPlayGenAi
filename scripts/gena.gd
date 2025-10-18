extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	$AnimationGena.play("Elevacion")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_button_pressed() -> void:
	$TextBox.hide()
	$AnimationGena.play("FliyingAway")


#CREAR ARRAY PARA LAS ANIMACION Y PARA LOS MENSAJES


func _on_animation_gena_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Elevacion":
		$AnimationGena.play("ChecklistDefault")
		$TextBox.show()
		$AnimationTextBox.play("show")
	
	if anim_name == "FliyingAway":
		get_tree().paused = false
		queue_free()
	
