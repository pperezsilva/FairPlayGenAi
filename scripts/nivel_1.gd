extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Reinicio de variables globales
	global.select = ""
	global.action = false
	global.paragraph = [0,0,0]
	global.musicfast = false
	
	$AnimationGena.play("GenaAparece")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.action == true:
		$AnimInterface.play("Time")


func _on_animation_gena_animation_finished(anim_name: StringName) -> void:
	if anim_name == "GenaAparece":
		$AnimationGena.play("GenaFlotando")


func _on_btn_pausa_pressed() -> void:
	print("Boton de Pausa Presionado")
	await get_tree().create_timer(0.2).timeout
	$CanvasLayer/menuPausa.pause()
