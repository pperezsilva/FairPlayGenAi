extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$topic1.text = "Ventaja ambiental"
	$topic2.text = "Retos / Limitaciones"
	$topic3.text = "Aplicacion Practica"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_btn_escribir_pressed() -> void:
	$Escribiendo.show()
	$AnimationEscribiendo.play("Escribiendo")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_btn_escribir_2_pressed() -> void:
	$Escribiendo2.show()
	$AnimationEscribiendo.play("Escribiendo2")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_btn_escribir_3_pressed() -> void:
	$Escribiendo3.show()
	$AnimationEscribiendo.play("Escribiendo3")
	global.action = true
	
	$btnEscribir.hide()
	$btnEscribir2.hide()
	$btnEscribir3.hide()

func _on_animation_escribiendo_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Escribiendo":
		$Escribiendo.hide()
		
		$parrafo1.text = global.select
		$parrafo1.show()
		
		global.paragraph[0] = 1
		global.action = false
	
	if anim_name == "Escribiendo2":
		$Escribiendo2.hide()
		
		$parrafo2.text = global.select
		$parrafo2.show()
		
		global.paragraph[1] = 1
		global.action = false
	
	if anim_name == "Escribiendo3":
		$Escribiendo3.hide()
		
		$parrafo3.text = global.select
		$parrafo3.show()
		
		global.paragraph[2] = 1
		global.action = false
