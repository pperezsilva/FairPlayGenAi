extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$"../Buttonchange".hide()
	$"../Buttonchange2".hide()
	$"../Buttonchange3".hide()
	
	$"../Notas/Edit".hide()
	$"../Notas/Edit2".hide()
	$"../Notas/Edit3".hide()
	
	$"../Notas/BotonEscribir".hide()
	$"../Notas/BotonEscribir2".hide()
	$"../Notas/BotonEscribir3".hide()
	
	if $GloboTexto.visible:
		$GloboTexto.hide()
		$ButtonGenerate.hide()
	else:
		$GloboTexto.show()
		$ButtonGenerate.show()
